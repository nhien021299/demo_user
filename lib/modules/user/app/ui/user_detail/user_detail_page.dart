import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/app/ui/user_detail/user_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:suga_core/suga_core.dart';

class UserDetailPage extends StatefulWidget {
  final int id;

  const UserDetailPage({Key key, this.id}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends BaseViewState<UserDetailPage, UserDetailViewModel> {
  @override
  UserDetailViewModel createViewModel() => injector<UserDetailViewModel>();

  @override
  void loadArguments() {
    viewModel.id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Detail'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              viewModel.backToListUser();
            },
          ),
        ),
        body: Center(
          child: Obx(
            () => viewModel.user == null
                ? Container()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'ID: ${viewModel.user.id}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Name: ${viewModel.user.name}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'User Name: ${viewModel.user.username}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Email: ${viewModel.user.email}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Address:',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Street: ${viewModel.user.address.street}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Suite: ${viewModel.user.address.suite}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'City: ${viewModel.user.address.city}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Zip Code: ${viewModel.user.address.zipCode}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        child: Text(
                          'Geo:',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text(
                          'Lat: ${viewModel.user.address.geo.lat}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                        child: Text(
                          'Lng: ${viewModel.user.address.geo.lng}',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
