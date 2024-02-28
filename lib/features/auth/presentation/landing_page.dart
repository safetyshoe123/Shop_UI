import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/global_widgets/sidebar.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/shop/presentation/shopdropdown.dart';
import 'package:sidebarx/sidebarx.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.restriction});
  final List restriction;

  @override
  State<ShopPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<ShopPage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: false);
  final _key = GlobalKey<ScaffoldState>();
  final DIContainer diContainer = DIContainer();

  late AuthBloc _authBloc;
  late List _restriction;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _restriction = widget.restriction;
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
            backgroundColor: canvasColor,
            automaticallyImplyLeading: false,
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
          body: const SideBar(),
          // Row(
          //   children: [
          //     SidebarX(
          //       collapseIcon: Icons.arrow_back,
          //       extendIcon: Icons.arrow_forward,
          //       controller: _controller,
          //       theme: SidebarXTheme(
          //         margin: const EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           color: canvasColor,
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         hoverColor: scaffoldBackgroundColor,
          //         textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
          //         selectedTextStyle: const TextStyle(color: Colors.white),
          //         itemTextPadding: const EdgeInsets.only(left: 30),
          //         selectedItemTextPadding: const EdgeInsets.only(left: 30),
          //         itemDecoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(color: canvasColor),
          //         ),
          //         selectedItemDecoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           border: Border.all(
          //             color: actionColor.withOpacity(0.37),
          //           ),
          //           gradient: const LinearGradient(
          //             colors: [accentCanvasColor, canvasColor],
          //           ),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.black.withOpacity(0.28),
          //               blurRadius: 30,
          //             )
          //           ],
          //         ),
          //         iconTheme: IconThemeData(
          //           color: Colors.white.withOpacity(0.7),
          //           size: 20,
          //         ),
          //         selectedIconTheme: const IconThemeData(
          //           color: Colors.white,
          //           size: 20,
          //         ),
          //       ),
          //       extendedTheme: const SidebarXTheme(
          //         width: 215,
          //         decoration: BoxDecoration(
          //           color: canvasColor,
          //         ),
          //       ),
          //       // footerDivider: divider,
          //       headerBuilder: (context, extended) {
          //         return const SizedBox(
          //           height: 100,
          //           child: Padding(
          //             padding: EdgeInsets.all(16.0),
          //             // child: Image.asset('images/house2.jpg')
          //             child: FittedBox(
          //               fit: BoxFit.scaleDown,
          //               child: Icon(
          //                 Icons.shopify_rounded,
          //                 color: white,
          //                 size: 50,
          //               ),
          //             )
          //             // Text('Image', selectionColor: Colors.white,)
          //             // Image.asset('assets/images/avatar.png')
          //             ,
          //           ),
          //         );
          //       },
          //       items: const [
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'Home',
          //             child: Icon(
          //               Icons.home,
          //               color: white,
          //             ),
          //           ),
          //           label: 'Home',
          //         ),
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'Order Management',
          //             child: Icon(
          //               Icons.published_with_changes_rounded,
          //               color: white,
          //             ),
          //           ),
          //         ),
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'Entry of Expenses',
          //             child: Icon(
          //               Icons.receipt_long_outlined,
          //               color: white,
          //             ),
          //           ),
          //           label: 'Entry of Expenses',
          //         ),
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'Sales Report',
          //             child: Icon(
          //               Icons.report_gmailerrorred_rounded,
          //               color: white,
          //             ),
          //           ),
          //           label: 'Sales Report',
          //         ),
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'List',
          //             child: Icon(
          //               Icons.library_books,
          //               color: white,
          //             ),
          //           ),
          //           label: 'List',
          //         ),
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'Store Management',
          //             child: Icon(
          //               Icons.store,
          //               color: white,
          //             ),
          //           ),
          //           label: 'Store Management',
          //         ),
          //         SidebarXItem(
          //           iconWidget: Tooltip(
          //             message: 'Budget Management',
          //             child: Icon(
          //               Icons.home,
          //               color: white,
          //             ),
          //           ),
          //           label: 'Budget Management',
          //         ),
          //       ],
          //     ),
          //     Expanded(
          //       child: Center(
          //         child: _ScreensExample(
          //           controller: _controller,
          //           restriction: _restriction,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
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

//display sidebar items

class _ScreensExample extends StatefulWidget {
  const _ScreensExample({required this.controller, required this.restriction});
  final List restriction;
  final SidebarXController controller;

  @override
  State<_ScreensExample> createState() => _ScreensExampleState();
}

class _ScreensExampleState extends State<_ScreensExample> {
  late List _restriction;
  @override
  void initState() {
    super.initState();
    _restriction = widget.restriction;
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
            return ShopDrop(
              restriction: _restriction,
            );
          case 1:
            return const Text('Oder Management');
          case 2:
          // return const InfoShopPage();
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
      return 'Order Management';
    case 2:
      return 'Sales Report';
    case 3:
      return 'Entry of Expenses';
    case 4:
      return 'List';
    case 5:
      return 'Budget Management';
    // case 5:
    //   return 'List';
    // case 6:
    //   return 'Logout';
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
