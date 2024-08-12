import 'package:cadeau_app/controllers/new_password_contoller.dart';
import 'package:cadeau_app/screens/verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() {
    return _ForgetPasswordScreenState();
  }
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  var imagePath = 'lib/assets/lock.png';
  bool isButtonEnabled = false;
  final TextEditingController _phoneController = TextEditingController();
  String _enteredPhoneNumber = '';
  void _validateInputs() {
    setState(() {
      isButtonEnabled = _phoneController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  imagePath,
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Forget password',
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    'Enter phone number to receive code on it',
                    style: GoogleFonts.jost(
                      color: const Color.fromARGB(246, 108, 108, 108),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 130,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Phone number',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 125, 125, 125),
                    ),
                  ),
                ),
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    print(number.phoneNumber);
                    _enteredPhoneNumber = number.phoneNumber!;
                  },
                  inputDecoration: InputDecoration(
                    hintText: '123-456-7890',
                    hintStyle: GoogleFonts.jost(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400, // Semi-bold text
                        color: Color.fromARGB(
                            255, 196, 195, 195), // Grey color for hint
                      ),
                    ),
                  ),
                  textStyle: GoogleFonts.jost(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500, // Semi-bold text
                      color: Colors.black, // Grey color for hint
                    ),
                  ),
                  textFieldController: _phoneController,
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 370, // Full width
                  height: 60,
                  child: FilledButton(
                    onPressed: isButtonEnabled
                        ? () async {
                             final verificationCode = await NewPasswordController().sendPhoneNumber(_phoneController.text);
                             print("verification code on forget screen: $verificationCode");
                             if(!context.mounted){
                               return;
                             }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        VerificationScreen(_phoneController.text,verificationCode)),
                              );
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
        ),
      ),
    );
  }
}
