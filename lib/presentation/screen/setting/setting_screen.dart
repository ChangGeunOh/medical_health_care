import 'package:flutter/material.dart';
import 'package:medical_health_care/domain/bloc/bloc_event.dart';
import 'package:medical_health_care/presentation/component/custom_sliver_app_bar.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/screen/setting/bloc/setting_bloc.dart';
import 'package:medical_health_care/presentation/screen/setting/bloc/setting_event.dart';
import 'package:medical_health_care/presentation/screen/setting/bloc/setting_state.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        create: (context) => SettingBloc(context, SettingState()),
        builder: (context, bloc, state) {
          return CustomScrollView(
            slivers: [
              const CustomSliverAppBar(title: 'Settings'),
              renderProfile(
                name: 'Dr. Doctor Name',
                profile: 'Profile',
                image: 'assets/images/doctor1.jpg',
              ),
              const SliverToBoxAdapter(child: Divider(height: 40)),
              renderMenu(
                iconData: Icons.person_outline,
                iconColor: Colors.blue,
                backgroundColor: Colors.blue.shade100,
                title: 'Profile',
                onClick: () {},
              ),
              renderMenu(
                iconData: Icons.notifications_none_outlined,
                iconColor: Colors.indigo,
                backgroundColor: Colors.indigo.shade100,
                title: 'Notification',
                onClick: () {},
              ),
              renderMenu(
                iconData: Icons.privacy_tip_outlined,
                iconColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                title: 'Privacy',
                onClick: () {},
              ),
              renderMenu(
                iconData: Icons.settings_suggest_outlined,
                iconColor: Colors.green,
                backgroundColor: Colors.green.shade100,
                title: 'General',
                onClick: () {},
              ),
              renderMenu(
                iconData: Icons.info_outline,
                iconColor: Colors.orange,
                backgroundColor: Colors.orange.shade100,
                title: 'About Us',
                onClick: () => bloc.add(BlocEvent<SettingEventType>(SettingEventType.aboutUs)),
              ),
              const SliverToBoxAdapter(child: Divider(height: 40,)),
              renderMenu(
                iconData: Icons.logout_outlined,
                iconColor: Colors.redAccent,
                backgroundColor: Colors.redAccent.shade100,
                title: 'Log Out',
                onClick: () {},
              ),
            ],
          );
        });
  }

  Widget renderProfile({
    required String name,
    required String profile,
    required String image,
  }) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 30,
          ),
          title: Text(
            name,
            style: const TextStyle(
              letterSpacing: -0.7,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          subtitle: Text(profile),
        ),
      ),
    );
  }

  // blue.shadow100

  Widget renderMenu({
    required IconData iconData,
    required Color backgroundColor,
    required Color iconColor,
    required String title,
    required VoidCallback onClick,
  }) {
    return SliverToBoxAdapter(
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: backgroundColor,
              radius: 30,
              child: Icon(
                iconData,
                color: iconColor,
                size: 35,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ),
      ),
    );
  }
}
