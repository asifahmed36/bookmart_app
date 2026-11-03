import '../data/sample_books.dart';
import '../models/book.dart';
import '../models/user_profile.dart';

class ApiService {
  Future<UserProfile> authenticateUser({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 250));
    return UserProfile(
      id: 'USR-${DateTime.now().millisecondsSinceEpoch % 10000}',
      fullName: fullName.isEmpty ? 'BookMart Reader' : fullName,
      email: email,
      phone: phone,
    );
  }

  Future<List<Book>> fetchCatalog() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return kSampleBooks;
  }

  int validateCoupon(String code) {
    if (code.trim().toUpperCase() == 'ROKOMARI50') {
      return 50;
    }
    return 0;
  }
}
