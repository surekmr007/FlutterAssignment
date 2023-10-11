import 'package:data_encryption/question2.dart';
import 'package:data_encryption/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _HomePageState();
}

class _HomePageState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    _userNameController.text = await _secureStorage.getUserName() ?? '';
    _passwordController.text = await _secureStorage.getPassWord() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.key),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Flutter Secure Storage',
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      // focusedBorder: UiHelper.textFieldBorder,
                      // enabledBorder: UiHelper.textFieldBorder,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                      // focusedBorder: UiHelper.textFieldBorder,
                      // enabledBorder: UiHelper.textFieldBorder,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () async {
                        await _secureStorage
                            .setUserName(_userNameController.text);
                        await _secureStorage
                            .setPassWord(_passwordController.text);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Save'),
                      ),
                    ),
                    
                  ),
                ),
                ElevatedButton(onPressed: (){
                  sendSensitiveData();
                }, child: Text('SUBMIT'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
