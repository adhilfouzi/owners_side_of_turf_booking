import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../model/backend/repositories/authentication/firebase_authentication.dart';
import '../../../model/backend/repositories/user/user_repositories.dart';
import '../../../model/data_model/user_request_model.dart';
import '../../../utils/portion/loadingpopup.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupRequested>(onSignupRequested);
  }

  void onSignupRequested(
      SignupRequested event, Emitter<SignupState> emit) async {
    // Add async keyword here
    emit(SignupLoading());
    try {
      Navigator.of(event.context)
          .push(MaterialPageRoute(builder: (context) => const LoadingPopup()));
      // Register user in the firebase Authentication & save user data in the firebase

      final userCredential = await AuthenticationRepository()
          .registerWithEmailAndPassword(event.user.courtEmailAddress);

      // Save authenticated user data in the firebase firestore
      final newUser = UserModel(
        courtName: event.user.courtName.trim(),
        courtPhoneNumber: event.user.courtPhoneNumber.trim(),
        courtEmailAddress: event.user.courtEmailAddress.trim(),
        courtDescription: event.user.courtDescription.trim(),
        openingTime: '', // Add the opening time
        closingTime: '', // Add the closing time
        courtLocation: event.user.courtLocation.trim(),
        images: '', // Add the path to images
        ownerPhoto: '', // Add the path to owner's photo
        ownerFullName: event.user.ownerFullName.trim(),
        ownerPhoneNumber: event.user.ownerPhoneNumber.trim(),
        ownerEmailAddress: '', // Add the owner's email address
        isOwner: event.user.isOwner,
      );

      await UserRepository().saveUserRecord(newUser, userCredential.user!.uid);
      emit(SignupSuccess()); // Emit SignupSuccess state after successful signup
    } catch (e) {
      emit(SignupError(error: e.toString()));
    }
  }
}

    // Check internet connectivity
    // Validate form fields
    // Check privacy policy checkbox
    // Perform signup process