// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _SidebarXExampleAppState();
}

class _SidebarXExampleAppState extends State<HomePage> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      title: 'Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            color: Colors.white,
            fontSize: 46,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      home: Builder(
        builder: (context) {
          final isSmallScreen = MediaQuery.of(context).size.width < 600;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            key: _key,
            appBar: isSmallScreen
                ? AppBar(
                    backgroundColor: canvasColor,
                    title: const Text(''),
                    leading: IconButton(
                      onPressed: () {
                        // if (!Platform.isAndroid && !Platform.isIOS) {
                        //   _controller.setExtended(true);
                        // }
                        _key.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu),
                    ),
                  )
                : null,
            drawer: ExampleSidebarX(controller: _controller),
            body: Row(
              children: [
                if (!isSmallScreen) ExampleSidebarX(controller: _controller),
                Expanded(
                  child: Center(
                    child: _ScreensExample(
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
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
        return const SizedBox(
          height: 100,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              Icons.person,
              color: white,
            )
            // Text('Image', selectionColor: Colors.white,)
            // Image.asset('assets/images/avatar.png')
            ,
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
        SidebarXItem(
          icon: Icons.search,
          label: 'Search',
          onTap: () {
            // debugPrint('Search');
          },
        ),
        const SidebarXItem(
          icon: Icons.add_circle,
          label: 'Add',
        ),
        const SidebarXItem(
          icon: Icons.favorite,
          label: 'Favorites',
        ),
      ],
      footerItems: [
        SidebarXItem(
          icon: Icons.power_settings_new_rounded,
          label: 'Logout',
          onTap: () {
            debugPrint('Logout');
          },
        )
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Text(
                      'DASHBOARD',
                      style: GoogleFonts.ptSerif(
                        textStyle: const TextStyle(
                            color: Color.fromRGBO(40, 120, 19, 1),
                            fontSize: 50,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 40,
                      width: 1400,
                      child: Container(
                        height: 100,
                        width: 10,
                        margin: const EdgeInsets.only(
                            bottom: 5, right: 50, left: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white54,
                          boxShadow: const [BoxShadow()],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(padding: EdgeInsets.all(2)),
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                'Branch Name',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                'Address',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(3),
                              child: Text(
                                'Date Opened',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(2)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 800,
                      width: 1400,
                      child: ListView.builder(
                        itemCount: 1,
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: 10,
                          margin: const EdgeInsets.only(
                              bottom: 15, right: 50, left: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white70,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 5.0,
                                  offset: Offset(0, 3))
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Padding(padding: EdgeInsets.all(2)),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Cebu Branch',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: const TextStyle(
                                          color: Colors.brown,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),
                                  )),
                               Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Mandaue',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: const TextStyle(
                                          color: Colors.brown,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),),
                              ),
                               Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('11-24-23',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: const TextStyle(
                                          color: Colors.brown,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold
                                          ),
                                    ),),
                              ),
                              const Padding(padding: EdgeInsets.all(2)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );

          case 1:
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 500),
              child: Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    SizedBox(
                      child: Text(
                        'SEARCH',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(40, 120, 19, 1),
                              fontSize: 50,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        // height: 50,
                        // width: 500,

                        child: SearchAnchor(
                          viewSurfaceTintColor: Colors.white70 ,
                            viewBackgroundColor: Colors.white70,
                            builder: (BuildContext context,
                                SearchController controller) {
                              return SearchBar(
                                controller: controller,
                                padding:
                                    const MaterialStatePropertyAll<EdgeInsets>(
                                        EdgeInsets.symmetric(horizontal: 16.0)),
                                onTap: () {
                                  controller.openView();
                                },
                                onChanged: (_) {
                                  controller.openView();
                                },
                                leading: const Icon(Icons.search),
                              );
                            },
                            suggestionsBuilder: (BuildContext context,
                                SearchController controller) {
                              return List<ListTile>.generate(5, (int index) {
                                final String item = 'item $index';
                                return ListTile(
                                  title: Text(item),
                                  onTap: () {
                                    controller.closeView(item);
                                  },
                                );
                              });
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            );
            case 2:
            var screenSize = MediaQuery.of(context).size;
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(
                      // child: Text(
                      //   'ADD',
                      //   style: GoogleFonts.ptSerif(
                      //     textStyle: const TextStyle(
                      //         color: Color.fromRGBO(40, 120, 19, 1),
                      //         fontSize: 50,
                      //         letterSpacing: .5),
                      //   ),
                      // ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        child: Container(
                    padding: const EdgeInsets.all(5),
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      // height: 100,
                      
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                height: screenSize.width / 5,
                                width: screenSize.width / 3.8,
                               
                                child: FloatingActionButton(
                                  backgroundColor: Colors.white70,
                                  onPressed: (){
                                
                                
                                }),
                              ),
                              SizedBox(
                                 height: screenSize.width / 5,
                                width: screenSize.width / 3.8,
                                child: FloatingActionButton(
                                  backgroundColor: Colors.white70,
                                  onPressed: (){
                                
                                
                                }),
                              )
                            ],
                          ),
                    ),
                  ),
                      ),
                    ),
                  ],
                ),
              ),
            );

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
