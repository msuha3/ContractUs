import 'package:contractus/models/Seller.dart';
import 'package:contractus/models/category.dart';
import 'package:contractus/models/service.dart';
import 'package:contractus/screen/widgets/cards/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:contractus/screen/client%20screen/client%20home/popular_services.dart';
import 'package:contractus/screen/client%20screen/client%20home/recently_view.dart';
import 'package:contractus/screen/client%20screen/client%20home/top_seller.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/cards/sellerscard.dart';
import '../../widgets/cards/servicecard.dart';
import '../../widgets/constant.dart';
import '../../widgets/topbars/client_home_bar.dart';
import '../client notification/client_notification.dart';
import '../client service details/client_service_details.dart';
import '../search/search.dart';
import 'client_all_categories.dart';

class ClientHomeScreen extends StatefulWidget {
  ClientHomeScreen({this.signedin = false});
  bool signedin;

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kDarkWhite,
        appBar: AppBar(
          backgroundColor: kDarkWhite,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: ClientHomeBar(signedin: widget.signedin,),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            width: context.width(),
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
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: kDarkWhite,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        visualDensity: const VisualDensity(vertical: -2),
                        leading: const Icon(
                          FeatherIcons.search,
                          color: kNeutralColor,
                        ),
                        title: Text(
                          'Search services...',
                          style: kTextStyle.copyWith(color: kSubTitleColor),
                        ),
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  HorizontalList(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 15),
                    spacing: 10.0,
                    itemCount: 10,
                    itemBuilder: (_, i) {
                      return Container(
                        height: 140,
                        width: 304,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(image: AssetImage('images/banner.png'), fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'Categories',
                          style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => const ClientAllCategories().launch(context),
                          child: Text(
                            'View All',
                            style: kTextStyle.copyWith(color: kLightNeutralColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalList(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15.0, right: 15.0),
                    spacing: 10.0,
                    itemCount: catName.length,
                    itemBuilder: (_, i) {

                      return CategoryCard(
                          category: Category(
                              title: catName[i],
                              desc: '',
                              img: catIcon[i]
                          ),
                      );

                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10),
                    child: Row(
                      children: [
                        Text(
                          'Popular Services',
                          style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => const PopularServices().launch(context),
                          child: Text(
                            'View All',
                            style: kTextStyle.copyWith(color: kLightNeutralColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalList(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15.0, right: 15.0),
                    spacing: 10.0,
                    itemCount: 7,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'Top Sellers',
                          style: kTextStyle.copyWith(color: kNeutralColor,fontSize: fontnormalsize ,fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => const TopSeller().launch(context),
                          child: Text(
                            'View All',
                            style: kTextStyle.copyWith(color: kLightNeutralColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  HorizontalList(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 20, left: 15.0, right: 15.0),
                    spacing: 10.0,
                    itemCount: 10,
                    itemBuilder: (_, i) {
                      return SellersCard(seller: Seller(name: 'Williams', image: '', level: i.toString(), rating: '5.0', ratingcount: i.toString() + '0'),);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'Recent Viewed',
                          style: kTextStyle.copyWith(color: kNeutralColor, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => const RecentlyView().launch(context),
                          child: Text(
                            'View All',
                            style: kTextStyle.copyWith(color: kLightNeutralColor),
                          ),
                        ),
                      ],
                    ),
                  ),

                  HorizontalList(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 20, bottom: 10, left: 15.0, right: 15.0),
                    spacing: 10.0,
                    itemCount: 7,
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
