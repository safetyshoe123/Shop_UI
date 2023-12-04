import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:shop_ui/features/branch/presentation/branch.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class EmployeeDash extends StatefulWidget {
  const EmployeeDash({super.key});

  @override
  State<EmployeeDash> createState() => _EmployeeDashState();
}

class _EmployeeDashState extends State<EmployeeDash> {
  SampleItem? selectMenu;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            child: Text(
              'EMPLOYEE DASHBOARD',
              style: GoogleFonts.ptSerif(
                textStyle: const TextStyle(
                    color: Color.fromRGBO(40, 120, 19, 1),
                    fontSize: 50,
                    letterSpacing: .5),
              ),
            ),
          ),
           SizedBox(
          height: 30, 
          width: screenSize.width/1.5,
          child: const Divider()),
          // Container(
          //   padding: const EdgeInsets.all(5),
          //   alignment: Alignment.bottomCenter,
          //   child: SizedBox(
          //     height: 15,
          //     width: 1400,
          //     child: Container(
          //       margin: const EdgeInsets.only(bottom: 5, right: 50, left: 50),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(20),
          //         color: Colors.white54,
          //         boxShadow: const [BoxShadow()],
          //       ),
          //       // child: SizedBox(
          //       //   width: screenSize.width / 1.3,
          //       //   // child: Container(
          //       //   //   // height: 5,
          //       //   //   // width: 1400,
          //       //   //   margin:
          //       //   //       const EdgeInsets.only(bottom: 5, right: 50, left: 50),
          //       //   //   // decoration: BoxDecoration(
          //       //   //   //   borderRadius: BorderRadius.circular(20),
          //       //   //   //   color: Colors.white54,
          //       //   //   //   boxShadow: const [BoxShadow()],
          //       //   //   // ),
          //       //   //   // child: const Padding(
          //       //   //   //   padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
          //       //   //   // ),
          //       //   // ),
          //       // ),
          //     ),
          //   ),
          // ),
          Builder(builder: (context) {
           
            // final isSmallScreen = MediaQuery.of(context).size.width < 600;
            return Container(
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
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 50, left: 50),
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
                    child: GestureDetector(
                      onTap: () {
                        // Your click event code here
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const BranchPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(5),
                              child: Icon(Icons.account_circle_rounded),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  'Emp-1',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                        color: Colors.brown,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  'Rey Mark Barriga',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                      color: Colors.brown,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  'Mandaue City',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                        color: Colors.brown,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ),
                            PopupMenuButton<SampleItem>(
                              initialValue: selectMenu,
                              // Callback that sets the selected popup menu item.
                              onSelected: (SampleItem item) {
                                setState(() {
                                  selectMenu = item;
                                });
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<SampleItem>>[
                                const PopupMenuItem<SampleItem>(
                                  value: SampleItem.itemOne,
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit),
                                      Text(' Edit'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<SampleItem>(
                                  onTap: () {
                                  setState(() {
                                  
                                  });
                                     
                                  },
                                  value: SampleItem.itemTwo,
                                  child: const Row(
                                    children: [
                                      Icon(Icons.delete),
                                      Text(' Delete'),
                                    ],
                                  ),
                                ),
                                // const PopupMenuItem<SampleItem>(
                                //   value: SampleItem.itemThree,
                                //   child: Text('Item 3'),
                                // ),
                              ],
                            )
                          ],
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
    );
  }

  // _popUpMenu(BuildContext context) {
  //   PopupMenuButton<SampleItem>(
  //     initialValue: selectedMenu,
  //     // Callback that sets the selected popup menu item.
  //     onSelected: (SampleItem item) {
  //       setState(() {
  //         selectedMenu = item;
  //       });
  //     },
  //     itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
  //       const PopupMenuItem<SampleItem>(
  //         value: SampleItem.itemOne,
  //         child: Text('Item 1'),
  //       ),
  //       const PopupMenuItem<SampleItem>(
  //         value: SampleItem.itemTwo,
  //         child: Text('Item 2'),
  //       ),
  //       const PopupMenuItem<SampleItem>(
  //         value: SampleItem.itemThree,
  //         child: Text('Item 3'),
  //       ),
  //     ],
  //   );
  // }
}
