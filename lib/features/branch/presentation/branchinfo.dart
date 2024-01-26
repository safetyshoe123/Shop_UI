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
  // bool _isEnabled = false;
  bool _isNameEnabled = false;
  bool _isAdd1Enabled = false;
  bool _isAdd2Enabled = false;
  bool _isDateEnabled = false;
  bool _isTypeEnabled = false;
  bool _isNotesEnabled = false;
  bool _isRemarkEnabled = false;
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
  DateTime? selectedDate;
  String dateToDisplay = '0000/00/00';

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
                              state.branchModel1!.branchName,
                              style: GoogleFonts.ptSerif(
                                textStyle: const TextStyle(
                                    color: Color.fromRGBO(40, 120, 19, 1),
                                    fontSize: 50,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50,),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Form(
                            key: _formKey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.badge_rounded),
                                        SizedBox(
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Branch ID',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller:
                                                  _branchIdController,
                                              enabled: false,
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
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Branch Name',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller:
                                                  _branchNameController,
                                              enabled: _isNameEnabled,
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
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Address 1',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller:
                                                  _address1Controller,
                                              enabled: _isAdd1Enabled,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                hintText: state
                                                    .branchModel1!.address1,
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
                                        const Icon(
                                            Icons.location_on_outlined),
                                        SizedBox(
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Address 2',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller:
                                                  _address2Controller,
                                              enabled: _isAdd2Enabled,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                hintText: state
                                                    .branchModel1!.address2,
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
                                  ],
                                ),
                               const SizedBox(width: 50,),
                                Column(
                                  children: [
                                     Row(
                                  children: [
                                    const Icon(Icons.calendar_month_outlined),
                                    SizedBox(
                                      width: screenSize.width / 15,
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: const Text(
                                          'Date Opened',
                                          style: TextStyle(
                                            color: Colors.black,
                                                fontSize: 17,
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
                                          style: const TextStyle(
                                              color: Colors.black,
                                                fontSize: 20),
                                          controller: _dateController,
                                          enabled: _isDateEnabled,
                                          textAlign: TextAlign.center,
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                          onTap: () async {
                                            final initialDate = DateTime.now();
                                            final newDate =
                                                await showDatePicker(
                                                    context: context,
                                                    firstDate: DateTime(
                                                        DateTime.now().year -
                                                            10),
                                                    lastDate: DateTime(
                                                        DateTime.now().year +
                                                            10),
                                                    initialDate: initialDate);
                                            if (newDate == null) {
                                              return;
                                            }
                                            setState(() {
                                              selectedDate = newDate;
                                              dateToDisplay =
                                                  ' ${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}';
                                              _dateController.text =
                                                  dateToDisplay;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        setState(() {
                                          _isDateEnabled = !_isDateEnabled;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                    Row(
                                      children: [
                                        const Icon(Icons.checklist_sharp),
                                        SizedBox(
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Type',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller: _typeController,
                                              enabled: _isTypeEnabled,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                hintText: state
                                                    .branchModel1!.type,
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            setState(() {
                                              _isTypeEnabled = !_isTypeEnabled;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.note_add_rounded),
                                        SizedBox(
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Notes',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller: _notesController,
                                              enabled: _isNotesEnabled,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                hintText: state
                                                    .branchModel1!.notes,
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
                                        const Icon(
                                            Icons.edit_calendar_rounded),
                                        SizedBox(
                                          width: screenSize.width / 15,
                                          child: Container(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: const Text(
                                              'Remark',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 17,
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
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                fontSize: 20),
                                              controller: _remarkController,
                                              enabled: _isRemarkEnabled,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                hintText: state
                                                    .branchModel1!.remark,
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
                                      _isNameEnabled = false;
                                      _isAdd1Enabled = false;
                                      _isAdd2Enabled = false;
                                      _isDateEnabled = false;
                                      _isTypeEnabled = false;
                                      _isNotesEnabled = false;
                                      _isRemarkEnabled = false;
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
