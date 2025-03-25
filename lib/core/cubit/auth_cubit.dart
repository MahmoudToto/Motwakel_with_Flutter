import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? verificationId;
  Map<String, dynamic>? userData; // لتخزين بيانات المستخدم أثناء التحقق

  // ✅ تسجيل الحساب وإرسال كود OTP
  Future<void> signUpWithPhone(String phone, Map<String, dynamic> user) async {
    try {
      emit(AuthLoading());
      userData = user; // تخزين بيانات المستخدم مؤقتًا

      await _auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          await _saveUserData(phone, userData ?? {});
        },
        verificationFailed: (FirebaseAuthException e) {
          emit(AuthFailure("فشل التحقق: ${e.message}"));
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
          emit(OTPSent());
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
      );
    } catch (e) {
      emit(AuthFailure("حدث خطأ أثناء التسجيل: ${e.toString()}"));
    }
  }

  // ✅ التحقق من OTP وإكمال التسجيل
  Future<void> verifyOTP(String otp) async {
    try {
      emit(AuthLoading());

      if (verificationId == null) {
        emit(AuthFailure("معرف التحقق غير موجود"));
        return;
      }

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      String phone = userCredential.user?.phoneNumber ?? "";

      // ✅ حفظ بيانات المستخدم فقط إذا لم تكن موجودة
      if (userData != null) {
        await _saveUserData(phone, userData!);
      }

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure("خطأ أثناء التحقق من OTP: ${e.toString()}"));
    }
  }

  // ✅ إعادة إرسال OTP
  Future<void> resendOTP(String phone) async {
    if (userData != null) {
      await signUpWithPhone(phone, userData!);
    } else {
      emit(AuthFailure("بيانات المستخدم غير متوفرة، أعد المحاولة."));
    }
  }

  // ✅ تسجيل الدخول برقم الهاتف وكلمة المرور
  Future<void> loginWithPhoneAndPassword(String phone, String password) async {
    try {
      emit(AuthLoading());

      var userDoc = await _firestore.collection('users').doc(phone).get();

      if (!userDoc.exists) {
        emit(AuthFailure("الحساب غير مسجل. قم بإنشاء حساب جديد."));
        return;
      }

      String storedPassword = userDoc.data()?['password'] ?? "";
      if (storedPassword != password) {
        emit(AuthFailure("كلمة المرور غير صحيحة"));
        return;
      }

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure("حدث خطأ: ${e.toString()}"));
    }
  }

  // ✅ تسجيل الخروج
  Future<void> logout() async {
    try {
      emit(AuthLoading());
      await _auth.signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure("حدث خطأ أثناء تسجيل الخروج: ${e.toString()}"));
    }
  }

  // ✅ التحقق من حالة تسجيل الدخول
  Future<void> checkAuthStatus() async {
    try {
      emit(AuthLoading());
      User? currentUser = _auth.currentUser;

      if (currentUser != null) {
        var userDoc = await _firestore
            .collection('users')
            .doc(currentUser.phoneNumber)
            .get();
        if (userDoc.exists) {
          emit(AuthSuccess());
        } else {
          emit(AuthFailure("بيانات المستخدم غير موجودة في النظام."));
        }
      } else {
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailure(
          "حدث خطأ أثناء التحقق من حالة تسجيل الدخول: ${e.toString()}"));
    }
  }

  // ✅ حفظ بيانات المستخدم في Firestore
  Future<void> _saveUserData(String phone, Map<String, dynamic> user) async {
    await _firestore
        .collection('users')
        .doc(phone)
        .set(user, SetOptions(merge: true));
  }
}
