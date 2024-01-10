import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/branch/presentation/branch.dart';
import 'package:shop_ui/features/branch/presentation/branchdash.dart';

class ShopDrop extends StatefulWidget {
  const ShopDrop({super.key});

  @override
  State<ShopDrop> createState() => _ShopDropState();
}

class _ShopDropState extends State<ShopDrop> {
  final List<String> items = [
    'Branch 1',
    'Branch 2',
    'Branch 3',
    'Branch 4',
    'Branch 5',
    // 'Branch 6',
    // 'Branch 7',
    // 'Branch 8',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
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
          //
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenSize.height / 6),
            child: Center(
              child: DropdownButtonHideUnderline(
                child: SizedBox(
                  width: 500,
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        // Icon(
                        //   Icons.list,
                        //   size: 16,
                        //   color: white,
                        // ),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Select Branch',
                              style: TextStyle(
                                fontSize: fontsize,
                                fontWeight: FontWeight.bold,
                                color: white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                    items: items
                        .map((String item) => DropdownMenuItem<String>(
                              alignment: AlignmentDirectional.center,
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: fontsize,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: accentCanvasColor,
                        ),
                        color: canvasColor,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                      ),
                      iconSize: 14,
                      iconEnabledColor: white,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: screenSize.height / 3,
                      width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.brown.shade300,
                      ),
                      // offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: FloatingActionButton(
              backgroundColor: canvasColor,
              foregroundColor: white,
              splashColor: accentCanvasColor,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BranchPage()));
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Go',
                      style: TextStyle(fontSize: fontsize),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
