import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tangle/controller/add_data.dart';
import 'package:tangle/utils/core_utils.dart';
import 'package:tangle/widgets/widget.dart';
import '../utils/pick_image.dart';
import '../utils/utils.dart';
import 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _occupationController = TextEditingController();
  late TabController _tabController;

  Uint8List? _image;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _ageController.dispose();
    _occupationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }


  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(95.h),
              child: AppBarWidget(
                controller: _tabController,
                isBackButton: false,
              )),
        ),
        body: TabBarView(controller: _tabController, children: [
          // sign up tab
          _signUp(),
          // login tab
          _login()
        ]),
      ),
    );
  }

  Widget _signUp() {
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final age = _ageController.text;
    final occupation = _occupationController.text;
    final email = _emailController.text;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: ListView(controller: _scrollController, children: [
        Stack(
          children: [
            Positioned(
              top: 0,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(pi),
                  child: BigTriangle()),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(pi),
                  child: SmallTriangle(
                    ontap: () {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent,
                        duration: const Duration(
                            milliseconds: 500), 
                        curve: Curves.easeInOut,
                      );
                    },
                  )),
            ),
            Stack(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 120.h, right: 30.w, left: 20.w, bottom: 50.h),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64.r,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : CircleAvatar(
                                radius: 64.r,
                                backgroundImage:
                                    const AssetImage('assets/images/icon.png'),
                              ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(
                              Icons.add_a_photo_rounded,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const WhiteSpace(height: 5),
                    TextFieldInput(
                      controller: _firstNameController,
                      hint: 'First Name',
                      icon: Icons.person,
                    ),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        controller: _lastNameController,
                        hint: 'Last Name',
                        icon: Icons.person),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        controller: _ageController,
                        hint: 'Age',
                        keyBoard: TextInputType.number),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        controller: _occupationController, hint: 'Occupation'),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        keyBoard: TextInputType.emailAddress,
                        controller: _emailController,
                        hint: 'Email',
                        icon: Icons.email),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        controller: _passwordController,
                        hint: 'Password',
                        icon: Icons.password),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        controller: _confirmPasswordController,
                        hint: 'Confirm Password',
                        icon: Icons.password),
                    const WhiteSpace(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientButton(
                          ontap: ()  {
                            if (firstName.isNotEmpty &&
                                lastName.isNotEmpty &&
                                age.isNotEmpty &&
                                occupation.isNotEmpty &&
                                email.isNotEmpty &&
                                password.isNotEmpty) {
                               StoreData.signUp(
                                  context: context,
                                  firstname: firstName.trim(),
                                  lastname: lastName.trim(),
                                  age: age.trim(),
                                  occupation: occupation.trim(),
                                  email: email.trim(),
                                  password: password.trim(),
                                  confirmPassword: confirmPassword.trim(),
                                  image: _image!);
                            } else if (_image == null) {
                              CoreUtils.showAlertDialog(
                                  context: context,
                                  message: 'Select a profile picture');
                            } else {
                              CoreUtils.showAlertDialog(
                                  context: context,
                                  message:
                                      'Please fill in your details careful');
                            }
                          },
                          text: 'Sign Up',
                        ),
                        const WhiteSpace(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => const DataPage()));
                          },
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Already have an account?',
                                    style: GoogleFonts.roboto(
                                        color: Colors.black, fontSize: 14)),
                                TextSpan(
                                  text: ' Login',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ],
        ),
        const Socials()
      ]),
    );
  }

  Widget _login() {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: ListView(controller: _scrollController, children: [
        Stack(
          children: [
            Positioned(
              top: 0,
              child: SizedBox(
                height: screenHeight * .6,
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: BigTriangle()),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(pi),
                child: SmallTriangle(
                  ontap: () {
                    _scrollController.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
            ),
            Stack(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 80.h, right: 30.w, left: 20.w, bottom: 100.h),
                child: Column(
                  children: [
                    TextFieldInput(
                        controller: _emailController,
                        keyBoard: TextInputType.emailAddress,
                        hint: 'Email',
                        icon: Icons.email),
                    const WhiteSpace(height: 10),
                    TextFieldInput(
                        controller: _passwordController,
                        hint: 'Password',
                        icon: Icons.password),
                    const WhiteSpace(height: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ForgetPassword()));
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forget Password',
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                      ),
                    ),
                    const WhiteSpace(height: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GradientButton(
                          ontap: () async {
                            CoreUtils.showLoader(context, 'message');
                            await StoreData.signUserIn(
                                context,
                                _emailController.text.trim(),
                                _passwordController.text.trim());
                          },
                          text: 'Login',
                        ),
                        const WhiteSpace(height: 20),
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Don\'t have an account?',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black, fontSize: 14)),
                              TextSpan(
                                text: ' Sign Up',
                                style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: const Socials(),
        )
      ]),
    );
  }
}
