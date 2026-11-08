import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/equipment_views.dart';
import 'views/workout_schedule_views.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Gym',

      initialRoute: '/equipment',

      getPages: [
        GetPage(
          name: '/equipment',
          page: () => EquipmentViews(),
        ),

        GetPage(
          name: '/workout_schedules',
          page: () => WorkoutScheduleViews(),
        ),
      ],
    );
  }
}