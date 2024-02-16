import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shop_ui/features/branch/presentation/graph.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: screenSize.height / 4,
            width: screenSize.width / 1,
            child: FittedBox(
              fit: BoxFit.contain,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Daily Sales',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(168, 0, 0, 0),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
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
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '₱12,200.00',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10,
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
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
                                  color: const Color.fromARGB(168, 28, 4, 4),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Weekly Sales',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(168, 0, 0, 0),
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
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
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '₱38,400.00',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10,
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                                  const Color.fromARGB(99, 33, 149, 243),
                              percent: 0.3,
                              progressColor: Colors.blue,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Week\'s Income',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 10,
                                  color: const Color.fromARGB(168, 28, 4, 4),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Monthly Sales',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(168, 0, 0, 0),
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3.4),
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
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
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
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '₱213,600.00',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10,
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                                  const Color.fromARGB(93, 155, 39, 176),
                              percent: 0.5,
                              progressColor: Colors.purple,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Month\'s Income',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 10,
                                  color: const Color.fromARGB(168, 28, 4, 4),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Yearly Sales',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(168, 0, 0, 0),
                                fontSize: 18,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12, top: 15),
                              child: Row(
                                children: [
                                  const Text(
                                    '80%',
                                    style: TextStyle(
                                      color: Color.fromARGB(185, 22, 142, 132),
                                      fontSize: 10,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      '₱3,763,200.00',
                                      style: GoogleFonts.ubuntu(
                                        fontSize: 10,
                                        color:
                                            const Color.fromARGB(168, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            LinearPercentIndicator(
                              backgroundColor:
                                  const Color.fromARGB(90, 60, 150, 142),
                              percent: 0.8,
                              progressColor:
                                  const Color.fromARGB(131, 49, 235, 220),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Year\'s Income',
                                style: GoogleFonts.ubuntu(
                                  fontSize: 10,
                                  color: const Color.fromARGB(168, 28, 4, 4),
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
          SizedBox(
            height: screenSize.height / 2.2,
            width: screenSize.width / 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 300,
                      width: 580,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 229, 231, 231),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(89, 59, 70, 60),
                            offset: Offset(3, 4),
                          )
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Orders: 259',
                              style: GoogleFonts.lato(
                                color: const Color.fromARGB(168, 0, 0, 0),
                                fontSize: 24,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircularPercentIndicator(
                                  backgroundColor:
                                      const Color.fromARGB(32, 255, 153, 0),
                                  lineWidth: 20,
                                  footer: const Text('Pending'),
                                  radius: 80,
                                  percent: 0.8,
                                  center: Text(
                                    '214',
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  progressColor: Colors.orange,
                                ),
                                CircularPercentIndicator(
                                  backgroundColor:
                                      const Color.fromARGB(32, 221, 0, 255),
                                  lineWidth: 20,
                                  footer: const Text('For Delivery / Pick Up'),
                                  radius: 80,
                                  percent: 0.4,
                                  center: Text(
                                    '70',
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  progressColor:
                                      const Color.fromARGB(255, 221, 0, 255),
                                ),
                                CircularPercentIndicator(
                                  backgroundColor:
                                      const Color.fromARGB(32, 0, 150, 135),
                                  lineWidth: 20,
                                  footer: const Text('Delivered'),
                                  radius: 80,
                                  percent: 0.2,
                                  center: Text(
                                    '30',
                                    style: GoogleFonts.ubuntu(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  progressColor: Colors.teal,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 300,
                      width: 580,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 229, 231, 231),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(89, 59, 70, 60),
                            offset: Offset(3, 4),
                          )
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: LineChartSample2(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
