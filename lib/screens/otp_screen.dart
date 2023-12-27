
import 'package:bestrateapp/screens/registration_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Padding(padding: EdgeInsets.all(10),
                      child: Image.asset('assets/images/arrow_back_image.png'),
                    ),
                  ),
                  Expanded(child: Center(
                    child: Padding(padding: EdgeInsets.all(10),
                       child: Text("OTP Authentication", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),),),
                    ),
                  )

                ],
              ),

            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(10),
                      child: Text('An outhentication code has been sent to',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                  ),
                  const Padding(padding: EdgeInsets.all(5),
                      child: Text('+91 1234567890',style: TextStyle(fontSize: 16,color: Color(0xFFA1A1A1)),)
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(50,40,50,0),
                   child: PinCodeTextField(
                    appContext: context,
                    controller: _controller,
                    length: 4,
                    cursorHeight: 19,
                    enableActiveFill: true,
                    textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldWidth: 50,
                      inactiveColor: Colors.grey,
                      selectedColor: Color(0xFF01B576),
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      borderWidth: 1,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    onChanged: (String value) { 
                      print(value);
                    },

                  ),),
                  Padding(padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't received the code? ", style: TextStyle(fontSize: 16),),
                      Text("Resend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    ],
                  ),),
                  Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 350, height: 55),

                      child: ElevatedButton(
                        child: Text("Submit"),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return RegistrationScreen1();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF7258DB),
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(fontSize: 16),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
      ),

    );
  }
}
