import 'package:flutter/material.dart'; 
import 'package:get/get.dart'; 
import '../controllers/equipment_controller.dart'; 
 
class EquipmentViews extends StatelessWidget { 
   EquipmentViews({super.key}); 
  final EquipmentController controller = Get.put(EquipmentController()); 
 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(
                    title: Text("Data equipment"),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.list_alt),
                        tooltip: 'Workout Schedule',
                        onPressed: () {
                          Get.toNamed('/workout_schedules');
                        },
                      ),
                    ],
                  ),
      body: Column( 
        children: [ 
          Expanded( 
            child: Obx(() { 
              // Memastikan list equipment telah terisi 
              if (controller.equipmentList.isEmpty) { 
                return Center(child: Text("Tidak ada data equipment")); 
              } 
 
              return ListView.builder( 
                itemCount: controller.equipmentList.length, 
                itemBuilder: (context, index) { 
                  final equipment = controller.equipmentList[index]; 
                  return Card( 
                    margin: EdgeInsets.all(10), 
                    elevation: 5, 
                    child: Padding( 
                      padding: const EdgeInsets.all(15.0), 
                      child: Column( 
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [ 
                          Text( 
                            equipment.name, 
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
                                          text: "Deskripsi:\n",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: equipment.description,
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
                                          text: "Gambar:\n",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: equipment.imagePath,
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
controller.deleteequipment(equipment.id!); 
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