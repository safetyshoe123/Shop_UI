import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/auth/presentation/admin_page.dart';
// import 'package:toggle_icon/toggle_icon.dart';
// import 'package:shop_ui/core/utils/guard.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';

class AddEmpPage extends StatefulWidget {
  const AddEmpPage({super.key});

  @override
  State<AddEmpPage> createState() => _AddEmpPageState();
}

class _AddEmpPageState extends State<AddEmpPage> {
  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _empIdController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _mnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _restrictController = TextEditingController();

  bool toggle = false;
  List<String> list = <String>['Active', 'Inactive'];

  // final _dateController = dateToDisplay;
  bool _isObscure = true;
  bool _isObscure2 = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime? selectedDate;
  String dateToDisplay = '0000/00/00';

  void clearText() {
    _empIdController.clear();
    _lnameController.clear();
    _fnameController.clear();
    _mnameController.clear();
    _passwordController.clear();
    _cpasswordController.clear();
    _dateController.clear();
    _statusController.clear();
    _salaryController.clear();
    _notesController.clear();
    _remarkController.clear();
    _restrictController.clear();
  }

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'REGISTER EMPLOYEE',
                    style: GoogleFonts.ptSerif(
                      textStyle: const TextStyle(
                          color: Color.fromRGBO(40, 120, 19, 1),
                          fontSize: 50,
                          letterSpacing: .5),
                    ),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child:
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: <Widget>[
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),

                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _empIdController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.badge_rounded),
                                  border: InputBorder.none,
                                  hintText: "Employee ID",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Employee ID');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _lnameController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText: "Last name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Last Name');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _fnameController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText: "First name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'First Name');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _mnameController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText: "Middle name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Middle Name');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // enabled: false,
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _statusController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.check_circle_rounded),
                                  border: InputBorder.none,
                                  hintText: "Status",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          toggle = !toggle;
                                          if (toggle == false) {
                                            setState(() {
                                              _statusController.text =
                                                  'Inactive';
                                            });
                                          } else {
                                            setState(() {
                                              _statusController.text = 'Active';
                                            });
                                          }
                                        });
                                      },
                                      icon: toggle
                                          ? const Icon(Icons.check_box)
                                          : const Icon(
                                              Icons.check_box_outline_blank))

                                  // ToggleIcon(
                                  //     trueIcon: const Icon(Icons.check_circle),
                                  //     falseIcon: const Icon(Icons
                                  //         .radio_button_unchecked_rounded),
                                  //     trueFunc: () {
                                  //       setState(() {
                                  //         _statusController.text =
                                  //             'Active';
                                  //       });
                                  //     },
                                  //     falseFunc: () {
                                  //       setState(() {
                                  //         _statusController.text =
                                  //             'Inactive';
                                  //       });
                                  //     },)
                                  ),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Status');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,

                              controller: _dateController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.calendar_month_outlined),
                                  border: InputBorder.none,
                                  hintText: "Date hired",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              onTap: () async {
                                final initialDate = DateTime.now();
                                final newDate = await showDatePicker(
                                    context: context,
                                    firstDate:
                                        DateTime(DateTime.now().year - 10),
                                    lastDate:
                                        DateTime(DateTime.now().year + 10),
                                    initialDate: initialDate);
                                if (newDate == null) {
                                  return;
                                }
                                setState(() {
                                  selectedDate = newDate;
                                  dateToDisplay =
                                      ' ${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}';
                                  _dateController.text = dateToDisplay;
                                });
                              },
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Date hired');
                              // }
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _salaryController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.attach_money_outlined),
                                  border: InputBorder.none,
                                  hintText: "Salary",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Salary');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
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
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17),
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
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Password');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Password');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _passwordController,
                              controller: _cpasswordController,
                              obscureText: _isObscure2,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  border: InputBorder.none,
                                  hintText: "Confirm password",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17),
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure2
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure2 = !_isObscure2;
                                      });
                                    },
                                  )),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Confirm Password');
                              // }
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: screenSize.width / 5,
                        // ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _notesController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.note_add_rounded),
                                  border: InputBorder.none,
                                  hintText: "Notes",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Notes');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _remarkController,
                              decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.edit_calendar_rounded),
                                  border: InputBorder.none,
                                  hintText: "Remark",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Remark');
                              // }
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 500,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color:
                                            Color.fromRGBO(40, 120, 19, 1)))),
                            child: TextFormField(
                              style: const TextStyle(fontSize: 20),
                              // validator: (String? val) {
                              //   return Guard.againstInvalidEmail(val, 'Email');
                              // },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // controller: _emailController,
                              controller: _restrictController,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.key_rounded),
                                  border: InputBorder.none,
                                  hintText: "Restriction",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700], fontSize: 17)),
                              // validator: (String? val) {
                              //   return Guard.againstEmptyString(
                              //       val, 'Remark');
                              // }
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // SizedBox(
                //   width: screenSize.width / 5,
                // ),
                // SizedBox(
                //   height: screenSize.height / 20,
                // )
                //   ],
                // ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color.fromRGBO(40, 120, 19, 1)),
                      shape: MaterialStateProperty.resolveWith((states) =>
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.green; //<-- SEE HERE
                          }
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.brown; //<-- SEE HERE
                          }
                          return null; // Defer to the widget's default.
                        },
                      ),
                    ),
                    child: const SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(
                          child: Icon(
                        Icons.person_add_alt_1,
                        color: white,
                      )
                          // Text(
                          //   "Add",
                          //   style: GoogleFonts.ptSerif(
                          //     textStyle: const TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          ),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const EmployeePage()));
                    },
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white70,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const SizedBox(
                      width: 100,
                      height: 50,
                      child: Center(
                          child: Icon(
                        Icons.delete_forever,
                        color: canvasColor,
                      )
                          // Text(
                          //   "Cancel",
                          //   style: GoogleFonts.ptSerif(
                          //     textStyle: const TextStyle(
                          //       color: Color.fromRGBO(40, 120, 19, 1),
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          ),
                    ),
                    onPressed: () {
                      clearText();
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const EmployeePage()));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30, child: Divider()),
            ],
          ),
        ),
      ),
    );
  }
}
