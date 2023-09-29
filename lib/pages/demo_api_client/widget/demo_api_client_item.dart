import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mr_white/pages/demo_api_client/model/get_users_response.dart';

class DemoApiClientItem extends StatelessWidget {
  const DemoApiClientItem({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    final title = '${userData.firstName ?? ''} ${userData.lastName ?? ''}';
    final subTitle = userData.email ?? '';
    final avatarUrl = userData.avatar ?? '';

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
        maxRadius: 32.w,
      ),
      title: Text(title),
      subtitle: Text(subTitle),
      contentPadding: EdgeInsets.all(8.w),
    );
  }
}
