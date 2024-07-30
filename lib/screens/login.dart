import 'package:cadeau_app/controllers/login_controller.dart';
import 'package:cadeau_app/screens/forget_password.dart';
import 'package:cadeau_app/screens/main_screen.dart';
import 'package:cadeau_app/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  var imagePath = 'lib/assets/cadeau_logo.png';
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');
  bool _obscureText = true;
  bool isButtonEnabled = false;

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

  Widget getPhoneNumberWidget() {
    return InternationalPhoneNumberInput(
      onInputChanged: (PhoneNumber number) {
        print(number.phoneNumber);
        print(number.dialCode);
      },
      inputDecoration: InputDecoration(
        hintText: '123-456-7890',
        hintStyle: GoogleFonts.jost(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400, // Semi-bold text
            color: Color.fromARGB(255, 196, 195, 195), // Grey color for hint
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
    );
  }

  Widget getCyanButton(String str) {
    return SizedBox(
      width: 370, // Full width
      height: 60,
      child: FilledButton(
        onPressed: isButtonEnabled
            ? () async {
                bool isLogin = await LoginController().login(_phoneController.text, _passwordController.text);
                print("is Login : $isLogin");
                if(isLogin){
                  if(!mounted) {
                    return;
                  }
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                        (route) => false,
                  );
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
              return const Color.fromARGB(255, 63, 170, 174); // Enabled color
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
        child: Text(
          str,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _validateInputs() {
    setState(() {
      isButtonEnabled = _phoneController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _phoneController.addListener(_validateInputs);
    _passwordController.addListener(_validateInputs);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            Text('Welcome Back',
                style: GoogleFonts.jost(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700)),
            Text(
              'Log in',
              style: GoogleFonts.jost(
                  color: const Color.fromARGB(255, 77, 75, 75),
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            getLabelType('Phone Number'),
            getPhoneNumberWidget(),
            const SizedBox(height: 8.0),
            getLabelType('Password'),
            TextFormField(
              obscureText: _obscureText,
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: 'Enter your password here',
                  hintStyle: GoogleFonts.jost(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w400, // Semi-bold text
                      color: Color.fromARGB(
                          255, 196, 195, 195), // Grey color for hint
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
            ),
            const SizedBox(
              height: 20,
            ),
            getCyanButton('Log in'),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgetPasswordScreen()),
                    );
                  },
                  child: Text(
                    'Forget password?',
                    style: GoogleFonts.jost(
                        color: const Color.fromARGB(255, 90, 88, 88),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
