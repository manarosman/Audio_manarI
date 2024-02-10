import 'package:flutter/material.dart';
import 'package:helloworld/properties.dart';
import 'package:helloworld/screen/intro.dart';
import 'package:helloworld/screen/auth/welcome.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmOtpPage extends StatefulWidget {
  @override
  _ConfirmOtpPageState createState() => _ConfirmOtpPageState();
}

class _ConfirmOtpPageState extends State<ConfirmOtpPage> {
  TextEditingController otp1 = TextEditingController(text: '1');
  TextEditingController otp2 = TextEditingController(text: '2');
  TextEditingController otp3 = TextEditingController(text: '3');
  TextEditingController otp4 = TextEditingController(text: '4');
  TextEditingController otp5 = TextEditingController(text: '5');

  Widget otpBox(TextEditingController otpController) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.8),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: SizedBox(
          width: 9,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextField(
              controller: otpController,
              decoration: InputDecoration(
                  border: InputBorder.none, contentPadding: EdgeInsets.zero),
              style: TextStyle(fontSize: 16.0),
              keyboardType: TextInputType.phone,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Confirm your code',
      style: TextStyle(
          color: Colors.white,
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 5),
              blurRadius: 10.0,
            )
          ]),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Please wait, we are confirming your code',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ));

    Widget verifyButton = Center(
      child: InkWell(
        onTap: () {
          //Navigator.of(context)   .push(MaterialPageRoute(builder: (_) => IntroPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
            child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WelcomeBackPage()));
                },
                child: new Text("Enter",
                    style: const TextStyle(
                        color: const Color(0xfffefefe),
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0))),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(236, 60, 3, 1),
                    Color.fromRGBO(234, 60, 3, 1),
                    Color.fromRGBO(216, 78, 16, 1),
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget otpCode = Container(
      padding: const EdgeInsets.only(right: 28.0),
      height: 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          otpBox(otp1),
          otpBox(otp2),
          otpBox(otp3),
          otpBox(otp4),
          otpBox(otp5)
        ],
      ),
    );

    Widget resendText = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Resend again after ",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color.fromRGBO(255, 255, 255, 0.5),
            fontSize: 14.0,
          ),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            '0:39',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/premium-photo/colorful-headphone-with-black-background-colorful-background_832479-5778.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(color: transparentYellow),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
            body: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(flex: 3),
                      title,
                      Spacer(),
                      subTitle,
                      Spacer(flex: 1),
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: Center(
                          child: PinCodeTextField(
                            appContext: context,
                            controller: new TextEditingController(),
                            length: 6,
                            cursorHeight: 19,
                            enableActiveFill: true,
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.normal),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                fieldWidth: 50,
                                inactiveColor: Colors.grey,
                                selectedColor: Colors.lightBlue,
                                activeFillColor: Colors.blue,
                                selectedFillColor: Colors.blue,
                                inactiveFillColor: Colors.grey.shade100,
                                borderWidth: 1,
                                borderRadius: BorderRadius.circular(8)),
                            onChanged: (value) {},
                            // high: Colors.white,
                            //highlightAnimation: true,
                            //highlightAnimationBeginColor: Colors.white,
                            //highlightAnimationEndColor:
                            //  Theme.of(context).primaryColor,
                            //pinTextAnimatedSwitcherDuration:
                            //  Duration(milliseconds: 500),
                            //wrapAlignment: WrapAlignment.center,
                            //hasTextBorderColor: Colors.transparent,
                            //highlightPinBoxColor: Colors.white,
                            //autofocus: true,
                            //pinBoxHeight: 60,
                            // pinBoxWidth: 60,
                            //pinBoxRadius: 5,
                            //defaultBorderColor: Colors.transparent,
                            //pinBoxColor: Color.fromRGBO(255, 255, 255, 0.8),
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
//                      otpCode,
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: verifyButton,
                      ),
                      Spacer(flex: 2),
                      resendText,
                      Spacer()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
