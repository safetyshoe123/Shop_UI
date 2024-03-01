import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/global_widgets/theme_colors.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/shop/presentation/shopdropdown.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key, required this.restriction});
  final List restriction;

  @override
  State<ShopPage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<ShopPage> {
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
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: ShopDrop(
          restriction: _restriction,
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
