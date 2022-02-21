import 'package:flutter/material.dart';
import '../res/AppContextExtension.dart';
import '../view/widget/LoadingWidget.dart';
import '../view/widget/MyErrorWidget.dart';
import '../view/widget/MyTextView.dart';
import 'package:provider/provider.dart';

import '../data/remote/response/ApiStatus.dart';
import '../models/UserModel.dart';
import '../view_model/UserVM.dart';
import 'UserDetailsScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home_screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserVM viewModel = UserVM();

  @override
  void initState() {
    viewModel.fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child:
                MyTextView(label: context.resources.strings.homeScreenTitle)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ChangeNotifierProvider<UserVM>(
        create: (BuildContext context) => viewModel,
        child: Consumer<UserVM>(builder: (context, viewModel, _) {
          switch (viewModel.userModel.status) {
            case ApiStatus.LOADING:
              print("Log :: LOADING");
              return LoadingWidget();
            case ApiStatus.ERROR:
              print("Log :: ERROR");
              return MyErrorWidget(viewModel.userModel.message ?? "NA");
            case ApiStatus.COMPLETED:
              print("Log :: COMPLETED");
              return _getUsersListView(viewModel.userModel.data?.users);
            default:
          }
          return Container();
        }),
      ),
    );
  }

  Widget _getUsersListView(List<User>? users) {
    return ListView.builder(
        itemCount: users?.length,
        itemBuilder: (context, position) {
          return _getUserListItem(users![position]);
        });
  }

  Widget _getUserListItem(User item) {
    return Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        // leading: ClipRRect(
        //   child: Image.network(
        //     item.imagePath ?? "",
        //     errorBuilder: (context, error, stackTrace) {
        //       return Image.asset('assets/images/error.png');
        //     },
        //     fit: BoxFit.fill,
        //     width: context.resources.dimension.listImageSize,
        //     height: context.resources.dimension.listImageSize,
        //   ),
        //   borderRadius: BorderRadius.circular(
        //       context.resources.dimension.imageBorderRadius),
        // ),
        title: MyTextView(label: item.name ?? "NA"),
        subtitle: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: MyTextView(label: item.note ?? "NA"),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: MyTextView(label: item.phone ?? "NA"),
          ),
        ]),
        onTap: () {
          _goToDetailScreen(context, item);
        },
      ),
      elevation: context.resources.dimension.lightElevation,
    );
  }

  void _goToDetailScreen(BuildContext context, User item) {
    Navigator.pushNamed(context, UserDetailsScreen.id, arguments: item);
  }
}
