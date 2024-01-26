import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shop_ui/features/employee/presentation/employee.dart';
// import 'package:shop_ui/features/presentation/pages/home.dart';

class InfoShopPage extends StatefulWidget {
  const InfoShopPage({super.key});

  @override
  State<InfoShopPage> createState() => _InfoShopPageState();
}

class _InfoShopPageState extends State<InfoShopPage> {
  bool _isEnabled = false;
  bool _isNameEnabled = false;
  bool _isAdd1Enabled = false;
  bool _isAdd2Enabled = false;
  bool _isNotesEnabled = false;
  bool _isRemarkEnabled = false;

  final TextEditingController _shopIdController =
      TextEditingController(text: "Shop-1");
  final TextEditingController _shopNameController =
      TextEditingController(text: "Delsan 1");
  final TextEditingController _address1Controller =
      TextEditingController(text: "Mandaue");
  final TextEditingController _address2Controller =
      TextEditingController(text: "Cebu");
  final TextEditingController _notesController =
      TextEditingController(text: "No Notes");
  final TextEditingController _remarkController =
      TextEditingController(text: "No Remarks");

  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '-SHOP NAME- INFO',
                          style: GoogleFonts.ptSerif(
                            textStyle: const TextStyle(
                                color: Color.fromRGBO(40, 120, 19, 1),
                                fontSize: 50,
                                letterSpacing: .5),
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Form(
                        key: _formKey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.badge_rounded),
                                    SizedBox(
                                      width: screenSize.width / 10,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Shop ID',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Container(
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20),
                                          controller: _shopIdController,
                                          enabled: _isEnabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 43,
                                    )
                                    // IconButton(
                                    //   icon: const Icon(Icons.edit),
                                    //   onPressed: () {
                                    //     setState(() {
                                    //       _isEnabled = !_isEnabled;
                                    //     });
                                    //   },
                                    // ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.house_rounded),
                                    SizedBox(
                                      width: screenSize.width / 10,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Shop Name',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Container(
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20),
                                          controller: _shopNameController,
                                          enabled: _isNameEnabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          _isNameEnabled = !_isNameEnabled;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    SizedBox(
                                      width: screenSize.width / 10,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Address 1',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Container(
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20),
                                          controller: _address1Controller,
                                          enabled: _isAdd1Enabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          _isAdd1Enabled = !_isAdd1Enabled;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_outlined),
                                    SizedBox(
                                      width: screenSize.width / 10,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Address 2',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Container(
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20),
                                          controller: _address2Controller,
                                          enabled: _isAdd2Enabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          _isAdd2Enabled = !_isAdd2Enabled;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.note_add_rounded),
                                    SizedBox(
                                      width: screenSize.width / 10,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Notes',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Container(
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20),
                                          controller: _notesController,
                                          enabled: _isNotesEnabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          _isNotesEnabled = !_isNotesEnabled;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.edit_calendar_rounded),
                                    SizedBox(
                                      width: screenSize.width / 10,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Remark',
                                          style: TextStyle(
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Container(
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
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 20),
                                          controller: _remarkController,
                                          enabled: _isRemarkEnabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          _isRemarkEnabled = !_isRemarkEnabled;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: screenSize.height / 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(40, 120, 19, 1)),
                              shape: MaterialStateProperty.resolveWith(
                                  (states) => RoundedRectangleBorder(
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
                              width: screenSize.width / 7,
                              height: 50,
                              child: Center(
                                child: Text(
                                  "Save Changes",
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _isEnabled = false;
                                _isNameEnabled = false;
                                _isAdd1Enabled = false;
                                _isAdd2Enabled = false;
                                _isNotesEnabled = false;
                                _isRemarkEnabled = false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 70,
                    width: screenSize.width / 2.1,
                    child: const Divider()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
