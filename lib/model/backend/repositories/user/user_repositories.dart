import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data_model/user_request_model.dart';
import '../authentication/firebase_exceptionhandler.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///  function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user, String id) async {
    try {
      await _db.collection("Owner").doc(id).set(user.toJson());
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  Future<void> updateUserData(String userId, UserModel updatedUser) async {
    try {
      // Update specific fields in the document
      await _db.collection("Owner").doc(userId).update(updatedUser.toJson());
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }

  /// Function to fetch user data from Firestore by user ID
  Future<UserModel> getUserById(String userId) async {
    try {
      DocumentSnapshot userSnapshot =
          await _db.collection("Owner").doc(userId).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;

        return UserModel.fromJson(userData);
      } else {
        throw Exception('User not found');
      }
    } catch (e) {
      throw ExceptionHandler.handleException(e);
    }
  }
}
