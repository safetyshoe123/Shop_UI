import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/presentation/pages/branch.dart';

class ShopDash extends StatefulWidget {
  const ShopDash({super.key
  
  });

  @override
  State<ShopDash> createState() => _ShopDashState();
}

class _ShopDashState extends State<ShopDash> {
  @override
  Widget build(BuildContext context) {
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
                margin: const EdgeInsets.only(bottom: 5, right: 50, left: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white54,
                  boxShadow: const [BoxShadow()],
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Shop-ID',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(3),
                          child: Text(
                            'Shop',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            'Address',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      // Padding(padding: EdgeInsets.all(2)),
                    ],
                  ),
                ),
              ),
            ),
          ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BranchPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  'Shop-1',
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
                                padding: const EdgeInsets.all(7),
                                child: Text(
                                  'DBIC',
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
                                padding: const EdgeInsets.all(7),
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
}
