import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';

class Verifivation extends StatefulWidget {
  @override
  _VerifivationState createState() => _VerifivationState();
}

class _VerifivationState extends State<Verifivation> {
  List<TextEditingController> controllers =
      List.generate(5, (index) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(5, (index) => FocusNode());

  @override
  void dispose() {
    for (var node in focusNodes) {
      node.dispose();
    }
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      // Your existing code...
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
            child: IconButton(
              icon: Image.network(
                'https://res.cloudinary.com/dfgcv03qz/image/upload/v1702278802/gym_app/iconBack_yhfgtv.png',
                width: 24,
                height: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'VERIFICATION',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'ENTER YOUR INFORMATIONS BELOW OR\nLOGIN WITH A OTHER ACCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return Container(
                    width: 40.0,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        counterText: '',
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            index < controllers.length - 1) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index + 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),

              // Try another way button
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Verifivation(),
                      ));
                  // Implement your "Try another way" logic here
                },
                style: TextButton.styleFrom(
                  backgroundColor:
                      Colors.limeAccent, // You can change the text color
                ),
                child: const Text('Try another way'),
              ),

              const SizedBox(height: 20),

              // Forgot Password button
              SizedBox(
                width: 263,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Verifivation(),
                        ));
                    // Implement your forgot password logic here
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    backgroundColor: Colors.limeAccent,

                    // You can change the button color
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Your existing code...
            ],
          ),
        ),
      ),
    );
  }
}
