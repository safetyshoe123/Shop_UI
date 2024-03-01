import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/sidebar.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branchdash.dart';
import 'package:shop_ui/features/branch/presentation/dashboard.dart';
import 'package:sidebarx/sidebarx.dart';

class BranchPage extends StatefulWidget {
  const BranchPage(
      {super.key, required this.selectedBranch, required this.restrictionList});
  final String selectedBranch;
  final List restrictionList;

  @override
  State<BranchPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<BranchPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  final DIContainer diContainer = DIContainer();
  final _key = GlobalKey<ScaffoldState>();
  late BranchBloc branchBloc;
  late AuthBloc authBloc;
  late String _selectedBranch;
  late List _items;
  String? selectedValue;

  @override
  void initState() {
    branchBloc = BlocProvider.of<BranchBloc>(context);
    authBloc = BlocProvider.of<AuthBloc>(context);
    _selectedBranch = widget.selectedBranch;
    _items = widget.restrictionList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BlocListener<BranchBloc, BranchState>(
      listener: _branchListener,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: _key,
        appBar:
            // isSmallScreen
            //     ?
            AppBar(
          centerTitle: true,
          backgroundColor: canvasColor,
          title:
              //  Padding(
              //   padding: EdgeInsets.only(left: screenSize.width/1.7),
              // child:
              FittedBox(
            fit: BoxFit.fitWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 600),
                  child: DropdownButtonHideUnderline(
                    child: SizedBox(
                      width: 300,
                      child: DropdownButton2<dynamic>(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            // Icon(
                            //   Icons.list,
                            //   size: 16,
                            //   color: white,
                            // ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 129),
                                child: Text(
                                  _selectedBranch,
                                  style: const TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.bold,
                                    color: canvasColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        items: _items
                            .map(
                              (item) => DropdownMenuItem<dynamic>(
                                alignment: AlignmentDirectional.center,
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: fontsize,
                                    fontWeight: FontWeight.bold,
                                    color: canvasColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 35,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            // border: Border.all(
                            //   color: accentCanvasColor,
                            // ),
                            color: white,
                          ),
                          elevation: 2,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: SizedBox.shrink(),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: screenSize.height / 5,
                          width: 360,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color.fromARGB(255, 229, 231, 231),
                            // color: Colors.brown.shade100,
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
                          height: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(14),
                          bottomRight: Radius.circular(14),
                        ),
                      ),
                      backgroundColor: white,
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.search,
                      color: accentCanvasColor,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(111, 27, 94, 31),
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // ),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: white,
              )),
          actions: [
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  _logoutDialog(context);
                },
                icon: const Icon(
                  Icons.power_settings_new_rounded,
                  color: white,
                )),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        // : null,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Center(
                child: _ScreensExample(
                  controller: _controller,
                  branchId: _selectedBranch,
                ),
              ),
            ),
            const SideBar(),
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 50,
          color: canvasColor,
          surfaceTintColor: canvasColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Copyright © 2023',
                style: TextStyle(color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _branchListener(BuildContext context, BranchState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.errorSnackBar(state.errorMessage, context);
    }
  }

  void _logout(BuildContext context) {
    authBloc.add(LogoutEvent());
  }

  Future<dynamic> _logoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 68, 78, 70),
          title: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.roboto(
                fontSize: 18, color: const Color.fromARGB(222, 255, 255, 255)),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                  ),
                  onPressed: () {
                    // _logout(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.ubuntu(
                      color: const Color.fromARGB(222, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(222, 255, 255, 255),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'No',
                  style: GoogleFonts.ubuntu(
                    color: const Color.fromARGB(222, 255, 255, 255),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    required this.controller,
    required this.branchId,
  });
  final String branchId;
  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  late String branchId;
  @override
  void initState() {
    super.initState();
    branchId = widget.branchId;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(widget.controller.selectedIndex);
        switch (widget.controller.selectedIndex) {
          case 0:
            // return const BranchDash();
            return const DashBoard();
          // InfoBranchPage(
          //   branchId: _branchId,
          // );

          case 1:
          // return const AddEmpPage();

          case 2:
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    // case 1:
    //   return 'Search';
    case 2:
      return 'Add';
    case 3:
      return 'Favorites';
    // case 4:
    //   return 'Custom iconWidget';
    case 5:
      return 'Profile';
    case 6:
      return 'Settings';
    case 7:
      return 'Logout';
    default:
      return 'Not found page';
  }
}

const textColor = Colors.brown;
const primaryColor = Colors.black38;
const canvasColor = Colors.brown;
const scaffoldBackgroundColor = Colors.white38;
const accentCanvasColor = Color.fromRGBO(40, 120, 19, 1);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
