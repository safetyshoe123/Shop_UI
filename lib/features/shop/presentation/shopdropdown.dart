import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/auth/presentation/login.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branch_new.dart';
import 'package:shop_ui/features/branch/presentation/branchdash.dart';

class ShopDrop extends StatefulWidget {
  const ShopDrop({super.key, required this.restriction});
  final List restriction;

  @override
  State<ShopDrop> createState() => _ShopDropState();
}

class _ShopDropState extends State<ShopDrop> {
  final DIContainer diContainer = DIContainer();
  late AuthBloc _authBloc;
  late List restrictionList;

  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    restrictionList = widget.restriction;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: _authListener,
      builder: (context, state) {
        if (state.stateStatus == StateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    '-SHOP NAME- DASHBOARD',
                    style: GoogleFonts.ptSerif(
                      textStyle: const TextStyle(
                        color: Color.fromRGBO(40, 120, 19, 1),
                        fontSize: 50,
                        // letterSpacing: .5
                      ),
                    ),
                  ),
                ),
              ),
              //
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenSize.height / 6),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: SizedBox(
                      width: 500,
                      child: DropdownButton2<dynamic>(
                        isExpanded: true,
                        hint: const Row(
                          children: [
                            // Icon(
                            //   Icons.list,
                            //   size: 16,
                            //   color: white,
                            // ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'Select Branch',
                                  style: TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.bold,
                                    color: white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        items: restrictionList
                            .map((item) => DropdownMenuItem<String>(
                                  alignment: AlignmentDirectional.center,
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: fontsize,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 50,
                          width: 160,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: accentCanvasColor,
                            ),
                            color: canvasColor,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          ),
                          iconSize: 14,
                          iconEnabledColor: white,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: screenSize.height / 3,
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.brown.shade300,
                          ),
                          // offset: const Offset(-20, 0),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all<double>(6),
                            thumbVisibility:
                                MaterialStateProperty.all<bool>(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: FloatingActionButton(
                  backgroundColor: canvasColor,
                  foregroundColor: white,
                  splashColor: accentCanvasColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider<AuthBloc>(
                              create: (context) => diContainer.authBloc,
                            ),
                            BlocProvider<BranchBloc>(
                              create: (context) => diContainer.branchBloc,
                            ),
                          ],
                          child: BranchPage(
                            selectedBranch: selectedValue!,
                          ),
                        ),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Go',
                          style: TextStyle(fontSize: fontsize),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  void _authListener(BuildContext context, AuthState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.errorSnackBar(state.errorMessage, context);
    }
    if (state.stateStatus == StateStatus.initial) {
      SnackBarUtils.successSnackBar('Logout successful!', context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MultiBlocProvider(providers: [
              BlocProvider<AuthBloc>(
                  create: (BuildContext context) => diContainer.authBloc),
            ], child: const LoginPage()),
          ),
          ModalRoute.withName('/'));
    }
  }
}
