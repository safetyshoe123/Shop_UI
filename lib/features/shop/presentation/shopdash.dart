import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/dependency_injection/di_container.dart';
import 'package:shop_ui/core/enums/enum.dart';
import 'package:shop_ui/core/global_widgets/snackbar.dart';
import 'package:shop_ui/features/auth/domain/bloc/auth_bloc.dart';
import 'package:shop_ui/features/auth/presentation/login.dart';
import 'package:shop_ui/features/branch/domain/bloc/branch_bloc.dart';
// import 'package:shop_ui/features/branch/presentation/branch_new.dart';

class ShopDash extends StatefulWidget {
  const ShopDash({super.key, required this.shopId});
  final String shopId;
  @override
  State<ShopDash> createState() => _ShopDashState();
}

class _ShopDashState extends State<ShopDash> {
  late BranchBloc _branchBloc;
  late AuthBloc _authBloc;
  late String _shopId;
  final DIContainer diContainer = DIContainer();

  @override
  void initState() {
    super.initState();
    _branchBloc = BlocProvider.of<BranchBloc>(context);
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _shopId = widget.shopId;
    _branchBloc.add(GetBranchADMEvent(shopId: _shopId));
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
        return BlocConsumer<BranchBloc, BranchState>(
          listener: _branchListener,
          builder: (context, branchState) {
            if (branchState.stateStatus == StateStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
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
                  // const SizedBox(
                  //   height: 20,
                  // ),
            
                  SizedBox(
                      height: 20,
                      width: screenSize.width / 1.4,
                      child: const Divider(
                        thickness: 2,
                      )),
            
                  Container(
                    padding: const EdgeInsets.all(3),
                    alignment: Alignment.bottomCenter,
                    height: screenSize.width / 3.5,
                    width: screenSize.width / 1.37,
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse
                          }),
                      child: Builder(builder: (context) {
                        if (branchState.isEmpty == true) {
                          return const Center(
                            child: Text('No Branch to display'),
                          );
                        }
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: branchState.branchModel.length,
                          itemBuilder: (context, index) {
                            final branchList = branchState.branchModel[index];
                            return FittedBox(
                              fit: BoxFit.scaleDown,
                              child: SizedBox(
                                height: 120,
                                width: 1400,
                                child: Container(
                                  // height: 1500,
                                  // width: 500,
                                  margin: const EdgeInsets.only(
                                      bottom: 15, right: 20, left: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white70,
                                    boxShadow: const [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(95, 65, 64, 64),
                                          blurRadius: 5.0,
                                          offset: Offset(0, 3))
                                    ],
                                  ),
                                  child: FloatingActionButton(
                                    heroTag: 'btn $index',
                                    hoverColor: Colors.grey.shade400,
                                    splashColor: Colors.white38,
                                    backgroundColor: Colors.white70,
                                    onPressed: () {
                                      // Your click event code here
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         BlocProvider(
                                      //       create: (context) =>
                                      //           diContainer.branchBloc,
                                      //     ),
                                      //   ),
                                      // );
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        ListTile(
                                          titleAlignment: ListTileTitleAlignment.center,
                                          leading: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left:100),
                                              child: Text(
                                                branchList.branchId,
                                                style: GoogleFonts.ptSerif(
                                                  textStyle: const TextStyle(
                                                      color: Colors.brown,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                maxLines: 3,
                                                softWrap: true,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          title: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              branchList.branchName,
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 34,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 3,
                                              softWrap: true,
                                              // overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          trailing: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Padding(
                                              padding: const EdgeInsets.only(right:100),
                                              child: Text(
                                                branchList.dateOpened,
                                                style: GoogleFonts.ptSerif(
                                                  textStyle: const TextStyle(
                                                      color: Colors.brown,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                maxLines: 2,
                                                
                                                softWrap: true,
                                            
                                                // overflow: TextOverflow.clip,
                                              ),
                                            ),
                                          ),
                                          subtitle: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              
                                              branchList.address1,
                                              style: GoogleFonts.ptSerif(
                                                textStyle: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                  // ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void _branchListener(BuildContext context, BranchState state) {
    if (state.stateStatus == StateStatus.error) {
      SnackBarUtils.defualtSnackBar(state.errorMessage, context);
    }
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

  // _searchBar(BuildContext context) {
  //   // var screenSize = MediaQuery.of(context).size;
  //   return FittedBox(
  //     fit: BoxFit.scaleDown,
  //     child: Container(
  //       alignment: Alignment.center,
  //       child: SingleChildScrollView(
  //         padding: const EdgeInsets.only(bottom: 10),
  //         child: SizedBox(
  //           width: 800,
  //           child: SearchAnchor(
  //               viewSurfaceTintColor: Colors.white70,
  //               viewBackgroundColor: Colors.white70,
  //               builder: (BuildContext context, SearchController controller) {
  //                 return SearchBar(
  //                   controller: controller,
  //                   padding: const MaterialStatePropertyAll<EdgeInsets>(
  //                       EdgeInsets.symmetric(horizontal: 16.0)),
  //                   onTap: () {
  //                     controller.openView();
  //                   },
  //                   onChanged: (_) {
  //                     controller.openView();
  //                   },
  //                   leading: const Icon(Icons.search),
  //                 );
  //               },
  //               suggestionsBuilder:
  //                   (BuildContext context, SearchController controller) {
  //                 return List<ListTile>.generate(5, (int index) {
  //                   final String item = 'item $index';

  //                   return ListTile(
  //                     title: Text(item),
  //                     onTap: () {
  //                       controller.closeView(item);
  //                     },
  //                   );
  //                 });
  //               }),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
