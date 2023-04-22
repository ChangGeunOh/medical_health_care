import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_health_care/common/const/color.dart';
import 'package:medical_health_care/data/repository/repository.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/presentation/component/book_bottom.dart';
import 'package:medical_health_care/presentation/component/default_layout.dart';
import 'package:medical_health_care/presentation/screen/book/bloc/book_bloc.dart';
import 'package:medical_health_care/presentation/screen/book/bloc/book_event.dart';
import 'package:medical_health_care/presentation/screen/book/component/about_doctor.dart';
import 'package:medical_health_care/presentation/screen/book/component/doctor_data_info.dart';
import 'package:medical_health_care/presentation/screen/book/component/location_card.dart';
import 'package:medical_health_care/presentation/screen/book/component/review_card.dart';
import 'package:medical_health_care/presentation/screen/book/component/review_title.dart';

class BookScreen extends StatelessWidget {
  static String get routePath => '/book';

  static String get routeName => 'book';

  final DoctorData doctorData;

  const BookScreen({
    Key? key,
    required this.doctorData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: primaryColor,
      create: (context) => BookBloc(context.read<Repository>()),
      builder: (context, bloc, state) {
        return Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Stack(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          actions: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.more_vert,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SafeArea(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 0, top: 24),
                            child: DoctorDataInfo(
                              doctorData: doctorData,
                              onCall: () {
                                bloc.add(BookEvent(BookEventType.phone));
                              },
                              onMessage: () {
                                bloc.add(BookEvent(BookEventType.message));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: Column(
                              children: [
                                AboutDoctor(about: doctorData.description),
                                SizedBox(height: 8.h),
                                ReviewsTitle(doctorData: doctorData),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 120,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                ReviewCard(doctorData: doctorData),
                                ReviewCard(doctorData: doctorData),
                                ReviewCard(doctorData: doctorData),
                                ReviewCard(doctorData: doctorData),
                              ],
                            ),
                          ),
                          const LocationCard(),
                          SizedBox(height: 32.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BookBottom(
              price: 100,
              onClick: () {
                bloc.add(BookEvent(BookEventType.book, extra: doctorData));
              },
            ),
          ],
        );
      },
    );
  }
}


