import 'package:cadeau_app/controllers/login_controller.dart';
import 'package:cadeau_app/services/cache_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  void _logout(BuildContext context) async {
    await LoginController().logout();
    await CacheHelper.removeToken();
    if(!context.mounted){
      return;
    }
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
          (route) => false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout_sharp,color: Colors.black,size: 25,),
            TextButton(onPressed: (){
              _logout(context);

            }, child:  Text('Log Out',style: GoogleFonts.jost(
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Colors.black
            ),))
          ],
        ),
      ),
    );
  }
}