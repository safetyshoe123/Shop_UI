import 'package:flutter/material.dart';

class ShopInfo extends StatefulWidget {
  const ShopInfo({super.key});

  @override
  State<ShopInfo> createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('-Shop Info-'),
      content: Column(
        children: [
          Row(
            children: [
              Text(
                'Shop-ID',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Shop-1',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          Row(
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
    );
  }
}
