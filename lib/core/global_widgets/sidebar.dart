import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

import 'theme_colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return CollapsibleSidebar(
      
      toggleTitleStyle: const TextStyle(decorationColor: canvasColor),
      title: 'Shop Name',
      duration: const Duration(milliseconds: 100),
      iconSize: 25,
      selectedIconBox: const Color.fromARGB(170, 50, 121, 9),
      selectedTextColor: const Color.fromARGB(255, 242, 239, 239),
      selectedIconColor: const Color.fromARGB(255, 242, 239, 239),
      unselectedIconColor: const Color.fromARGB(255, 242, 239, 239),
      unselectedTextColor: const Color.fromARGB(255, 242, 239, 239),
      textStyle: const TextStyle(decorationColor: canvasColor),
      topPadding: 30,
      bottomPadding: 30,
      height: double.infinity,
      maxWidth: 270,
      minWidth: 70,
    
      sidebarBoxShadow: const [
        BoxShadow(
          color: Colors.transparent,
        )
      ],
      items: _items,
      backgroundColor: canvasColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
      ),
    );
  }

  List<CollapsibleItem> get _items {
    return [
      CollapsibleItem(
        text: 'Customer Management',
        icon: Icons.co_present_outlined,
        onPressed: () {},
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Order Management',
        // iconImage: const AssetImage("images/house2.jpg"),
        icon: Icons.published_with_changes_rounded,
        onPressed: () {},
        
        subItems: [
          CollapsibleItem(
            text: 'New Transaction',
            onPressed: () {},
            
          ),
          CollapsibleItem(
            text: 'Update Transaction',
            onPressed: () {},
          ),
          CollapsibleItem(
            text: 'Claim',
            onPressed: () {},
          )
        ],
      ),
      CollapsibleItem(
        text: 'Entry of Expenses',
        icon: Icons.monetization_on_sharp,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Sales Report',
        icon: Icons.point_of_sale_sharp,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Store Management',
        icon: Icons.storefront_sharp,
        onPressed: () {},
        
        subItems: [
           CollapsibleItem(
            text: 'Store Opening',
            onPressed: () {},
            
          ),
          CollapsibleItem(
            text: 'Store Closing',
            onPressed: () {},
            isSelected: true,
          ),
        ]
      ),
      CollapsibleItem(
        text: 'Budget/Forcasting',
        icon: Icons.moving_outlined,
        onPressed: () {},
        
      ),
    ];
  }
}
