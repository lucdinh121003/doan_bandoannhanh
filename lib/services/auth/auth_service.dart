import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
//lấy ví dụ về xác thực firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//  có được người dùng hiện tại
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

//đăng nhập
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    // thử đăng nhập
    try {
      UserCredential userCredential = 
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );
      return userCredential;
    }
    // nếu có lỗi, hãy ném ra ngoại lệ
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // đăng ký
  Future<UserCredential> signUpWithEmailPassword(
      String email, password) async {
    // thử đăng ký
    try {
      UserCredential userCredential = 
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, 
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // đăng xuất
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  static Future<bool> isLoggedIn() async{
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
