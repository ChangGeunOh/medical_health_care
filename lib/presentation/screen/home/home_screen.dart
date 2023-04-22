import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/component/popular_card.dart';
import 'package:medical_health_care/presentation/component/symptoms_card.dart';
import 'package:medical_health_care/presentation/component/visit_card.dart';
import 'package:medical_health_care/presentation/screen/home/bloc/home_bloc.dart';
import 'package:medical_health_care/presentation/screen/home/bloc/home_event.dart';
import 'package:medical_health_care/presentation/screen/home/bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout<HomeBloc, HomeState>(create: (context) {
      return HomeBloc(context);
    }, builder: (context, bloc, state) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Hello Alex',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1,
                      ),
                    ),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/doctor1.jpg'),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  VisitCard(
                    title: 'Clinic Visit',
                    description: 'Make an appointment',
                    iconData: Icons.add,
                    onClick: () {},
                    isAddVisit: true,
                  ),
                  VisitCard(
                    title: 'Home Visit',
                    description: 'Call the doctor home',
                    iconData: Icons.home,
                    onClick: () {},
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              buildSubTitle('What are your symptoms?'),
              SizedBox(height: 4.h),
              SizedBox(
                height: 50,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: state.symptoms
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: SymptomsCard(
                            title: e,
                            onClick: () {},
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 16.h),
              buildSubTitle('Popular Doctors'),
              // SizedBox(height: 8.h),
              PopularDoctors(
                doctors: state.popularDoctors,
                onClick: (doctorData) {
                  bloc.add(HomeEvent(HomeEventType.book, extra: doctorData));
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildSubTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.8,
        ),
      ),
    );
  }
}

class PopularDoctors extends StatelessWidget {
  final List<DoctorData> doctors;
  final ValueChanged<DoctorData> onClick;

  const PopularDoctors({
    Key? key,
    required this.doctors,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(doctors.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 16.w,
          crossAxisSpacing: 16.w,
        ),
        children: doctors
            .map(
              (e) => InkWell(
                onTap: () => onClick(e),
                child: PopularCard(
                  name: e.name,
                  major: e.major,
                  image: e.image,
                  rate: e.rate,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
