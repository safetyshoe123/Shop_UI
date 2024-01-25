import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';

class InfoBranchPage extends StatefulWidget {
  const InfoBranchPage({super.key, required this.shopId});
  final String shopId;

  @override
  State<InfoBranchPage> createState() => _InfoBranchPageState();
}

class _InfoBranchPageState extends State<InfoBranchPage> {
  late BranchBloc _branchBloc;
  bool _isEnabled = false;
  late TextEditingController _branchIdController;
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  late String _shopId;
  late int num = 0;

  @override
  void initState() {
    super.initState();
    _branchBloc = BlocProvider.of<BranchBloc>(context);
    _shopId = widget.shopId;
    _branchIdController = TextEditingController(text: widget.shopId);
    _branchBloc.add(GetBranchEvent(shopId: _shopId));
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocConsumer<BranchBloc, BranchState>(
      bloc: _branchBloc,
      listener: _branchListener,
      builder: (context, state) {
        //this approach is the solution for the multiple call for the listener.. It needs to have a delay.
        if (state.branchModel1 == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.stateStatus == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
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
                              '${state.branchModel1!.branchName} INFO',
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
                          child: SizedBox(
                            width: 900,
                            child: Container(
                              padding: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color:
                                          const Color.fromRGBO(40, 120, 19, 1)),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(40, 120, 19, 1),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Branch ID',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 400,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  readOnly: true,
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller:
                                                      _branchIdController,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration:
                                                      const InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 43,
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.house_rounded),
                                            SizedBox(
                                              width: screenSize.width / 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Branch Name',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 400,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          174, 196, 169, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller:
                                                      _branchNameController,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller:
                                                      _address1Controller,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.location_on_outlined),
                                            SizedBox(
                                              width: screenSize.width / 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller:
                                                      _address2Controller,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.calendar_month_outlined),
                                            SizedBox(
                                              width: screenSize.width / 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Date Opened',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 400,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller: _dateController,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.checklist_sharp),
                                            SizedBox(
                                              width: screenSize.width / 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Type',
                                                  style: TextStyle(
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 400,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller: _typeController,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller: _notesController,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.edit_calendar_rounded),
                                            SizedBox(
                                              width: screenSize.width / 10,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                decoration: const BoxDecoration(
                                                  border: Border(
                                                    bottom: BorderSide(
                                                      color: Color.fromRGBO(
                                                          40, 120, 19, 1),
                                                    ),
                                                  ),
                                                ),
                                                child: TextFormField(
                                                  // validator: (String? val) {
                                                  //   return Guard.againstInvalidEmail(val, 'Email');
                                                  // },
                                                  autovalidateMode:
                                                      AutovalidateMode
                                                          .onUserInteraction,
                                                  style: TextStyle(
                                                      color: Colors.grey[700]),
                                                  controller: _remarkController,
                                                  enabled: _isEnabled,
                                                  textAlign: TextAlign.center,
                                                  decoration: InputDecoration(
                                                    hintText: state
                                                        .branchModel1!
                                                        .branchName,
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () {
                                                setState(() {
                                                  _isEnabled = !_isEnabled;
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
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          const Color.fromRGBO(40, 120, 19, 1)),
                                  shape: MaterialStateProperty.resolveWith(
                                      (states) => RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  overlayColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.hovered)) {
                                        return Colors.red; //<-- SEE HERE
                                      }
                                      if (states
                                          .contains(MaterialState.pressed)) {
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
                                  setState(
                                    () {
                                      _isEnabled = false;
                                    },
                                  );
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
      },
    );
  }

  void _branchListener(BuildContext context, BranchState state) async {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.errorSnackBar(state.errorMessage, context);
    }
  }
}
