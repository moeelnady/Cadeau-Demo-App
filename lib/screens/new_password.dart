import 'package:cadeau_app/controllers/new_password_contoller.dart';
import 'package:cadeau_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen(this.phoneNumber, this.token, {super.key});
  final String token;
  final String phoneNumber;

  @override
  State<NewPasswordScreen> createState() {
    return _NewPasswordScreenState();
  }
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  var imagePath = 'lib/assets/lock.png';
  bool isButtonEnabled = false;
  bool _obscureText = true;
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _validateInputs() {
    setState(() {
      isButtonEnabled = _newPasswordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty;
    });
  }

  Widget getLabelType(String str) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(str,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 125, 125, 125),
          )),
    );
  }

  Widget getPasswordWidget(TextEditingController controller) {
    return TextFormField(
      obscureText: _obscureText,
      controller: controller,
      decoration: InputDecoration(
          hintText: 'Enter your password here',
          hintStyle: GoogleFonts.jost(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400, // Semi-bold text
              color: Color.fromARGB(255, 196, 195, 195), // Grey color for hint
            ),
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ))),
    );
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _confirmPasswordController.addListener(_validateInputs);
    _newPasswordController.addListener(_validateInputs);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(imagePath),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Set New Password',
              style: GoogleFonts.jost(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 10,
            ),
            getLabelType('Enter your new password'),
            getPasswordWidget(_newPasswordController),
            const SizedBox(
              height: 50,
            ),
            getLabelType('Confirm Password'),
            getPasswordWidget(_confirmPasswordController),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 370, // Full width
              height: 60,
              child: FilledButton(
                onPressed: isButtonEnabled
                    ? () async{
                        final isSuccess = await NewPasswordController().resetPassword(
                            widget.phoneNumber.substring(3),
                            _confirmPasswordController.text,
                            widget.token);
                        if(isSuccess){
                          if(!context.mounted){
                            return;
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                   const MainScreen()));

                        }

                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return const Color.fromARGB(
                            216, 204, 204, 204); // Disabled color
                      }
                      return const Color.fromARGB(
                          255, 63, 170, 174); // Enabled color
                    },
                  ),
                  textStyle: WidgetStateProperty.all<TextStyle>(
                    GoogleFonts.jost(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
