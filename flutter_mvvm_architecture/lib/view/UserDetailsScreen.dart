import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import '../view/widget/MyTextView.dart';
import '../res/AppContextExtension.dart';

class UserDetailsScreen extends StatelessWidget {
  static const String id = "user_details";

  final User? user;

  // Receive data from the HomeScreen as a parameter
  UserDetailsScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.resources.strings.detailScreenTitle)),
      body: Container(
        color: context.resources.color.colorWhite,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(context.resources.dimension.smallMargin),
            child: Column(
              children: [
                // Center(
                // child: Image.network(
                //   user?.image_path ?? "",
                //   errorBuilder: (context, error, stackTrace) {
                //     return Image.asset('assets/images/error.png');
                //   },
                //   fit: BoxFit.fill,
                //   height: context.resources.dimension.imageHeight,
                // ),
                // ),
                Card(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.resources.dimension.defaultMargin),
                        child: Row(
                          children: [
                            MyTextView(
                              label: context.resources.strings.labelId + ": "
                            ),
                            MyTextView(
                              label: user?.id ?? ""
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.resources.dimension.defaultMargin),
                        child: Row(
                          children: [
                            MyTextView(
                              label: context.resources.strings.labelName + ": "
                            ),
                            MyTextView(
                                label: user?.name ?? ""
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.resources.dimension.defaultMargin),
                        child: Row(
                          children: [
                            MyTextView(
                              label: context.resources.strings.labelNote + ": "
                            ),
                            MyTextView(
                              label: user?.note ?? ""
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.resources.dimension.defaultMargin),
                        child: Row(
                          children: [
                            MyTextView(
                              label: context.resources.strings.labelPhone + ": "
                            ),
                            MyTextView(
                              label: user?.phone ?? ""
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  elevation: context.resources.dimension.highElevation,
                  margin: EdgeInsets.all(context.resources.dimension.smallMargin),
                  color: context.resources.color.colorWhite,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


}
