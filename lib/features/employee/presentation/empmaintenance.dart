import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/employee/presentation/employeeadd.dart';

// enum SampleItem { itemOne, itemTwo, itemThree }

class EmpMaintenance extends StatefulWidget {
  const EmpMaintenance({super.key});

  @override
  State<EmpMaintenance> createState() => _EmpMaintenanceState();
}

class _EmpMaintenanceState extends State<EmpMaintenance> {
 

  // final _dateController = dateToDisplay;
 


  // late BranchBloc branchBloc;
  // final DIContainer diContainer = DIContainer();
  // @override
  // void initState() {
  //   super.initState();
  //   branchBloc = BlocProvider.of<BranchBloc>(context);
  //   // _branchBloc.add(GetBranchEvent());
  // }

  // SampleItem? selectMenu;
  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SizedBox(
          height: screenSize.height / 1.05,
          width: screenSize.width / 1,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, right: 900),
                      child: Text(
                        'Employee List',
                        style: GoogleFonts.ptSerif(
                          textStyle: const TextStyle(
                              color: Color.fromRGBO(40, 120, 19, 1),
                              fontSize: 50,
                              letterSpacing: .5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: IconButton(
                          onPressed: () {
                            _displayAddEmp(context);
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) =>
                            //             const AddEmpPage()),
                            //     ModalRoute.withName('/'));
                          },
                          icon: const Icon(
                            Icons.person_add_alt_1,
                            size: 40,
                            color: Colors.brown,
                          )),
                    )
                  ],
                ),
                const SizedBox(
                    height: 30,
                    width: 1300,
                    child: Divider(thickness: 2, color: Colors.brown)),
                Builder(builder: (context) {
                  // final isSmallScreen = MediaQuery.of(context).size.width < 600;
                  return FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 800,
                        width: 1400,
                        child: ListView.builder(
                          itemCount: 10,
                          padding: const EdgeInsets.only(top: 10),
                          itemBuilder: (context, index) => Container(
                            height: 100,
                            width: 10,
                            margin: const EdgeInsets.only(
                                bottom: 15, right: 50, left: 50),
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color.fromRGBO(40, 120, 19, 1))),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white70,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 5.0,
                                    offset: Offset(0, 3))
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             const EmployeePage()));
                                // return const InfoEmployeePage();
                                // _displayEmployee(context);
                                // Your click event code here
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => const EmployeeDash()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Icon(Icons.account_circle_rounded),
                                    ),
                                    // const SizedBox(
                                    //   width: 20,
                                    // ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Emp-10',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: fontsize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Last name',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                            color: Colors.brown,
                                            fontSize: fontsize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'First name',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                            color: Colors.brown,
                                            fontSize: fontsize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Middle name',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                            color: Colors.brown,
                                            fontSize: fontsize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Status',
                                        style: GoogleFonts.ptSerif(
                                          textStyle: const TextStyle(
                                              color: Colors.brown,
                                              fontSize: fontsize,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        maxLines: 1,
                                        softWrap: false,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon:
                                            const Icon(Icons.more_vert_rounded))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _displayAddEmp(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: FittedBox(
              fit: BoxFit.scaleDown,
              child: AddEmpPage()
            ),
          );
        });
  }
}

const double fontsize = 17;
