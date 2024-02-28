import 'package:flutter/cupertino.dart';
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
      duration: const Duration(milliseconds: 300),
      iconSize: 30,
      selectedIconBox: const Color.fromARGB(170, 50, 121, 9),
      selectedTextColor: const Color.fromARGB(255, 242, 239, 239),
      selectedIconColor: const Color.fromARGB(255, 242, 239, 239),
      unselectedIconColor: const Color.fromARGB(255, 242, 239, 239),
      unselectedTextColor: const Color.fromARGB(255, 242, 239, 239),
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
        text: 'Shop',
        // iconImage: const AssetImage("images/house2.jpg"),
        icon: Icons.ac_unit,
        onPressed: () {},
        isSelected: true,
        subItems: [
          CollapsibleItem(
            text: 'Cart',
            icon: Icons.shopping_cart,
            onPressed: () {},
            isSelected: true,
          )
        ],
      ),
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Ice-Cream',
        icon: Icons.icecream,
        onPressed: () {},
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () {},
      ),
    ];
  }
}
