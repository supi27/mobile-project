import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
import '../controllers/workout_schedule_controller.dart'; 
 
class WorkoutScheduleViews extends StatelessWidget { 
      WorkoutScheduleViews({super.key}); 
  final WorkoutScheduleController controller = Get.put(WorkoutScheduleController()); 
 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Jadwal Latihan"), 
      ), 
      body: Column( 
        children: [ 
          Expanded( 
            child: Obx(() { 
              // Memastikan list equipment telah terisi 
              if (controller.scheduleList.isEmpty) { 
                return Center(child: Text("Tidak ada data Jadwal")); 
              } 
 
              return ListView.builder( 
                itemCount: controller.scheduleList.length, 
                itemBuilder: (context, index) { 
                  final equipment = controller.scheduleList[index]; 
                  return Card( 
                    margin: EdgeInsets.all(10), 
                    elevation: 5, 
                    child: Padding( 
                      padding: const EdgeInsets.all(15.0), 
                      child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [ 
                          Text( 
                            equipment.day, 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), 
                          ), 
                          SizedBox(height: 5), 
                          // Text("nama: ${equipment.name}"), 
                          RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Kategori:\n",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: equipment.category,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                          RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: "Deskripsi:\n",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: equipment.description,
                                        ),
                                      ],
                                    ),
                                  ), 
                          SizedBox(height: 10), 
                          OverflowBar( 
                            alignment: MainAxisAlignment.end, 
                            children: <Widget>[ 
                              TextButton( 
                                child: Text('Hapus'), 
                                onPressed: () { 
controller.deleteworkoutschedule(equipment.id!); 
}, 
), 
], 
), 
], 
), 
), 
); 
}, 
); 
}), 
), 
], 
), 
); 
} 
}