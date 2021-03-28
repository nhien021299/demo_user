import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/app/ui/list_address/list_address_page.dart';
import 'package:demo_user/modules/user/app/ui/list_geo/list_geo_page.dart';
import 'package:demo_user/modules/user/app/ui/list_user/list_user_view_model.dart';
import 'package:demo_user/modules/user/app/ui/list_user/widgets/user_item_widget.dart';
import 'file:///D:/Project_Flutter/demo_user/lib/modules/user/app/ui/list_user/widgets/tab_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suga_core/suga_core.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends BaseViewState<ListUserPage, ListUserViewModel> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    viewModel.initTabController(this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: viewModel.tabLength,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Demo User'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 10,bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white70,
                    ),
                    child: TextField(
                      controller: viewModel.searchNameController,
                      cursorColor: Colors.black,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20, top: 13),
                        hintText: "Search",
                        suffixIcon: IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            viewModel.clearText();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      viewModel.queryName(viewModel.searchNameController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: Column(
          children: [
            Obx(
              () => TabBar(
                controller: viewModel.tabController,
                indicatorColor: Colors.red,
                tabs: [
                  TabItemWidget(
                    name: "Name",
                    isSelected: viewModel.isUserNameTabIndex,
                  ),
                  TabItemWidget(
                    name: "Address",
                    isSelected: viewModel.isAddressTabIndex,
                  ),
                  TabItemWidget(
                    name: "Geo",
                    isSelected: viewModel.isGeoTabIndex,
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: viewModel.tabController,
                children: [
                  Obx(
                    () => ListView.builder(
                      itemCount: viewModel.users?.length ?? 0,
                      itemBuilder: (context, index) {
                        return UserItemWidget(
                          user: viewModel.users[index],
                        );
                      },
                    ),
                  ),
                  ListAddressPage(),
                  ListGeoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  ListUserViewModel createViewModel() => injector<ListUserViewModel>();
}
