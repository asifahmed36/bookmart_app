import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../services/api_service.dart';

class CartScreen extends StatefulWidget {
  final List<CartItem> cartItems;
  final void Function(String bookId, int delta) onUpdateQuantity;
  final void Function({
    required int totalAmount,
    required String paymentMethod,
    required String address,
  })
  onPlaceOrder;

  const CartScreen({
    super.key,
    required this.cartItems,
    required this.onUpdateQuantity,
    required this.onPlaceOrder,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ApiService _apiService = ApiService();
  bool _insideDhaka = true;
  String _paymentMethod = 'bKash';
  final TextEditingController _couponController = TextEditingController();
  final TextEditingController _addressController = TextEditingController(
    text: 'House 12, Road 5, Dhanmondi, Dhaka',
  );
  int _couponDiscount = 0;
  String? _couponMessage;

  int get _subtotal =>
      widget.cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  int get _deliveryFee =>
      widget.cartItems.isEmpty ? 0 : (_insideDhaka ? 50 : 90);

  int get _payableTotal =>
      (_subtotal + _deliveryFee - _couponDiscount).clamp(0, 999999);

  void _applyCoupon() {
    final discount = _apiService.validateCoupon(_couponController.text);
    setState(() {
      _couponDiscount = discount;
      _couponMessage = discount > 0
          ? 'Coupon applied! TK $discount discount added.'
          : 'Invalid coupon code (Try ROKOMARI50).';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cartItems.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.remove_shopping_cart_outlined,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 12),
            Text(
              'Your cart is currently empty!',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text('Browse books on the Home tab to add items to your cart.'),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ...widget.cartItems.map(
          (item) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 64,
                  decoration: BoxDecoration(
                    color: item.book.coverColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(item.book.coverIcon, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.book.title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item.book.author,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'TK ${item.book.price} x ${item.quantity} = TK ${item.totalPrice}',
                        style: const TextStyle(
                          color: Color(0xFF009EE2),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          widget.onUpdateQuantity(item.book.id, -1),
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () => widget.onUpdateQuantity(item.book.id, 1),
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _couponController,
                      decoration: const InputDecoration(
                        hintText: 'Enter promo code (e.g. ROKOMARI50)',
                        isDense: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _applyCoupon,
                    child: const Text('Apply'),
                  ),
                ],
              ),
              if (_couponMessage != null) ...[
                const SizedBox(height: 6),
                Text(
                  _couponMessage!,
                  style: TextStyle(
                    fontSize: 12,
                    color: _couponDiscount > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Delivery Zone & Shipping Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      value: true,
                      groupValue: _insideDhaka,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Inside Dhaka (TK 50)'),
                      onChanged: (v) => setState(() => _insideDhaka = v!),
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      value: false,
                      groupValue: _insideDhaka,
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Outside Dhaka (TK 90)'),
                      onChanged: (v) => setState(() => _insideDhaka = v!),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Full Delivery Address & Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    [
                      'bKash',
                      'Nagad',
                      'Cash on Delivery',
                      'Card / SSLCommerz',
                    ].map((method) {
                      return ChoiceChip(
                        label: Text(method),
                        selected: _paymentMethod == method,
                        onSelected: (_) =>
                            setState(() => _paymentMethod = method),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              _PriceLine(label: 'Subtotal', amount: _subtotal),
              _PriceLine(label: 'Shipping Fee', amount: _deliveryFee),
              if (_couponDiscount > 0)
                _PriceLine(
                  label: 'Promo Discount',
                  amount: -_couponDiscount,
                  isDiscount: true,
                ),
              const Divider(height: 20),
              _PriceLine(
                label: 'Total Payable',
                amount: _payableTotal,
                isBold: true,
              ),
              const SizedBox(height: 14),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {
                    widget.onPlaceOrder(
                      totalAmount: _payableTotal,
                      paymentMethod: _paymentMethod,
                      address: _addressController.text.trim(),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF33C24D),
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.check_circle_outline),
                  label: Text(
                    'Confirm Order (TK $_payableTotal)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PriceLine extends StatelessWidget {
  final String label;
  final int amount;
  final bool isBold;
  final bool isDiscount;

  const _PriceLine({
    required this.label,
    required this.amount,
    this.isBold = false,
    this.isDiscount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 16 : 14,
            ),
          ),
          Text(
            isDiscount ? '-TK ${amount.abs()}' : 'TK $amount',
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: isBold ? 17 : 14,
              color: isDiscount
                  ? Colors.green
                  : (isBold ? const Color(0xFF009EE2) : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
