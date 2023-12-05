import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../employee/presentation/employee.dart';

class ShopDash extends StatefulWidget {
  const ShopDash({super.key});

  @override
  State<ShopDash> createState() => _ShopDashState();
}

class _ShopDashState extends State<ShopDash> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '-SHOP NAME- DASHBOARD',
                style: GoogleFonts.ptSerif(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(40, 120, 19, 1),
                      fontSize: 50,
                      letterSpacing: .5),
                ),
              ),
            ),
          ),
          _searchBar(context),
          SizedBox(
            width: screenSize.width/1.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    iconSize: 40,
                    padding: const EdgeInsets.all(10),
                    onPressed: () {
                      _shopInfo(context);
                    },
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.grey.shade600,
                    )),
                // const SizedBox(
                //   width: 650,
                // ),
                Row(
                  children: [
                    IconButton(
                        iconSize: 40,
                        padding: const EdgeInsets.all(10),
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_to_photos_sharp,
                          color: Colors.grey.shade600,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        iconSize: 40,
                        padding: const EdgeInsets.all(10),
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit_document,
                          color: Colors.grey.shade600,
                        )),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenSize.width/1.3,
            child: Container(
              height: 5,
              width: 1400,
              margin: const EdgeInsets.only(bottom: 5, right: 50, left: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white54,
                boxShadow: const [BoxShadow()],
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(3),
            alignment: Alignment.bottomCenter,
            height: screenSize.width/4.5,
            width: screenSize.width/1.4,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse
                  }),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: const EdgeInsets.only(top: 10),
                itemBuilder: (context, index) => SizedBox(
                  height: screenSize.height / 10,
                      width: screenSize.width / 3.8,
                  child: Container(
                    // height: 1500,
                    // width: 500,
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
                    child: FloatingActionButton(
                      heroTag: 'btn $index',
                      hoverColor: Colors.grey.shade400,
                      splashColor: Colors.white38,
                      backgroundColor: Colors.white70,
                      onPressed: () {
                        // Your click event code here
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const EmployeePage()));

                      },
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                width: 300,
                                height: 80,
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    'Branch-1',
                                    style: GoogleFonts.ptSerif(
                                      textStyle: const TextStyle(
                                          color: Colors.brown,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  'DOSC',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                        color: Colors.brown,
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  'Cebu City',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                        color: Colors.brown,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Text(
                                  '11-29-2023',
                                  style: GoogleFonts.ptSerif(
                                    textStyle: const TextStyle(
                                        color: Colors.brown,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  maxLines: 1,
                                  softWrap: false,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // ),
        ],
      ),
    );
  }

  _searchBar(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screenSize.width/2.5,
          // height: 50,
          // width: 500,
      
          child: SearchAnchor(
              viewSurfaceTintColor: Colors.white70,
              viewBackgroundColor: Colors.white70,
              builder:
                  (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
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
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
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
    );
  }

  Future<void> _shopInfo(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Shop Info'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Shop-ID: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Shop-1',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Address 1: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Mandaue City',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Address 2: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Liloan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'No Notes',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Remark',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Good Remarks',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
