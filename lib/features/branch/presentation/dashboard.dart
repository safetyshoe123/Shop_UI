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
                      height: 120,
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
                            Padding(
                              padding: const EdgeInsets.only(left: 145),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₱11200',
                                    style: GoogleFonts.lato(
                                      color: const Color.fromARGB(213, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    'Today\'s Income',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    '80%',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Daily Target',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              percent: 0.8,
                              progressColor: Colors.green,
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
                      height: 120,
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 145),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₱78400',
                                    style: GoogleFonts.lato(
                                      color: const Color.fromARGB(213, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    'Week\'s Income',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    '30%',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Weekly Target',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              percent: 0.3,
                              progressColor: Colors.blue,
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
                      height: 120,
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 145),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₱313600',
                                    style: GoogleFonts.lato(
                                      color: const Color.fromARGB(213, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    'Month\'s Income',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    '50%',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Monthly Target',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              percent: 0.5,
                              progressColor: Colors.purple,
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
                            color: Color.fromARGB(161, 183, 28, 28),
                            offset: Offset(3, 4),
                          )
                        ],
                      ),
                      height: 120,
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
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 145),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₱3763200',
                                    style: GoogleFonts.lato(
                                      color: const Color.fromARGB(213, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    'Year\'s Income',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(
                                    '80%',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Yearly Target',
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 10,
                                      color: const Color.fromARGB(168, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              percent: 0.8,
                              progressColor: Colors.red,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    '80%',
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
                                  footer: const Text('On Delivery'),
                                  radius: 80,
                                  percent: 0.4,
                                  center: Text(
                                    '40%',
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
                                    '20%',
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
                      child: const LineChartSample2(),
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
