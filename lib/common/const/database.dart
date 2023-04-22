import 'package:medical_health_care/domain/model/chat_data.dart';
import 'package:medical_health_care/domain/model/doctor_data.dart';
import 'package:medical_health_care/domain/model/recent_chat_data.dart';
import 'package:medical_health_care/domain/model/schedule_data.dart';
import 'package:medical_health_care/presentation/screen/schedule/component/schedule_segment.dart';

const kDatabaseVersion = 14;
const kDatabaseName = 'medical.db';

const kTableDoctor = 'doctor_table';
const kTableSchedule = 'schedule_table';

final kDoctors = [
  DoctorData(
    name: 'Dr. Doctor Name',
    major: 'Therapist',
    rate: 4.9,
    image: 'assets/images/doctor1.jpg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  DoctorData(
    name: 'Dr. Doctor Name',
    major: 'Therapist',
    rate: 4.9,
    image: 'assets/images/doctor2.jpg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  DoctorData(
    name: 'Dr. Doctor Name',
    major: 'Therapist',
    rate: 4.9,
    image: 'assets/images/doctor3.jpg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  DoctorData(
    name: 'Dr. Doctor Name',
    major: 'Therapist',
    rate: 4.9,
    image: 'assets/images/doctor4.jpg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  DoctorData(
    name: 'Dr. Doctor Name',
    major: 'Therapist',
    rate: 4.9,
    image: 'assets/images/doctor1.jpg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  DoctorData(
    name: 'Dr. Doctor Name',
    major: 'Therapist',
    rate: 4.9,
    image: 'assets/images/doctor2.jpg',
    description:
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
];

final kSchedules = [
  ScheduleData(name: 'Dr. Doctor Name', major: 'Therapist', image: 'assets/images/doctor1.jpg', state: ScheduleType.upcoming),
  ScheduleData(name: 'Dr. Doctor Name', major: 'Therapist', image: 'assets/images/doctor1.jpg', state: ScheduleType.upcoming),
  ScheduleData(name: 'Dr. Doctor Name', major: 'Therapist', image: 'assets/images/doctor1.jpg', state: ScheduleType.canceled),
  ScheduleData(name: 'Dr. Doctor Name', major: 'Therapist', image: 'assets/images/doctor1.jpg', state: ScheduleType.completed),
];

final kRecentChatData = [
  RecentChatData(name: 'Dr. Doctor Name', image: 'assets/images/doctor1.jpg', lastMessage: 'Hello, Doctor are your there?'),
  RecentChatData(name: 'Dr. Doctor Name', image: 'assets/images/doctor2.jpg', lastMessage: 'Hello, Doctor are your there?'),
  RecentChatData(name: 'Dr. Doctor Name', image: 'assets/images/doctor3.jpg', lastMessage: 'Hello, Doctor are your there?'),
  RecentChatData(name: 'Dr. Doctor Name', image: 'assets/images/doctor4.jpg', lastMessage: 'Hello, Doctor are your there?'),
];

final kChats = [
  ChatData(type: ChatDataType.send, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ChatData(type: ChatDataType.receive, message: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'),
  ChatData(type: ChatDataType.send, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ChatData(type: ChatDataType.receive, message: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'),
  ChatData(type: ChatDataType.send, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ChatData(type: ChatDataType.receive, message: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'),
  ChatData(type: ChatDataType.send, message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
  ChatData(type: ChatDataType.receive, message: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat'),
];