import 'package:flutter/material.dart';

void main() {
  runApp(const RokomariCloneApp());
}

class RokomariCloneApp extends StatelessWidget {
  const RokomariCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookMart - Rokomari Style Bookstore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF009EE2), // Rokomari sky-blue accent
          primary: const Color(0xFF009EE2),
          secondary: const Color(0xFF33C24D), // Rokomari green CTA accent
          surface: const Color(0xFFF8FAFC),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF1E293B),
          elevation: 0,
          scrolledUnderElevation: 1,
        ),
      ),
      home: const AppRootGate(),
    );
  }
}

// ============================================================================
// DATA MODELS (lib/models/)
// ============================================================================

class UserProfile {
  final String id;
  final String fullName;
  final String email;
  final String phone;

  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
  });
}

class Book {
  final String id;
  final String title;
  final String author;
  final String publisher;
  final String category;
  final int originalPrice;
  final int price;
  final double rating;
  final int reviewCount;
  final int pages;
  final String edition;
  final bool inStock;
  final Color coverColor;
  final IconData coverIcon;
  final String description;
  final List<String> samplePages;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.publisher,
    required this.category,
    required this.originalPrice,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.pages,
    required this.edition,
    this.inStock = true,
    required this.coverColor,
    required this.coverIcon,
    required this.description,
    required this.samplePages,
  });

  int get discountPercent =>
      (((originalPrice - price) / originalPrice) * 100).round();
}

class CartItem {
  final Book book;
  int quantity;

  CartItem({required this.book, this.quantity = 1});
}

class OrderRecord {
  final String orderId;
  final DateTime createdAt;
  final List<CartItem> items;
  final int totalAmount;
  final String paymentMethod;
  final String address;
  final String status;

  OrderRecord({
    required this.orderId,
    required this.createdAt,
    required this.items,
    required this.totalAmount,
    required this.paymentMethod,
    required this.address,
    required this.status,
  });
}

// ============================================================================
// SAMPLE CATALOG DATA (lib/data/)
// ============================================================================

const List<Book> kSampleBooks = [
  Book(
    id: 'b1',
    title: 'Deyal (The Wall)',
    author: 'Humayun Ahmed',
    publisher: 'Anyaprokash',
    category: 'Fiction',
    originalPrice: 400,
    price: 300,
    rating: 4.9,
    reviewCount: 412,
    pages: 207,
    edition: '15th Print, 2024',
    coverColor: Color(0xFF0F4C81),
    coverIcon: Icons.menu_book_rounded,
    description: 'A gripping historical and political novel by Humayun Ahmed. Set during a turbulent era in Bangladesh, the story weaves the personal journey of young Avanti with key historical events.',
    samplePages: [
      'Page 1:\n\nAvanti stood on the veranda watching the pouring rain. Holding a cup of tea, her grandfather Sarfaraz Khan said, "Do you know the greatest mystery of human life? Nobody knows what the very next moment holds."',
      'Page 2:\n\nThe streets of Dhaka were unusually quiet that morning. Announcements echoed over the radio as Sarfaraz Khan wiped his glasses and remarked, "History never moves in a straight line, Avanti; it builds its own walls."',
      'Page 3:\n\nShafiq stepped off the rickshaw and folded his umbrella. Today was his first day tutoring Avanti, and the gatekeeper watched him with curious eyes.',
    ],
  ),
  Book(
    id: 'b2',
    title: 'Paradoxical Sajid',
    author: 'Arif Azad',
    publisher: 'Somokalin Prokashon',
    category: 'Islamic Books',
    originalPrice: 280,
    price: 210,
    rating: 4.8,
    reviewCount: 685,
    pages: 176,
    edition: 'Revised Edition, 2025',
    coverColor: Color(0xFF0D6E52),
    coverIcon: Icons.auto_stories_rounded,
    description: 'A collection of thought-provoking dialogues featuring university student Sajid, addressing philosophical, scientific, and spiritual questions through clear reasoning and storytelling.',
    samplePages: [
      'Page 1:\n\nSajid took a sip of his tea and asked, "Tell me, does this vast universe operate randomly, or does it follow precise laws?"\nI replied, "It follows the precise laws of physics."',
      'Page 2:\n\n"Exactly," Sajid smiled. "Wherever there is systematic order and law, reasoning points toward an organizer behind that system. Let us unpack your question step by step."',
    ],
  ),
  Book(
    id: 'b3',
    title: 'The Complete Feluda - Vol 1',
    author: 'Satyajit Ray',
    publisher: 'Ananda Publishers',
    category: 'Mystery & Thriller',
    originalPrice: 650,
    price: 520,
    rating: 4.9,
    reviewCount: 329,
    pages: 480,
    edition: 'Hardcover Edition',
    coverColor: Color(0xFF9E2A2B),
    coverIcon: Icons.search_rounded,
    description: 'Follow private investigator Pradosh C. Mitter (Feluda), his cousin Topshe, and thriller writer Lalmohan Ganguly (Jatayu) on unforgettable detective adventures across South Asia.',
    samplePages: [
      'Page 1:\n\nAt 21 Rajani Sen Road, when Feluda leaned back in his armchair with that sharp glint in his eyes, I knew right away that a fascinating new case had arrived.',
      'Page 2:\n\nLalmohan Babu burst into the room and exclaimed, "Mr. Mitter, there is word of a hidden treasure inside the golden fortress of Rajasthan! Are you ready?" Feluda smiled and replied, "My Magajastra (brain-weapon) is always ready."',
    ],
  ),
  Book(
    id: 'b4',
    title: 'Atomic Habits',
    author: 'James Clear',
    publisher: 'Penguin Random House',
    category: 'Self-Help',
    originalPrice: 380,
    price: 285,
    rating: 4.7,
    reviewCount: 254,
    pages: 264,
    edition: '4th Impression',
    coverColor: Color(0xFFB45309),
    coverIcon: Icons.trending_up_rounded,
    description: 'An easy and proven framework for building good habits and breaking bad ones. Discover how tiny 1% daily improvements compound into remarkable long-term results.',
    samplePages: [
      'Page 1:\n\nHabits are the compound interest of self-improvement. If you can get just 1 percent better each day, you will end up 37 times better by the time the year is done.',
      'Page 2:\n\nFocus on systems instead of goals. Winners and losers share the same goals; what differentiates them is the system of small daily habits they follow consistently.',
    ],
  ),
  Book(
    id: 'b5',
    title: 'Ami Topu (I Am Topu)',
    author: 'Muhammed Zafar Iqbal',
    publisher: 'Pearl Publications',
    category: 'Fiction',
    originalPrice: 250,
    price: 190,
    rating: 4.8,
    reviewCount: 510,
    pages: 152,
    edition: '12th Print',
    coverColor: Color(0xFF4F46E5),
    coverIcon: Icons.psychology_rounded,
    description: 'A deeply moving coming-of-age story about a teenage boy overcoming loneliness and hardship through friendship and his extraordinary gift for mathematics.',
    samplePages: [
      'Page 1:\n\nMy name is Topu—Sheikh Topu. At home, it is not that people dislike me; rather, nobody really notices that I am there at all.',
      'Page 2:\n\nNumbers, however, are different. Numbers never lie and never ignore you. Whenever I look at a complex equation, the solution lights up clearly inside my mind.',
    ],
  ),
  Book(
    id: 'b6',
    title: 'Mastering Flutter App Development',
    author: 'Tanvir Ahmed',
    publisher: 'Systech Publications',
    category: 'Tech & Programming',
    originalPrice: 550,
    price: 420,
    rating: 4.6,
    reviewCount: 118,
    pages: 340,
    edition: '2026 Edition',
    coverColor: Color(0xFF0284C7),
    coverIcon: Icons.phone_android_rounded,
    description: 'A hands-on guide covering Dart fundamentals, state management, REST API integration, payment gateways, and building full-featured e-commerce apps in Flutter.',
    samplePages: [
      'Page 1:\n\nIn Flutter, everything on screen is a Widget. Understanding how StatelessWidget and StatefulWidget compose together lets you build responsive mobile interfaces rapidly.',
      'Page 2:\n\nFor e-commerce applications, separating your product catalog, cart state, and checkout flow into clean modules keeps your codebase maintainable as it scales.',
    ],
  ),
];

const List<String> kCategories = [
  'All Books',
  'Fiction',
  'Islamic Books',
  'Mystery & Thriller',
  'Self-Help',
  'Tech & Programming',
];

// ============================================================================
// AUTH GATE & LOGIN / REGISTRATION SCREEN (lib/screens/auth_screen.dart)
// ============================================================================

class AppRootGate extends StatefulWidget {
  const AppRootGate({super.key});

  @override
  State<AppRootGate> createState() => _AppRootGateState();
}

class _AppRootGateState extends State<AppRootGate> {
  UserProfile? _currentUser;
  bool _isGuest = false;

  void _handleAuthenticated(UserProfile user) {
    setState(() {
      _currentUser = user;
      _isGuest = false;
    });
  }

  void _handleContinueAsGuest() {
    setState(() {
      _currentUser = null;
      _isGuest = true;
    });
  }

  void _handleLogout() {
    setState(() {
      _currentUser = null;
      _isGuest = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser == null && !_isGuest) {
      return AuthScreen(
        onAuthenticated: _handleAuthenticated,
        onContinueAsGuest: _handleContinueAsGuest,
      );
    }

    return MainNavigationShell(
      currentUser: _currentUser,
      onLogoutOrSignIn: _handleLogout,
    );
  }
}

class AuthScreen extends StatefulWidget {
  final ValueChanged<UserProfile> onAuthenticated;
  final VoidCallback onContinueAsGuest;

  const AuthScreen({
    super.key,
    required this.onAuthenticated,
    required this.onContinueAsGuest,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLogin = true;
  bool _usePasswordLogin = false;
  bool _isOtpSent = false;
  bool _obscurePassword = true;
  int _resendCountdown = 60;
  String? _otpError;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(
    text: 'reader@bookmart.com',
  );
  final TextEditingController _phoneController = TextEditingController(
    text: '01712345678',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: '123456',
  );
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  void _sendOtp() {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isOtpSent = true;
      _otpError = null;
      _otpController.clear();
      _resendCountdown = 60;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Verification code sent to ${_phoneController.text.trim()} (Demo code: 1234)',
        ),
        backgroundColor: const Color(0xFF009EE2),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _verifyOtp() {
    final code = _otpController.text.trim();
    if (code == '1234' || code.length == 4) {
      final user = UserProfile(
        id: 'USR-${DateTime.now().millisecondsSinceEpoch % 10000}',
        fullName: _nameController.text.trim().isEmpty
            ? 'BookMart Reader'
            : _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
      );
      widget.onAuthenticated(user);
    } else {
      setState(() {
        _otpError = 'Invalid code! Please enter the demo code 1234.';
      });
    }
  }

  void _submitPasswordLogin() {
    if (!_formKey.currentState!.validate()) return;
    final user = UserProfile(
      id: 'USR-${DateTime.now().millisecondsSinceEpoch % 10000}',
      fullName: _nameController.text.trim().isEmpty
          ? 'BookMart Reader'
          : _nameController.text.trim(),
      email: _emailController.text.trim(),
      phone: _phoneController.text.trim(),
    );
    widget.onAuthenticated(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: _isOtpSent ? _buildOtpView() : _buildCredentialsForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCredentialsForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFF009EE2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.auto_stories,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'BookMart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _isLogin
                ? 'Sign in with Mobile OTP Verification'
                : 'Create an account with Verified Phone Number',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
          const SizedBox(height: 20),

          // Toggle Tabs (Login / Register)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _isLogin = true;
                      _isOtpSent = false;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: _isLogin ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isLogin
                              ? const Color(0xFF009EE2)
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _isLogin = false;
                      _isOtpSent = false;
                    }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: !_isLogin ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: !_isLogin
                              ? const Color(0xFF009EE2)
                              : Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          if (!_isLogin) ...[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (val) => (val == null || val.trim().length < 2)
                  ? 'Please enter your full name'
                  : null,
            ),
            const SizedBox(height: 14),
          ],

          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Mobile Number (Bangladesh)',
              hintText: '01XXXXXXXXX',
              prefixText: '+88 ',
              prefixIcon: Icon(Icons.phone_android_rounded),
              border: OutlineInputBorder(),
            ),
            validator: (val) => (val == null || val.trim().length < 11)
                ? 'Enter a valid 11-digit mobile number'
                : null,
          ),
          const SizedBox(height: 14),

          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(Icons.email_outlined),
              border: OutlineInputBorder(),
            ),
            validator: (val) => (val == null || !val.contains('@'))
                ? 'Enter a valid email address'
                : null,
          ),
          const SizedBox(height: 14),

          if (_usePasswordLogin) ...[
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              validator: (val) => (val == null || val.length < 6)
                  ? 'Password must be at least 6 characters'
                  : null,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: _submitPasswordLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009EE2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _isLogin ? 'Login with Password' : 'Create Account',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ] else ...[
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: _sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF009EE2),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(Icons.send_rounded, size: 18),
                label: Text(
                  _isLogin
                      ? 'Send Verification Code (OTP)'
                      : 'Verify Phone & Register',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
          const SizedBox(height: 10),

          // Toggle between OTP and Password login
          TextButton(
            onPressed: () =>
                setState(() => _usePasswordLogin = !_usePasswordLogin),
            child: Text(
              _usePasswordLogin
                  ? '← Or use fast Mobile OTP Verification'
                  : 'Or log in with Password',
              style: const TextStyle(color: Color(0xFF009EE2), fontSize: 13),
            ),
          ),

          const Divider(),
          TextButton.icon(
            onPressed: widget.onContinueAsGuest,
            icon: const Icon(Icons.arrow_forward_rounded, size: 18),
            label: const Text('Continue as Guest'),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // OTP Header
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF009EE2).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mark_email_read_rounded,
            color: Color(0xFF009EE2),
            size: 32,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Verification Code',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'We have sent a 4-digit verification code to +88 ' +
              _phoneController.text.trim(),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
        const SizedBox(height: 14),

        // Testing Helper Notice
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.amber.shade200),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.vpn_key_rounded, size: 16, color: Colors.amber),
              SizedBox(width: 8),
              Text(
                'Demo Verification Code: 1234',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // 4-Digit OTP Input Field
        TextField(
          controller: _otpController,
          keyboardType: TextInputType.number,
          maxLength: 4,
          textAlign: TextAlign.center,
          autofocus: true,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 16,
          ),
          decoration: InputDecoration(
            counterText: '',
            hintText: '----',
            hintStyle: const TextStyle(letterSpacing: 16),
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF009EE2)),
            ),
            errorText: _otpError,
          ),
          onChanged: (val) {
            if (val.length == 4) {
              _verifyOtp();
            }
          },
        ),
        const SizedBox(height: 16),

        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: _verifyOtp,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF33C24D),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Verify & Login',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 12),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () => setState(() => _isOtpSent = false),
              icon: const Icon(Icons.arrow_back, size: 16),
              label: const Text('Change Number'),
            ),
            TextButton(
              onPressed: () => _sendOtp(),
              child: const Text('Resend Code'),
            ),
          ],
        ),
      ],
    );
  }
}

class MainNavigationShell extends StatefulWidget {
  final UserProfile? currentUser;
  final VoidCallback onLogoutOrSignIn;

  const MainNavigationShell({
    super.key,
    required this.currentUser,
    required this.onLogoutOrSignIn,
  });

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _selectedIndex = 0;
  String _selectedCategory = 'All Books';
  String _searchQuery = '';
  final Set<String> _wishlistIds = {'b1'};
  final List<CartItem> _cart = [CartItem(book: kSampleBooks[0], quantity: 1)];
  final List<OrderRecord> _orders = [];

  int get _totalCartCount => _cart.fold(0, (sum, item) => sum + item.quantity);

  void _addToCart(Book book, {bool openCart = false}) {
    setState(() {
      final existingIndex = _cart.indexWhere(
        (element) => element.book.id == book.id,
      );
      if (existingIndex >= 0) {
        _cart[existingIndex].quantity += 1;
      } else {
        _cart.add(CartItem(book: book, quantity: 1));
      }
      if (openCart) {
        _selectedIndex = 2;
      }
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"${book.title}" added to cart!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'VIEW CART',
          textColor: Colors.amberAccent,
          onPressed: () {
            setState(() => _selectedIndex = 2);
          },
        ),
      ),
    );
  }

  void _toggleWishlist(String bookId) {
    setState(() {
      if (_wishlistIds.contains(bookId)) {
        _wishlistIds.remove(bookId);
      } else {
        _wishlistIds.add(bookId);
      }
    });
  }

  void _updateCartQuantity(String bookId, int delta) {
    setState(() {
      final index = _cart.indexWhere((item) => item.book.id == bookId);
      if (index >= 0) {
        _cart[index].quantity += delta;
        if (_cart[index].quantity <= 0) {
          _cart.removeAt(index);
        }
      }
    });
  }

  void _placeOrder({
    required int totalAmount,
    required String paymentMethod,
    required String address,
  }) {
    final newOrder = OrderRecord(
      orderId: 'ROK-${100420 + _orders.length + 1}',
      createdAt: DateTime.now(),
      items: _cart
          .map((e) => CartItem(book: e.book, quantity: e.quantity))
          .toList(),
      totalAmount: totalAmount,
      paymentMethod: paymentMethod,
      address: address,
      status: 'Order Confirmed (Processing)',
    );
    setState(() {
      _orders.insert(0, newOrder);
      _cart.clear();
      _selectedIndex = 3; // Navigate to Orders/Wishlist screen
    });
  }

  void _openBookDetails(Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BookDetailScreen(
          book: book,
          isWishlisted: _wishlistIds.contains(book.id),
          onToggleWishlist: () => _toggleWishlist(book.id),
          onAddToCart: () => _addToCart(book),
          onBuyNow: () {
            Navigator.of(context).pop();
            _addToCart(book, openCart: true);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(
        selectedCategory: _selectedCategory,
        searchQuery: _searchQuery,
        wishlistIds: _wishlistIds,
        onCategoryChanged: (cat) => setState(() => _selectedCategory = cat),
        onSearchChanged: (q) => setState(() => _searchQuery = q),
        onBookTap: _openBookDetails,
        onAddToCart: _addToCart,
        onToggleWishlist: _toggleWishlist,
      ),
      AuthorsPublishersScreen(
        onBookTap: _openBookDetails,
        onAddToCart: _addToCart,
      ),
      CartScreen(
        cartItems: _cart,
        onUpdateQuantity: _updateCartQuantity,
        onPlaceOrder: _placeOrder,
      ),
      OrdersAndWishlistScreen(
        orders: _orders,
        wishlistBooks: kSampleBooks
            .where((book) => _wishlistIds.contains(book.id))
            .toList(),
        onBookTap: _openBookDetails,
        onAddToCart: _addToCart,
        onRemoveWishlist: _toggleWishlist,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF009EE2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.auto_stories, color: Colors.white, size: 20),
                  SizedBox(width: 6),
                  Text(
                    'BookMart',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.currentUser != null
                    ? 'Hi, ${widget.currentUser!.fullName}'
                    : 'Guest Mode',
                style: const TextStyle(fontSize: 13, color: Colors.black54),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Wishlist',
            onPressed: () => setState(() => _selectedIndex = 3),
            icon: Badge(
              isLabelVisible: _wishlistIds.isNotEmpty,
              label: Text('${_wishlistIds.length}'),
              child: const Icon(Icons.favorite_border_rounded),
            ),
          ),
          IconButton(
            tooltip: 'Cart',
            onPressed: () => setState(() => _selectedIndex = 2),
            icon: Badge(
              isLabelVisible: _totalCartCount > 0,
              label: Text('$_totalCartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
          IconButton(
            tooltip: widget.currentUser != null ? 'Logout' : 'Login / Register',
            onPressed: widget.onLogoutOrSignIn,
            icon: Icon(
              widget.currentUser != null
                  ? Icons.logout_rounded
                  : Icons.login_rounded,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (idx) => setState(() => _selectedIndex = idx),
        backgroundColor: Colors.white,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.people_outline_rounded),
            selectedIcon: Icon(Icons.people_rounded),
            label: 'Authors',
          ),
          NavigationDestination(
            icon: Badge(
              isLabelVisible: _totalCartCount > 0,
              label: Text('$_totalCartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            selectedIcon: Badge(
              isLabelVisible: _totalCartCount > 0,
              label: Text('$_totalCartCount'),
              child: const Icon(Icons.shopping_cart_rounded),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long_rounded),
            label: 'Orders',
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 1. HOME SCREEN (Search, Promo Banner, Categories, Book Grid)
// ============================================================================

class HomeScreen extends StatelessWidget {
  final String selectedCategory;
  final String searchQuery;
  final Set<String> wishlistIds;
  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onAddToCart;
  final ValueChanged<String> onToggleWishlist;

  const HomeScreen({
    super.key,
    required this.selectedCategory,
    required this.searchQuery,
    required this.wishlistIds,
    required this.onCategoryChanged,
    required this.onSearchChanged,
    required this.onBookTap,
    required this.onAddToCart,
    required this.onToggleWishlist,
  });

  List<Book> get _filteredBooks {
    return kSampleBooks.where((book) {
      final matchesCategory =
          selectedCategory == 'All Books' || book.category == selectedCategory;
      final q = searchQuery.trim().toLowerCase();
      final matchesSearch =
          q.isEmpty ||
          book.title.toLowerCase().contains(q) ||
          book.author.toLowerCase().contains(q) ||
          book.publisher.toLowerCase().contains(q);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final books = _filteredBooks;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Search Bar
        TextField(
          onChanged: onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Search by book title, author, or publisher...',
            prefixIcon: const Icon(Icons.search, color: Color(0xFF009EE2)),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Promotional Banner
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF009EE2), Color(0xFF026AA7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'BOOK FAIR SPECIAL',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Up to 25% OFF on All Bestsellers!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Use code ROKOMARI50 at checkout for an extra TK 50 off',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.local_library_rounded,
                size: 56,
                color: Colors.white24,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Category Filter Chips
        SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: kCategories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final cat = kCategories[index];
              final isSelected = cat == selectedCategory;
              return ChoiceChip(
                label: Text(cat),
                selected: isSelected,
                onSelected: (_) => onCategoryChanged(cat),
                selectedColor: const Color(0xFF009EE2),
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 18),

        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedCategory == 'All Books'
                  ? 'Popular & Bestselling Books'
                  : selectedCategory,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            Text(
              '${books.length} books',
              style: const TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 12),

        if (books.isEmpty)
          Container(
            padding: const EdgeInsets.all(32),
            alignment: Alignment.center,
            child: const Column(
              children: [
                Icon(Icons.menu_book_outlined, size: 48, color: Colors.grey),
                SizedBox(height: 12),
                Text('No books found matching your search.'),
              ],
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: books.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 220,
              mainAxisExtent: 325,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(
                book: book,
                isWishlisted: wishlistIds.contains(book.id),
                onTap: () => onBookTap(book),
                onAddToCart: () => onAddToCart(book),
                onToggleWishlist: () => onToggleWishlist(book.id),
              );
            },
          ),
      ],
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  final bool isWishlisted;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;
  final VoidCallback onToggleWishlist;

  const BookCard({
    super.key,
    required this.book,
    required this.isWishlisted,
    required this.onTap,
    required this.onAddToCart,
    required this.onToggleWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Book Cover Representation with Discount Badge
            Stack(
              children: [
                Container(
                  height: 140,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: book.coverColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(book.coverIcon, color: Colors.white70, size: 38),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            book.title,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE11D48),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${book.discountPercent}% OFF',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: InkWell(
                    onTap: onToggleWishlist,
                    borderRadius: BorderRadius.circular(20),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white.withOpacity(0.9),
                      child: Icon(
                        isWishlisted
                            ? Icons.favorite_rounded
                            : Icons.favorite_border_rounded,
                        size: 17,
                        color: isWishlisted ? Colors.red : Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Book Metadata
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      book.author,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 15,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '${book.rating} (${book.reviewCount})',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          'TK ${book.price}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF009EE2),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'TK ${book.originalPrice}',
                          style: const TextStyle(
                            fontSize: 11,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      height: 34,
                      child: ElevatedButton.icon(
                        onPressed: onAddToCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF009EE2),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.add_shopping_cart, size: 15),
                        label: const Text(
                          'Add to Cart',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================================
// 2. BOOK DETAIL SCREEN + "LOOK INSIDE" SAMPLE READER
// ============================================================================

class BookDetailScreen extends StatelessWidget {
  final Book book;
  final bool isWishlisted;
  final VoidCallback onToggleWishlist;
  final VoidCallback onAddToCart;
  final VoidCallback onBuyNow;

  const BookDetailScreen({
    super.key,
    required this.book,
    required this.isWishlisted,
    required this.onToggleWishlist,
    required this.onAddToCart,
    required this.onBuyNow,
  });

  void _showLookInsideModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => LookInsideReaderSheet(book: book),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
        actions: [
          IconButton(
            onPressed: onToggleWishlist,
            icon: Icon(
              isWishlisted ? Icons.favorite : Icons.favorite_border,
              color: isWishlisted ? Colors.red : null,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Top Card: Cover + Primary Info
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Book Cover
                    Container(
                      width: 115,
                      height: 165,
                      decoration: BoxDecoration(
                        color: book.coverColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: book.coverColor.withOpacity(0.35),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(book.coverIcon, color: Colors.white, size: 42),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              book.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    // Details Column
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            book.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'By ${book.author}',
                            style: const TextStyle(
                              color: Color(0xFF009EE2),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Publisher: ${book.publisher}',
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${book.rating} (${book.reviewCount} reviews)',
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            children: [
                              Text(
                                'TK ${book.price}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                              Text(
                                'TK ${book.originalPrice}',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade50,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'Save ${book.discountPercent}%',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.green.shade700,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF33C24D),
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                book.inStock ? 'In Stock' : 'Out of Stock',
                                style: const TextStyle(
                                  color: Color(0xFF33C24D),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Signature Rokomari Feature: "Look Inside"
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showLookInsideModal(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF33C24D),
                      side: const BorderSide(
                        color: Color(0xFF33C24D),
                        width: 1.5,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.menu_book_rounded),
                    label: const Text(
                      'Look Inside (Read Sample Pages)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Summary & Specification Card
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Book Summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  book.description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
                const Divider(height: 28),
                const Text(
                  'Specifications',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _SpecRow(label: 'Title', value: book.title),
                _SpecRow(label: 'Author', value: book.author),
                _SpecRow(label: 'Publisher', value: book.publisher),
                _SpecRow(label: 'Category', value: book.category),
                _SpecRow(label: 'Length', value: '${book.pages} pages'),
                _SpecRow(label: 'Edition', value: book.edition),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onAddToCart,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    side: const BorderSide(color: Color(0xFF009EE2)),
                  ),
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Add to Cart'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onBuyNow,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF33C24D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                  ),
                  icon: const Icon(Icons.flash_on_rounded),
                  label: const Text(
                    'Buy Now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpecRow extends StatelessWidget {
  final String label;
  final String value;

  const _SpecRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(
              label,
              style: const TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}

class LookInsideReaderSheet extends StatefulWidget {
  final Book book;

  const LookInsideReaderSheet({super.key, required this.book});

  @override
  State<LookInsideReaderSheet> createState() => _LookInsideReaderSheetState();
}

class _LookInsideReaderSheetState extends State<LookInsideReaderSheet> {
  int _currentPage = 0;
  double _fontSize = 16;

  @override
  Widget build(BuildContext context) {
    final pages = widget.book.samplePages;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFDF7), // Warm paper tone
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Look Inside: ${widget.book.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      widget.book.author,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Decrease font size',
                onPressed: () =>
                    setState(() => _fontSize = (_fontSize - 2).clamp(13, 24)),
                icon: const Icon(Icons.text_decrease_rounded),
              ),
              IconButton(
                tooltip: 'Increase font size',
                onPressed: () =>
                    setState(() => _fontSize = (_fontSize + 2).clamp(13, 24)),
                icon: const Icon(Icons.text_increase_rounded),
              ),
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const Divider(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.amber.shade100),
              ),
              child: SingleChildScrollView(
                child: Text(
                  pages[_currentPage],
                  style: TextStyle(
                    fontSize: _fontSize,
                    height: 1.7,
                    color: const Color(0xFF1E293B),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                onPressed: _currentPage > 0
                    ? () => setState(() => _currentPage--)
                    : null,
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 15),
                label: const Text('Previous'),
              ),
              Text(
                'Sample Page ${_currentPage + 1} of ${pages.length}',
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              OutlinedButton.icon(
                onPressed: _currentPage < pages.length - 1
                    ? () => setState(() => _currentPage++)
                    : null,
                icon: const Icon(Icons.arrow_forward_ios_rounded, size: 15),
                label: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// 3. AUTHORS & PUBLISHERS DIRECTORY SCREEN
// ============================================================================

class AuthorsPublishersScreen extends StatefulWidget {
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onAddToCart;

  const AuthorsPublishersScreen({
    super.key,
    required this.onBookTap,
    required this.onAddToCart,
  });

  @override
  State<AuthorsPublishersScreen> createState() =>
      _AuthorsPublishersScreenState();
}

class _AuthorsPublishersScreenState extends State<AuthorsPublishersScreen> {
  String? _selectedAuthor;

  @override
  Widget build(BuildContext context) {
    final authors = kSampleBooks.map((b) => b.author).toSet().toList();
    final filteredBooks = _selectedAuthor == null
        ? kSampleBooks
        : kSampleBooks.where((b) => b.author == _selectedAuthor).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Popular Authors',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            FilterChip(
              label: const Text('All Authors'),
              selected: _selectedAuthor == null,
              onSelected: (_) => setState(() => _selectedAuthor = null),
            ),
            ...authors.map(
              (author) => FilterChip(
                avatar: const CircleAvatar(
                  backgroundColor: Color(0xFF009EE2),
                  child: Icon(Icons.person, size: 14, color: Colors.white),
                ),
                label: Text(author),
                selected: _selectedAuthor == author,
                onSelected: (_) => setState(() => _selectedAuthor = author),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          _selectedAuthor == null
              ? 'Books by All Authors (${filteredBooks.length})'
              : 'Books by $_selectedAuthor (${filteredBooks.length})',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...filteredBooks.map(
          (book) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: Colors.grey.shade200),
            ),
            child: ListTile(
              onTap: () => widget.onBookTap(book),
              leading: CircleAvatar(
                backgroundColor: book.coverColor,
                child: Icon(book.coverIcon, color: Colors.white, size: 20),
              ),
              title: Text(
                book.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${book.author} • ${book.publisher}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'TK ${book.price}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF009EE2),
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add_shopping_cart_rounded,
                      color: Color(0xFF33C24D),
                    ),
                    onPressed: () => widget.onAddToCart(book),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 4. CART & CHECKOUT SCREEN (bKash, Nagad, COD, Coupon, Delivery Zone)
// ============================================================================

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
  bool _insideDhaka = true;
  String _paymentMethod = 'bKash';
  final TextEditingController _couponController = TextEditingController();
  final TextEditingController _addressController = TextEditingController(
    text: 'House 12, Road 5, Dhanmondi, Dhaka',
  );
  int _couponDiscount = 0;
  String? _couponMessage;

  int get _subtotal => widget.cartItems.fold(
    0,
    (sum, item) => sum + (item.book.price * item.quantity),
  );

  int get _deliveryFee =>
      widget.cartItems.isEmpty ? 0 : (_insideDhaka ? 50 : 90);

  int get _payableTotal =>
      (_subtotal + _deliveryFee - _couponDiscount).clamp(0, 999999);

  void _applyCoupon() {
    final code = _couponController.text.trim().toUpperCase();
    setState(() {
      if (code == 'ROKOMARI50') {
        _couponDiscount = 50;
        _couponMessage = 'Coupon applied! TK 50 discount added.';
      } else {
        _couponDiscount = 0;
        _couponMessage = 'Invalid coupon code (Try ROKOMARI50).';
      }
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
        // Cart Items List
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
                        'TK ${item.book.price} x ${item.quantity} = TK ${item.book.price * item.quantity}',
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

        // Coupon Section
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

        // Delivery & Payment Selection
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

        // Checkout Summary
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

// ============================================================================
// 5. ORDERS TRACKING & WISHLIST SCREEN
// ============================================================================

class OrdersAndWishlistScreen extends StatelessWidget {
  final List<OrderRecord> orders;
  final List<Book> wishlistBooks;
  final ValueChanged<Book> onBookTap;
  final ValueChanged<Book> onAddToCart;
  final ValueChanged<String> onRemoveWishlist;

  const OrdersAndWishlistScreen({
    super.key,
    required this.orders,
    required this.wishlistBooks,
    required this.onBookTap,
    required this.onAddToCart,
    required this.onRemoveWishlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'My Orders & Tracking',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        if (orders.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('You have not placed any orders yet.'),
          )
        else
          ...orders.map(
            (order) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF009EE2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID: #${order.orderId}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF009EE2),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.shade50,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          order.status,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Payment: ${order.paymentMethod} • Total: TK ${order.totalAmount}',
                  ),
                  Text(
                    'Delivery Address: ${order.address}',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 20),
        Text(
          'My Wishlist (${wishlistBooks.length})',
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        if (wishlistBooks.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('Your wishlist is empty.'),
          )
        else
          ...wishlistBooks.map(
            (book) => Card(
              color: Colors.white,
              elevation: 0,
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                onTap: () => onBookTap(book),
                leading: CircleAvatar(
                  backgroundColor: book.coverColor,
                  child: Icon(book.coverIcon, color: Colors.white, size: 18),
                ),
                title: Text(book.title),
                subtitle: Text('TK ${book.price} • ${book.author}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Color.fromARGB(255, 133, 188, 212),
                      ),
                      onPressed: () => onAddToCart(book),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Colors.red),
                      onPressed: () => onRemoveWishlist(book.id),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
