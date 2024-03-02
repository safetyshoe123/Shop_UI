import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/features/branch/presentation/customer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 50),
        child: FittedBox(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 229, 231, 231),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.group),
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  'Total customers',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        168, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '2,420',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 25,
                                                  color: const Color.fromARGB(
                                                      168, 28, 4, 4),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_upward_rounded,
                                                      size: 17,
                                                    ),
                                                    Text('20 %')
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 229, 231, 231),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.person_rounded),
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  'Total VIPs',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        168, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '723',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 25,
                                                  color: const Color.fromARGB(
                                                      168, 28, 4, 4),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_upward_rounded,
                                                      size: 17,
                                                    ),
                                                    Text('29.88 %')
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 229, 231, 231),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.monitor),
                                            )),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  'Active now',
                                                  style: GoogleFonts.ubuntu(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        168, 0, 0, 0),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '1,589',
                                                style: GoogleFonts.ubuntu(
                                                  fontSize: 25,
                                                  color: const Color.fromARGB(
                                                      168, 28, 4, 4),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    // Icon(Icons.arrow_upward_rounded, size: 17,),
                                                    Text('65.66 %')
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: FloatingActionButton(
                                    splashColor: Colors.grey,
                                    backgroundColor: const Color.fromARGB(
                                        255, 229, 231, 231),
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Icon(
                                              Icons.person_add_alt_1_rounded,
                                              size: 30,
                                              color: Color.fromARGB(
                                                  168, 28, 4, 4)),
                                        ),
                                        Text(
                                          'Add customer',
                                          style: GoogleFonts.ubuntu(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                                168, 28, 4, 4),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: CustomerDash()),
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
                      decoration:  BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: const Color.fromARGB(255, 229, 231, 231),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(89, 59, 70, 60),
                            offset: Offset(3, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Customer Details',
                                  style: GoogleFonts.lato(
                                      fontSize: 25, color: Colors.brown),
                                ),
                                IconButton(
                                 icon: const Icon(Icons.edit_document),
                               onPressed: (){},)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.contact_emergency_rounded,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Customer ID:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Customer Name:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.phone_android_sharp,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Mobile No.:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Address 1:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Address 2:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.my_location_rounded,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'City:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.face_retouching_natural_outlined,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'VIP:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.outgoing_mail,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Transaction Count:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.point_of_sale_sharp,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Total Sales:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.note_add_sharp,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Notes:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bookmark_outline_sharp,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Remark:',
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.brown),
                                  ),
                                ),
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
      ),
    );
  }
}

const double fontsize = 17;
