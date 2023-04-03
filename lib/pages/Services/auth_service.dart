import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_states.dart';
import 'package:travelapp/pages/home_page.dart';
import 'package:travelapp/pages/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../cubit/app-cubit_logics.dart';
import '../../cubit/app_cubit.dart';
import 'data_service.dart';

class AuthService {
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          //if (snapshot.hasData) {
          //dovrebbe essere if(...)homepage else loginpage
          return BlocProvider<AppCubits>(
            create: (context) => AppCubits(
              data: DataServices(),
            ),
            child: const AppCubitLogics(),
          );
        });
  }

  signInWithGoogle() async {
    await signOut();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() async {
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().signOut();
    }

    try {
      await GoogleSignIn().disconnect();
    } catch (e) {
      print("failed to logout");
    }

    await FirebaseAuth.instance.signOut();
  }
}
