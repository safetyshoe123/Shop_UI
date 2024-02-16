import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/branch/presentation/branchadd.dart';
import 'package:shop_ui/features/employee/presentation/empmaintenance.dart';
import 'package:shop_ui/features/shop/presentation/shopdash.dart';
import 'package:shop_ui/features/shop/presentation/shopinfo.dart';
import 'package:sidebarx/sidebarx.dart';

class ShopAdminPage extends StatefulWidget {
  const ShopAdminPage({super.key, required this.shopId});
  final String shopId;

  @override
  State<ShopAdminPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<ShopAdminPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  final _key = GlobalKey<ScaffoldState>();
  final DIContainer diContainer = DIContainer();

  late AuthBloc _authBloc;
  late String _shopId;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _shopId = widget.shopId;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final isSmallScreen = MediaQuery.of(context).size.width < 600;
    return PopScope(
        canPop: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _key,
          appBar:
              // isSmallScreen
              //     ?
              AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: canvasColor,
            title: const Text(''),
            actions: [
              const Tooltip(
                  message: 'Admin',
                  child: Icon(
                    Icons.person,
                    color: white,
                  )),
              const SizedBox(
                width: 10,
              ),
              Tooltip(
                message: 'Logout',
                child: IconButton(
                    onPressed: () {
                      _logoutDialog(context);
                    },
                    icon: const Icon(
                      Icons.power_settings_new_rounded,
                      color: white,
                    )),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          // drawer: Sidebar(controller: _controller),
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
                  width: 230,
                  decoration: BoxDecoration(
                    color: canvasColor,
                  ),
                ),
                // footerDivider: divider,
                headerBuilder: (context, extended) {
                  return const SizedBox(
                    height: 100,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      // child: Image.asset('images/house2.jpg')
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Icon(
                          Icons.shopify_rounded,
                          color: white,
                          size: 50,
                        ),
                      )
                      // Text('Image', selectionColor: Colors.white,)
                      // Image.asset('assets/images/avatar.png')
                      ,
                    ),
                  );
                },
                items: const [
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Home',
                      child: Icon(
                        Icons.home,
                        color: white,
                      ),
                    ),
                    label: 'Home',
                  ),
                  // SidebarXItem(
                  //   icon: Icons.home,
                  //   label: 'Home',
                  //   onTap: () {
                  //     // debugPrint('Home');
                  //   },
                  // ),

                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Register Branch',
                      child: Icon(
                        Icons.add_circle_outline_rounded,
                        color: white,
                      ),
                    ),
                    label: 'Register Branch',
                  ),
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Shop Info',
                      child: Icon(
                        Icons.info,
                        color: white,
                      ),
                    ),
                    label: 'Shop Info',
                  ),
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Employee Maintenance',
                      child: Icon(
                        Icons.attribution_sharp,
                        color: white,
                      ),
                    ),
                    label: 'Employee Maintenance',
                  ),
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Shop Maintenance',
                      child: Icon(
                        Icons.build_circle_outlined,
                        color: white,
                      ),
                    ),
                    label: 'Shop Maintenance',
                  ),
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Transaction',
                      child: Icon(
                        Icons.published_with_changes_rounded,
                        color: white,
                      ),
                    ),
                    label: 'Transaction',
                  ),
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'Report',
                      child: Icon(
                        Icons.report_gmailerrorred_rounded,
                        color: white,
                      ),
                    ),
                    label: 'Report',
                  ),
                  SidebarXItem(
                    iconWidget: Tooltip(
                      message: 'List',
                      child: Icon(
                        Icons.library_books,
                        color: white,
                      ),
                    ),
                    label: 'List',
                  ),

                  // const SidebarXItem(
                  //   icon: Icons.person,
                  //   label: 'Employees',
                  // ),
                ],
                // footerItems: [
                //   SidebarXItem(
                //     icon: Icons.power_settings_new_rounded,
                //     label: 'Logout',
                //     onTap: () {
                //       // debugPrint('Logout');
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
                    shopId: _shopId,
                  ),
                ),
              ),
            ],
          ),
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
        ));
  }

  void _logout(BuildContext context) {
    _authBloc.add(LogoutEvent());
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
                    _logout(context);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Logout',
                    style: GoogleFonts.ubuntu(
                        color: const Color.fromARGB(222, 255, 255, 255)),
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
                      color: const Color.fromARGB(222, 255, 255, 255)),
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
  const _ScreensExample({required this.controller, required this.shopId});

  final SidebarXController controller;
  final String shopId;

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
            return ShopDash(shopId: _shopId);
          case 1:
            return AddBranchPage(
              shopId: _shopId,
            );
          case 2:
            return const InfoShopPage();
          case 3:
            return const EmpMaintenance();
          // case 3:
          //   return const BranchDash();
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
    case 1:
      return 'Search';
    case 2:
      return 'Add';
    case 3:
      return 'Transaction';
    case 4:
      return 'Report';
    case 5:
      return 'List';
    case 6:
      return 'Shop Maintenance';
    case 7:
      return 'Employee Maintenance';
    // case 7:
    //   return 'Logout';
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

//
