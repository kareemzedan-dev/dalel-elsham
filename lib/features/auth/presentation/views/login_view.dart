import 'package:dalel_elsham/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';



class LoginView extends StatelessWidget {
  const LoginView({super.key });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

          child: LoginViewBody( ),

      ),
    );
  }
}
