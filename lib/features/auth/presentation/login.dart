import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/core/utils/guard.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/auth/domain/models/login.model.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branch.dart';
import 'package:shop_ui/features/shop/domain/bloc/shop_bloc.dart';
import 'package:shop_ui/features/shop/presentation/home.dart';
import 'package:shop_ui/features/shop/presentation/shop.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _branchIdController = TextEditingController();
  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final DIContainer diContainer = DIContainer();
  bool _isObscure = true;
  late AuthBloc _authBloc;
  // late BranchBloc _branchBloc;

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    // _branchBloc = BlocProvider.of<BranchBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: _loginListener,
        builder: (context, state) {
          if (state.stateStatus == StateStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: SizedBox(
                width: 500,
                height: 600,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 100,
                        child: Text(
                          'LOGIN',
                          style: GoogleFonts.ptSerif(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(40, 120, 19, 1),
                                fontSize: 50,
                                letterSpacing: .5),
                          ),
                        ),
                        // Text(
                        //   "Login",

                        //   style:
                        //   GoogleFonts.lato(

                        //   ),
                        //   // TextStyle(
                        //   //     color: Color.fromRGBO(40, 120, 19, 1),
                        //   //     fontSize: 50,

                        //   //     )

                        // ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color.fromRGBO(40, 120, 19, 1)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(40, 120, 19, 1),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                40, 120, 19, 1)))),
                                child: TextFormField(
                                    // validator: (String? val) {
                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                    // },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _branchIdController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.key),
                                        border: InputBorder.none,
                                        hintText: "ID",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700])),
                                    validator: (String? val) {
                                      return Guard.againstEmptyString(
                                          val, 'ID');
                                    }),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromRGBO(
                                                40, 120, 19, 1)))),
                                child: TextFormField(
                                    // validator: (String? val) {
                                    //   return Guard.againstInvalidEmail(val, 'Email');
                                    // },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _empIdController,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.person),
                                        border: InputBorder.none,
                                        hintText: "Username",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700])),
                                    validator: (String? val) {
                                      return Guard.againstEmptyString(
                                          val, 'Username');
                                    }),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    // validator: (String? val) {
                                    //   return Guard.againstEmptyString(
                                    //       val, 'Password');
                                    // },
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    controller: _passwordController,
                                    obscureText: _isObscure,
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(Icons.lock_open),
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[700]),
                                        suffixIcon: IconButton(
                                          icon: Icon(_isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off),
                                          onPressed: () {
                                            setState(() {
                                              _isObscure = !_isObscure;
                                            });
                                          },
                                        )),
                                    validator: (String? val) {
                                      return Guard.againstEmptyString(
                                          val, 'Password');
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color.fromRGBO(40, 120, 19, 1)),
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.red; //<-- SEE HERE
                              }
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.brown; //<-- SEE HERE
                              }
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        child: SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Login",

                              style: GoogleFonts.ptSerif(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // style: TextStyle(
                              //     color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _login(context);
                        },
                      ),
                      // const SizedBox(height: 10),
                      // TextButton(
                      //   onPressed: () {

                      //   },
                      //   child: const Text(
                      //     "Forgot Password?",
                      //     style: TextStyle(color: Color.fromRGBO(40, 120, 19, 1)),
                      //   ),
                      // ),
                      const SizedBox(height: 30, child: Divider()),
                      // const SizedBox(
                      //   height: 5,
                      // ),
                      // TextButton(
                      //   onPressed: () {},
                      //   child: const Text(
                      //     "Register",
                      //     style: TextStyle(color: Color.fromRGBO(40, 120, 19, 1)),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  //TODO:Need to send status from backend kay di mo read ang backend sa status dre ig login
  //Working na login pero need to test kung lig-on ang code

  void _loginListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.defualtSnackBar(state.errorMessage, context);
    }

    if (state.isSuccess) {
      SnackBarUtils.defualtSnackBar('Login Success', context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => BlocProvider<ShopBloc>(
                    create: (context) => diContainer.shopBloc,
                    child: const HomePage(),
                  )),
          ModalRoute.withName('/'));
    }
  }

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _authBloc.add(
        LoginEvent(
          loginModel: LoginModel(
            branchId: _branchIdController.text,
            empId: _empIdController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }
}