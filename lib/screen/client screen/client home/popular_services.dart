
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../models/service.dart';
import '../../widgets/cards/servicecard.dart';
import '../../widgets/constant.dart';
import '../client service details/client_service_details.dart';

class PopularServices extends StatefulWidget {
  const PopularServices({Key? key}) : super(key: key);

  @override
  State<PopularServices> createState() => _PopularServicesState();
}

class _PopularServicesState extends State<PopularServices> {

  List<String> serviceList = [
    'All',
    'Logo Design',
    'Brand Style Guide',
    'Fonts & Typography',
  ];

  String selectedServiceList = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkWhite,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kDarkWhite,
        centerTitle: true,
        iconTheme: const IconThemeData(color: kNeutralColor),
        title: Text(
          'Popular Services',
          style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              FeatherIcons.sliders,
              color: kNeutralColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Container(
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [

                const SizedBox(height: 15.0),

                HorizontalList(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  itemCount: serviceList.length,
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedServiceList = serviceList[i];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: selectedServiceList == serviceList[i] ? kPrimaryColor : kDarkWhite,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: Text(
                            serviceList[i],
                            style: kTextStyle.copyWith(
                              color: selectedServiceList == serviceList[i] ? kWhite : kNeutralColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (_, i) {

                      return ServiceCard(
                        servicedata: Service(
                          title: catName[i],
                          rating: '5.0',
                          level: 'Seller Level - 1',
                          image: catIcon[i],
                          price: '40\$',
                          favorite: false,
                          name: 'Williams',
                          ratingcount: '400',
                        ),);

                    },
                  ).visible(selectedServiceList == 'All'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
