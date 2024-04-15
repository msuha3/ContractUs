import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:contractus/screen/seller%20screen/profile/seller_profile.dart';
import 'package:contractus/screen/seller%20screen/seller%20home/my%20service/service_details.dart';
import 'package:contractus/screen/widgets/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../models/service.dart';
import '../../widgets/analytics/earningscard.dart';
import '../../widgets/analytics/performancecard.dart';
import '../../widgets/analytics/statisticscard.dart';
import '../../widgets/cards/myservicecard.dart';
import '../../widgets/cards/servicecard.dart';
import '../../widgets/chart.dart';
import '../../widgets/data.dart';
import '../../widgets/list_options/level_selection.dart';
import '../notification/seller_notification.dart';
import 'my service/my_service.dart';

class SellerHomeScreen extends StatefulWidget {
  const SellerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SellerHomeScreen> createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkWhite,
        appBar: AppBar(
          backgroundColor: kDarkWhite,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: GestureDetector(
                onTap: ()=>const SellerProfile().launch(context),
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/profilepic.png'),
                    ),
                  ),
                ),
              ),
            ),
            title: Text(
              'Mr. Panda Swamy',
              style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'New Seller',
              style: kTextStyle.copyWith(color: kLightNeutralColor),
            ),
            trailing: GestureDetector(
              onTap: () => const SellerNotification().launch(context),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: kPrimaryColor.withOpacity(0.2),
                  ),
                ),
                child: const Icon(
                  IconlyLight.notification,
                  color: kNeutralColor,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            width: context.width(),
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15.0),
                  const PerformanceCard(),
                  const SizedBox(height: 20.0),
                  const StatiscticsCard(),
                  const SizedBox(height: 20.0),
                  const EarningsCard(),
                  const SizedBox(height: 10.0),
                  const LevelSelection(),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Text(
                        'My Services',
                        style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => const MyServices().launch(context),
                        child: Text(
                          'view All',
                          style: kTextStyle.copyWith(color: kLightNeutralColor),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  HorizontalList(
                    spacing: 10.0,
                    padding: const EdgeInsets.only(bottom: 10.0),
                    itemCount: 10,
                    itemBuilder: (_, i) {
                      return MyServiceCard(
                        myservice: Service(
                          title: catName[i],
                          rating: '5.0',
                          level: 'Seller Level - 1',
                          image: catIcon[i],
                          price: '40\$',
                          favorite: false,
                          name: 'Williams',
                          ratingcount: '400',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChartLegend extends StatelessWidget {

  const ChartLegend({
    Key? key,
    required this.iconColor,
    required this.title,
    required this.value,
  }) : super(key: key);

  final Color iconColor;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Icon(
          Icons.circle,
          size: 16.0,
          color: iconColor,
        ),

        const SizedBox(width: 10.0),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: kTextStyle.copyWith(color: kSubTitleColor),
            ),

            const SizedBox(
              height: 5.0,
            ),

            Text(
              value,
              style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
            ),

          ],
        ),

      ],
    );
  }
}
