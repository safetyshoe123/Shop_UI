import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shop_ui/features/branch/presentation/branchdash2.dart';

class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key, });

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 250,
                  width: 1350,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 229, 231, 231),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(161, 27, 94, 31),
                                    offset: Offset(3, 4),
                                  )
                                ],
                              ),
                              height: 150,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Daily Sales',
                                      style: GoogleFonts.lato(
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3.4,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '100',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                              Text(
                                                'No. of Transactions',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 10,
                                                  color: const Color.fromARGB(
                                                      168, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                '₱15,000.00',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Daily Target',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 15),
                                      child: Row(
                                        children: [
                                          const Text(
                                            '80%',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '₱12,200.00',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    LinearPercentIndicator(
                                      backgroundColor:
                                          const Color.fromARGB(99, 76, 175, 79),
                                      percent: 0.8,
                                      progressColor: Colors.green,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        'Today\'s Income',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              168, 28, 4, 4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 229, 231, 231),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(161, 13, 72, 161),
                                    offset: Offset(3, 4),
                                  )
                                ],
                              ),
                              height: 150,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Weekly Sales',
                                      style: GoogleFonts.lato(
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3.4,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '100',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                              Text(
                                                'No. of Transactions',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 10,
                                                  color: const Color.fromARGB(
                                                      168, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                '₱100,000.00',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Weekly Target',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 15),
                                      child: Row(
                                        children: [
                                          const Text(
                                            '30%',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '₱38,400.00',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    LinearPercentIndicator(
                                      backgroundColor: const Color.fromARGB(
                                          99, 33, 149, 243),
                                      percent: 0.3,
                                      progressColor: Colors.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        'Week\'s Income',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              168, 28, 4, 4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 229, 231, 231),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(161, 74, 20, 140),
                                    offset: Offset(3, 4),
                                  )
                                ],
                              ),
                              height: 150,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Monthly Sales',
                                      style: GoogleFonts.lato(
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 3.4),
                                              child: Text(
                                                '100',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'No. of Transactions',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                '₱400,000.00',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Monthly Target',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 15),
                                      child: Row(
                                        children: [
                                          const Text(
                                            '50%',
                                            style: TextStyle(
                                              color: Colors.purple,
                                              fontSize: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '₱213,600.00',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    LinearPercentIndicator(
                                      backgroundColor: const Color.fromARGB(
                                          93, 155, 39, 176),
                                      percent: 0.5,
                                      progressColor: Colors.purple,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        'Month\'s Income',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              168, 28, 4, 4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 229, 231, 231),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(115, 32, 201, 187),
                                    //Color.fromARGB(90, 32, 201, 187)
                                    offset: Offset(3, 4),
                                  )
                                ],
                              ),
                              height: 150,
                              width: 250,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Yearly Sales',
                                      style: GoogleFonts.lato(
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3.4,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '100',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                              Text(
                                                'No. of Transactions',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 10,
                                                  color: const Color.fromARGB(
                                                      168, 0, 0, 0),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                '₱5,000,000.00',
                                                style: GoogleFonts.lato(
                                                  color: const Color.fromARGB(
                                                      213, 0, 0, 0),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'Yearly Target',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, top: 15),
                                      child: Row(
                                        children: [
                                          const Text(
                                            '80%',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  185, 22, 142, 132),
                                              fontSize: 10,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              '₱3,763,200.00',
                                              style: GoogleFonts.ubuntu(
                                                fontSize: 10,
                                                color: const Color.fromARGB(
                                                    168, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    LinearPercentIndicator(
                                      backgroundColor: const Color.fromARGB(
                                          90, 60, 150, 142),
                                      percent: 0.8,
                                      progressColor: const Color.fromARGB(
                                          131, 49, 235, 220),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: Text(
                                        'Year\'s Income',
                                        style: GoogleFonts.ubuntu(
                                          fontSize: 10,
                                          color: const Color.fromARGB(
                                              168, 28, 4, 4),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(bottom: 40), child: BranchDash2()),
              ],
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: SizedBox(
                height: 750,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 229, 231, 231),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(89, 59, 70, 60),
                          offset: Offset(3, 4),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          header: Padding(
                            padding: const EdgeInsets.only(bottom: 50),
                            child: Text(
                              'Orders',
                              style: GoogleFonts.lato(
                                  fontSize: 25, color: Colors.brown),
                            ),
                          ),
                          backgroundColor:
                              const Color.fromARGB(32, 255, 153, 0),
                          lineWidth: 20,
                          footer: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Total',
                              style: GoogleFonts.lato(
                                fontSize: fontsize,
                              ),
                            ),
                          ),
                          radius: 80,
                          percent: 0.8,
                          center: Text(
                            '314',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                            ),
                          ),
                          progressColor: Colors.brown,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 50),
                          child: Row(
                            children: [
                              const Icon(Icons.pending_actions_rounded),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Pending',
                                  style: GoogleFonts.lato(
                                      fontSize: 18, color: Colors.brown),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 80),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '214',
                                  style: GoogleFonts.lato(
                                    fontSize: fontsize,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 50),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.delivery_dining_rounded,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'For Delivery/Pick Up',
                                  style: GoogleFonts.lato(
                                      fontSize: 18, color: Colors.brown),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 80),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '70',
                                  style: GoogleFonts.lato(
                                    fontSize: fontsize,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 50),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.library_add_check_outlined,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Delivered',
                                  style: GoogleFonts.lato(
                                      fontSize: 18, color: Colors.brown),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 80),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  '30',
                                  style: GoogleFonts.lato(
                                    fontSize: fontsize,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
  }
}

const double fontsize = 17;
