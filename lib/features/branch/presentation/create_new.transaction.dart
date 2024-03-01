import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/global_widgets/font.style.dart';
import 'package:shop_ui/core/global_widgets/sidebar.dart';
import 'package:shop_ui/core/global_widgets/theme_colors.dart';

class CreateTransactions extends StatefulWidget {
  const CreateTransactions({super.key});

  @override
  State<CreateTransactions> createState() => _CreateTransactionsState();
}

class _CreateTransactionsState extends State<CreateTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: canvasColor,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SideBar(),
              Padding(
                padding: EdgeInsets.only(top: 60, left: 200),
                child: TransactionBody(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              'Create Transaction',
              style: GoogleFonts.ubuntu(
                fontSize: 40,
                color: const Color.fromRGBO(40, 120, 19, 1),
              ),
            ),
          )
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

//
//Transaction body
//

class TransactionBody extends StatefulWidget {
  const TransactionBody({super.key});

  @override
  State<TransactionBody> createState() => _TransactionBodyState();
}

class _TransactionBodyState extends State<TransactionBody> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width / 1.7,
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Date detailes
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 190,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Date'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 190,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Time'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //costumer details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 310,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Customer ID'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Service Type'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Load details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Load Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Load Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Load'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Detergent details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Detergent Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Detergent Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Detergent'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Fabcon details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Fabcon Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Fabcon Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Fabcon'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Bleach details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Bleach Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Bleach Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Bleach'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Bounce details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Bounce Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Bounce Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Bounce'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Babad details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Babad Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Babad Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Babad'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Perla details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Perla Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Perla Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Perla'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Dry details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Dry Quantity'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Dry Amount'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 230,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Total Dry'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //Other details
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        width: 480,
                        child: TextFormField(
                          decoration: InputDecoration(
                            label: const Text('Others'),
                            labelStyle: FontStyle.ubuntu,
                            border: const OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 140,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(40, 120, 19, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Submit',
                            style: GoogleFonts.ubuntu(
                              fontSize: 20,
                              color: const Color.fromARGB(216, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 140,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.deepPurple),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.ubuntu(
                              fontSize: 20,
                            ),
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
    );
  }
}
