import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branchdash.dart';
import 'package:shop_ui/features/branch/presentation/branchinfo.dart';
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
  final _key = GlobalKey<ScaffoldState>();
  late BranchBloc branchBloc;
  late String _selectedBranch;
  late List _items;
  String? selectedValue;

  @override
  void initState() {
    branchBloc = BlocProvider.of<BranchBloc>(context);
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
              Padding(
            padding: const EdgeInsets.only(left: 140),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonHideUnderline(
                  child: SizedBox(
                    width: 500,
                    child: DropdownButton2<dynamic>(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          // Icon(
                          //   Icons.list,
                          //   size: 16,
                          //   color: white,
                          // ),
                          const SizedBox(
                            width: 4,
                          ),
                          Expanded(
                            child: Center(
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
                          .map((item) => DropdownMenuItem<dynamic>(
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
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 45,
                        width: 160,
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          // border: Border.all(
                          //   color: accentCanvasColor,
                          // ),
                          color: white,
                        ),
                        elevation: 2,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                        ),
                        iconSize: 14,
                        iconEnabledColor: canvasColor,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: screenSize.height / 3,
                        width: 500,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
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
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 100,
                  height: 45,
                  child: FloatingActionButton(
                    backgroundColor: white,
                    // foregroundColor: canvasColor,
                    splashColor: accentCanvasColor,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MultiBlocProvider(
                      //       providers: [
                      //         BlocProvider<AuthBloc>(
                      //           create: (context) => diContainer.authBloc,
                      //         ),
                      //         BlocProvider<BranchBloc>(
                      //           create: (context) => diContainer.branchBloc,
                      //         ),
                      //       ],
                      //       child: BranchPage(
                      //         selectedBranch: selectedValue!,
                      //         restrictionList: restrictionList,
                      //       ),
                      //     ),
                      //   ),
                      // );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Go',
                            style: TextStyle(fontSize: fontsize),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: accentCanvasColor,
                        ),
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

          // bottom: TabBar(tabs: [Tab(
          //   child: _dropDown(BuildContext),
          // )]),
          // leading: IconButton(
          //   onPressed: () {
          //     // if (!Platform.isAndroid && !Platform.isIOS) {
          //     //   _controller.setExtended(true);
          //     // }
          //     // _key.currentState?.openDrawer();
          //   },
          //   icon: const Icon(
          //     Icons.menu,
          //     color: white,
          //   ),
          // ),
          actions: [
            const Tooltip(
                message: 'Manager',
                child: Icon(
                  Icons.person,
                  color: white,
                )),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => const LoginPage()));
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
        body: Row(
          children: [
            SidebarX(
              controller: _controller,
              theme: SidebarXTheme(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: canvasColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                hoverColor: scaffoldBackgroundColor,
                textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                selectedTextStyle: const TextStyle(color: Colors.white),
                itemTextPadding: const EdgeInsets.only(left: 30),
                selectedItemTextPadding: const EdgeInsets.only(left: 30),
                itemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: canvasColor),
                ),
                selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: actionColor.withOpacity(0.37),
                  ),
                  gradient: const LinearGradient(
                    colors: [accentCanvasColor, canvasColor],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.28),
                      blurRadius: 30,
                    )
                  ],
                ),
                iconTheme: IconThemeData(
                  color: Colors.white.withOpacity(0.7),
                  size: 20,
                ),
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 20,
                ),
              ),
              extendedTheme: const SidebarXTheme(
                width: 200,
                decoration: BoxDecoration(
                  color: canvasColor,
                ),
              ),
              // footerDivider: divider,
              headerBuilder: (context, extended) {
                return const FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      // child: Image.asset('images/house2.jpg')
                      child: Icon(
                        Icons.shopify_rounded,
                        color: white,
                        size: 50,
                      )
                      // Text('Image', selectionColor: Colors.white,)
                      // Image.asset('assets/images/avatar.png')
                      ,
                    ),
                  ),
                );
              },
              items: [
                SidebarXItem(
                  icon: Icons.home,
                  label: 'Home',
                  onTap: () {
                    // debugPrint('Home');
                  },
                ),
                const SidebarXItem(
                  icon: Icons.add_circle,
                  label: 'Register Employee',
                ),
                const SidebarXItem(
                  icon: Icons.info,
                  label: 'Info',
                ),
              ],
              // footerItems: [
              //   SidebarXItem(
              //     icon: Icons.power_settings_new_rounded,
              //     label: 'Logout',
              //     onTap: () {
              //       // // debugPrint('Logout');
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) => const LoginPage()));
              //     },
              //   )
              // ],
            ),
            Expanded(
              child: Center(
                child: _ScreensExample(
                  controller: _controller,
                  shopId: _selectedBranch,
                ),
              ),
            ),
          ],
        )

        // ExampleSidebarX(controller: _controller)
        ,
        // body: Row(
        //   children: [
        //     Expanded(
        //       child: Center(
        //         child: _ScreensExample(
        //           controller: _controller,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        bottomNavigationBar: const BottomAppBar(
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
}

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({
    required this.controller,
    required this.shopId,
  });
  final String shopId;
  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  late String _shopId;
  @override
  void initState() {
    super.initState();
    _shopId = widget.shopId;
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
            return InfoBranchPage(
              shopId: _shopId,
            );

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
