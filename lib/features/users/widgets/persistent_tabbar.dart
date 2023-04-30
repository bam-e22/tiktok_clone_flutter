import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/sizes.dart';

class PersistentTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade200,
            width: 0.5,
          ),
        ),
      ),
      child: const TabBar(
        labelColor: Colors.black,
        indicatorColor: Colors.black,
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Tab(
            icon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: Icon(Icons.grid_4x4_rounded),
            ),
          ),
          Tab(
            icon: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.size20,
              ),
              child: FaIcon(FontAwesomeIcons.heart),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 69;

  @override
  double get minExtent => 69;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}