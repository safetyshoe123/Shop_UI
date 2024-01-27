import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/core/utils/guard.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/domain/models/addbranch.model.dart';

class AddBranchPage extends StatefulWidget {
  const AddBranchPage({super.key, required this.shopId});
  final String shopId;

  @override
  State<AddBranchPage> createState() => _AddBranchPageState();
}

class _AddBranchPageState extends State<AddBranchPage> {
  late BranchBloc _branchBloc;
  final TextEditingController _branchIdController = TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  late String _shopIdController;
  final GlobalKey<FormState> _formKey = GlobalKey();
  DateTime? selectedDate;
  String dateToDisplay = '0000/00/00';

  @override
  void initState() {
    super.initState();
    _branchBloc = BlocProvider.of<BranchBloc>(context);
    _shopIdController = widget.shopId;
  }

  void clearText() {
    _branchIdController.clear();
    _branchNameController.clear();
    _address1Controller.clear();
    _address2Controller.clear();
    _dateController.clear();
    _typeController.clear();
    _notesController.clear();
    _remarkController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocConsumer<BranchBloc, BranchState>(
      bloc: _branchBloc,
      listener: _branchListener,
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return FittedBox(
          fit: BoxFit.scaleDown,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'REGISTER BRANCH',
                      style: GoogleFonts.ptSerif(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(40, 120, 19, 1),
                            fontSize: 50,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: [
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
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _branchIdController,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.badge_rounded),
                                      border: InputBorder.none,
                                      hintText: "Branch ID",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                  validator: (String? val) {
                                    return Guard.againstEmptyShopId(
                                        val, 'Branch ID');
                                  }),
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
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _branchNameController,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.house_rounded),
                                      border: InputBorder.none,
                                      hintText: "Branch name",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                  validator: (String? val) {
                                    return Guard.againstEmptyString(
                                        val, 'Branch Name');
                                  }),
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
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _address1Controller,
                                  decoration: InputDecoration(
                                      prefixIcon:
                                          const Icon(Icons.location_on),
                                      border: InputBorder.none,
                                      hintText: "Address 1",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                  validator: (String? val) {
                                    return Guard.againstEmptyString(
                                        val, 'Address 1');
                                  }),
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
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _address2Controller,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.location_on_outlined),
                                      border: InputBorder.none,
                                      hintText: "Address 2",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                  validator: (String? val) {
                                    return Guard.againstEmptyString(
                                        val, 'Address 2');
                                  }),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 400,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(40, 120, 19, 1),
                                  ),
                                ),
                              ),
                              child: TextFormField(
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                        Icons.calendar_month_outlined),
                                    border: InputBorder.none,
                                    hintText: "Date Opened",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15),
                                  ),
                                  onTap: () async {
                                    final initialDate = DateTime.now();
                                    final newDate = await showDatePicker(
                                        context: context,
                                        firstDate: DateTime(
                                            DateTime.now().year - 10),
                                        lastDate: DateTime(
                                            DateTime.now().year + 10),
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
                                  validator: (String? val) {
                                    return Guard.againstEmptyString(
                                        val, 'Date Opened');
                                  }),
                            ),
                          ),
                          SizedBox(
                            width: 400,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Color.fromRGBO(40, 120, 19, 1),
                              ))),
                              child: TextFormField(
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _typeController,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.checklist_sharp),
                                      border: InputBorder.none,
                                      hintText: "Type",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                  validator: (String? val) {
                                    return Guard.againstEmptyString(
                                        val, 'Type');
                                  }),
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
                                  style: const TextStyle(fontSize: 20),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: _notesController,
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.note_add_rounded),
                                      border: InputBorder.none,
                                      hintText: "Notes",
                                      hintStyle: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 15)),
                                  validator: (String? val) {
                                    return Guard.againstEmptyString(
                                        val, 'Notes');
                                  }),
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
                                style: const TextStyle(fontSize: 20),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _remarkController,
                                decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                        Icons.edit_calendar_rounded),
                                    border: InputBorder.none,
                                    hintText: "Remark",
                                    hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 15)),
                                validator: (String? val) {
                                  return Guard.againstEmptyString(
                                      val, 'Remark');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenSize.height / 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 700,
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
                              "Add",
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
                          _addShop(context);
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: SizedBox(
                          width: screenSize.width / 7,
                          height: 50,
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.ptSerif(
                                textStyle: const TextStyle(
                                  color: Color.fromRGBO(40, 120, 19, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          clearText();
                          
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50, child: Divider()),
              ],
            ),
          ),
        );
      },
    );
  }

  void _branchListener(BuildContext context, BranchState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.errorSnackBar(state.errorMessage, context);
    }
    if (state.isAdded == true) {
      SnackBarUtils.successSnackBar('Branch Added!', context);
      clearText();
    }
  }

  void _addShop(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _branchBloc.add(
        AddBranchEvent(
          addBranchModel: AddBranchModel(
            shopId: _shopIdController,
            branchId: _branchIdController.text,
            branchName: _branchNameController.text,
            address1: _address1Controller.text,
            address2: _address2Controller.text,
            dateOpened: _dateController.text,
            type: _typeController.text,
            notes: _notesController.text,
            remark: _remarkController.text,
          ),
        ),
      );
    }
  }
}
