import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = ['Top', 'Users', 'Videos', 'Sounds', 'LIVE', 'Shopping', 'Brands'];

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onSearchChanged(String value) {
    print("_onSearchChanged >> $value");
  }

  void _onSearchSubmitted(String value) {
    print("_onSearchSubmitted >> $value");
  }

  void _onClearTap() {
    _textEditingController.clear();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.sliders,
                size: Sizes.size16 + Sizes.size2,
              ),
            )
          ],
          elevation: 1,
          title: SizedBox(
            height: Sizes.size36,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size2,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  onChanged: _onSearchChanged,
                  onSubmitted: _onSearchSubmitted,
                  controller: _textEditingController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Sizes.size12,
                      ),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size12,
                      vertical: Sizes.size10,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: Sizes.size20,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: _onClearTap,
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          bottom: TabBar(
            onTap: (value) => FocusScope.of(context).unfocus(),
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs) Tab(text: tab),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size6,
                vertical: Sizes.size6,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 9 / 20,
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
              ),
              itemBuilder: (context, index) {
                return LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Column(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Sizes.size4),
                          ),
                          child: AspectRatio(
                            aspectRatio: 9 / 16,
                            child: FadeInImage.assetNetwork(
                              fit: BoxFit.cover,
                              placeholder: "assets/images/placeholder.jpg",
                              image:
                                  'https://images.unsplash.com/photo-1673844969019-c99b0c933e90?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                            ),
                          ),
                        ),
                        Gaps.v10,
                        const Text(
                          "This is a very long caption for my tiktok that I'm upload just not currently.",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gaps.v8,
                        // 부모 widget의 constraint에 따라 조절하는 예제
                        if (constraints.maxWidth < 210 ||
                            constraints.maxWidth > 250)
                          DefaultTextStyle(
                            style: TextStyle(
                              color: isDarkMode(context)
                                  ? Colors.grey.shade300
                                  : Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                      'https://avatars.githubusercontent.com/u/23008504?v=4'),
                                ),
                                Gaps.h4,
                                const Expanded(
                                  child: Text(
                                    'My avatar is going to be very long',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Gaps.h4,
                                FaIcon(
                                  FontAwesomeIcons.heart,
                                  size: Sizes.size16,
                                  color: Colors.grey.shade600,
                                ),
                                Gaps.h2,
                                const Text(
                                  '2.5M',
                                ),
                              ],
                            ),
                          )
                      ],
                    );
                  },
                );
              },
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
