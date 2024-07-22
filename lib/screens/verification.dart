import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen(this.enteredPhone, {super.key});
  final String enteredPhone;

  @override
  State<StatefulWidget> createState() {
    return _VerificationScreenState();
  }
}

class _VerificationScreenState extends State<VerificationScreen> {
  var imagePath = 'lib/assets/verify.png';
  bool isButtonEnabled = false;
  final TextEditingController _pinCodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pinCodeController.addListener(_onPinCodeChanged);
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }

  void _onPinCodeChanged() {
    setState(() {
      isButtonEnabled = _pinCodeController.text.length == 6;
    });
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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imagePath,
                  width: 200,
                ),

                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Code',
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 15,
                ),

                ///We have sent the code to create Your account to mobile number
                SizedBox(
                  width: 200,
                  child: Text(
                    'We have sent the code to create Your account to mobile number',
                    style: GoogleFonts.jost(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  widget.enteredPhone,
                  style: GoogleFonts.jost(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    enableActiveFill: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: const Color.fromARGB(255, 158, 157, 157),
                      selectedColor: const Color.fromARGB(255, 255, 128, 0),
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.grey.shade100,
                      activeFillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isButtonEnabled = value.length == 6;
                      });
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend code',
                      style: GoogleFonts.jost(
                          color: const Color.fromARGB(255, 152, 163, 174),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 10,
                ),
                const Text('Counter'),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 370, // Full width
                  height: 60,
                  child: FilledButton(
                    onPressed: isButtonEnabled
                        ? () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           VerificationScreen(_enteredPhoneNumber)),
                            // );
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
