import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';
import 'package:shop_ui/core/global_widgets/font.style.dart';
import 'package:shop_ui/core/global_widgets/sidebar.dart';
import 'package:shop_ui/core/global_widgets/theme_colors.dart';
import 'package:shop_ui/features/branch/presentation/update_transaction.dart';

class DataTableView extends StatefulWidget {
  const DataTableView({super.key});

  @override
  State<DataTableView> createState() => _DataTableViewState();
}

class _DataTableViewState extends State<DataTableView> {
  final PaginationController _paginationController = PaginationController(
    rowCount: rowList.length,
    rowsPerPage: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: canvasColor,
      ),
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 150,
                  top: 50,
                  right: 40,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(169, 245, 227, 227),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ScrollableTableView(
                      headerBackgroundColor:
                          const Color.fromARGB(131, 4, 223, 11),
                      headerHeight: 50,
                      paginationController: _paginationController,
                      headers: headerList.map(
                        (label) {
                          return TableViewHeader(
                            label: label,
                            textStyle: FontStyle.roboto,
                          );
                        },
                      ).toList(),
                      rows: rowList.map(
                        (e) {
                          return TableViewRow(
                            onTap: () {
                              _editOrUpdateDialog(context);
                            },
                            backgroundColor:
                                const Color.fromARGB(82, 201, 200, 200),
                            height: 60,
                            cells: e.map(
                              (value) {
                                return TableViewCell(
                                  child: Text(value),
                                );
                              },
                            ).toList(),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
              Text(
                'Transactions',
                style: GoogleFonts.ubuntu(
                  fontSize: 40,
                  color: const Color.fromRGBO(40, 120, 19, 1),
                ),
              ),
            ],
          ),
          const SideBar(),
        ],
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
    );
  }
}

Future<dynamic> _editOrUpdateDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 68, 78, 70),
        title: Text(
          'Want to delete or update?',
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: const Color.fromARGB(255, 231, 235, 230),
            shadows: const [
              Shadow(
                color: Color.fromARGB(161, 27, 94, 31),
                offset: Offset(0, 3),
              ),
            ],
          ),
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
                  // _logout(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'Delete',
                  style: GoogleFonts.ubuntu(
                    color: const Color.fromARGB(222, 255, 255, 255),
                  ),
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Color.fromARGB(230, 255, 255, 255),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateTransactions(),
                  ),
                  ModalRoute.withName('/'),
                );
              },
              child: Text(
                'Update',
                style: GoogleFonts.ubuntu(
                  color: const Color.fromARGB(222, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

final headerList = [
  'date',
  'time',
  'custId',
  'receivedBy',
  'receivedDateTime',
  '   slipNumber   ',
  'serviceType',
  // 'loadsQty',
  // 'loadsAmount',
  'loadsTotal',
  // 'detergentQty',
  // 'detergentAmount',
  'detergentTotal',
  // 'fabconQty',
  // 'fabconAmount',
  'fabconTotal',
  // 'bleachQty',
  // 'bleachAmount',
  'bleachTotal',
  // 'bounceQty',
  // 'bounceAmount',
  'bounceTotal',
  // 'babadQty',
  // 'babadAmount',
  'babadTotal',
  // 'perlaQty',
  // 'perlAmount',
  'perlaTotal',
  // 'dryQty',
  // 'dryAmount',
  'dryTotal',
  'othersQty',
];

final rowList = [
  [
    'Mar 1',
    '02:56:32',
    'cust000001',
    'Jan Balbon',
    '2024/03/01/02:56:32',
    '2024/03/01mandaueD01001',
    'A',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00'
  ],
  [
    'Mar 1',
    '02:59:32',
    'cust000002',
    'Jan Balbon',
    '2024/03/01/02:56:32',
    '2024/03/01mandaueD01002',
    'B',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00',
    // '20.00'
  ],
];
