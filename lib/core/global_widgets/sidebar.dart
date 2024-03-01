import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_ui/core/global_widgets/theme_colors.dart';
import 'package:shop_ui/features/branch/presentation/create_new.transaction.dart';
import 'package:shop_ui/features/branch/presentation/data_table.view.dart';

// import 'theme_colors.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return CollapsibleSidebar(
      toggleButtonIcon: Icons.arrow_forward,
      toggleTitleStyle: GoogleFonts.ubuntu(decorationColor: canvasColor),
      title: 'Shop Name',
      duration: const Duration(milliseconds: 200),
      iconSize: 25,
      selectedIconBox: const Color.fromARGB(170, 50, 121, 9),
      selectedTextColor: const Color.fromARGB(255, 255, 252, 252),
      selectedIconColor: const Color.fromARGB(255, 242, 239, 239),
      unselectedIconColor: const Color.fromARGB(255, 242, 239, 239),
      unselectedTextColor: const Color.fromARGB(255, 242, 239, 239),
      customItemOffsetX: -4,
      textStyle: GoogleFonts.roboto(
        decorationColor: canvasColor,
        fontSize: 11.7,
        fontWeight: FontWeight.w200,
      ),
      topPadding: 30,
      bottomPadding: 30,
      maxWidth: 300,
      minWidth: 70,
      toggleTitle: 'Minimize',
      sidebarBoxShadow: const [
        BoxShadow(
          color: Colors.transparent,
        )
      ],
      items: _items,
      backgroundColor: canvasColor,
      body: Container(
        height: double.infinity,
        width: 0,
        color: Colors.transparent,
      ),
    );
  }

  List<CollapsibleItem> get _items {
    return [
      CollapsibleItem(
        text: 'Customer Management',
        icon: Icons.person_rounded,
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const CreateTransactions(),
                ),
              );
            },
          ),
          CollapsibleItem(
            text: 'Update Transaction',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const DataTableView(),
                ),
              );
            },
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
          ]),
      CollapsibleItem(
        text: 'Budget/Forcasting',
        icon: Icons.moving_outlined,
        onPressed: () {},
      ),
    ];
  }
}
