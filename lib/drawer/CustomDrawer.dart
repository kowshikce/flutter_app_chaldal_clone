import 'package:flutter/material.dart';
import '../Style/CustomColor.dart' as customColor;
import '../widgets/DrawerMenuItems.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/IconText.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(color: customColor.colorBlack),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Icon(
                            Icons.account_circle,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Guest",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: customColor.colorBlack,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.shop,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "Orders",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: customColor.colorBlack,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "Profile",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: customColor.colorBlack,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(),
                    DrawerMenuItem(
                      icon: Icons.local_offer,
                      label: "Offers",
                    ),
                    DrawerMenuItem(
                      icon: Icons.cloud_circle,
                      label: "Covid-19 Protection",
                    ),
                    DrawerMenuItem(
                      icon: Icons.speaker_phone,
                      label: "New Arrival",
                    ),
                    DrawerMenuItem(
                      icon: Icons.flash_on,
                      label: "Flash Sales",
                    ),
                    DrawerMenuItem(
                      icon: Icons.star_border,
                      label: "Popular",
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.baby,
                      useFa: true,
                      label: "Baby Care",
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.personBooth,
                      label: "Pet Care",
                      useFa: true,
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: Icons.fastfood,
                      label: "Food",
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.home,
                      useFa: true,
                      label: "Home & Cleaning",
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.productHunt,
                      useFa: true,
                      label: "Office Products",
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.briefcaseMedical,
                      useFa: true,
                      label: "Beauty & Health",
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.toolbox,
                      label: "Home Appliances",
                      useFa: true,
                      trailling: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    DrawerMenuItem(
                      icon: FontAwesomeIcons.carAlt,
                      label: "Vehicle Essentials",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: customColor.colorBlack,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconText(
                                    icons: FontAwesomeIcons.discourse,
                                    text: "Coupons",
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconText(
                                    icons: FontAwesomeIcons.phone,
                                    text: "Call us",
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        color: customColor.colorBlack,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconText(
                                    icons: FontAwesomeIcons.rocketchat,
                                    text: "Live Chat",
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: FittedBox(
                                  fit: BoxFit.contain,
                                  child: IconText(
                                    icons: FontAwesomeIcons.powerOff,
                                    text: "Log Out",
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
