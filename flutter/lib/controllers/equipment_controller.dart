import 'package:get/get.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import '../models/equipment.dart'; 
 
class EquipmentController extends GetxController { 
  var equipmentList = <Equipment>[].obs; 
  // IP dari laravel dijalankan pada flutter run 
  // final String apiUrl = 'http://127.0.0.1:8000/api/equipment';  
  // final String apiUrl = 'http://mobile-2410020001.test/api/equipment';
    //koneksi hp asli
  // final String apiUrl = 'http://192.168.18.68/api/workout_schedules';
  
 
  // untuk  emulator android studio gunakan IP dibawah ini 
  final String apiUrl = 'http://10.0.2.2/api/equipment'; 
    // Header agar Nginx mengarahkan request ke virtual host Laravel
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Host': 'mobile-2410020001.test',
  };
 
   @override 
  void onInit() { 
    super.onInit(); 
    tangkapDataequipment(); // Memanggil fetch data saat controller 
  } 
 
  Future<void> tangkapDataequipment() async { 
    final response = await http.get(Uri.parse(apiUrl), headers: headers,);
 
    if (response.statusCode == 200) { 
      List<dynamic> data = json.decode(response.body); 
      equipmentList.value = data.map((item) => 
Equipment.fromJson(item)).toList(); 
    } else { 
       Exception('Gagal Ambil Data equipment'); 
    } 
  } 
 
  Future<void> addequipment(Equipment equipment) async { 
    final response = await http.post(Uri.parse(apiUrl), 
        headers: {"Content-Type": "application/json"}, 
        body: json.encode(equipment.toJson())); 
 
    if (response.statusCode == 201) { 
      equipmentList.add(Equipment.fromJson(json.decode(response.body))); 
    } else { 
      throw Exception('Gagal Simpan Data equipment'); 
    } 
  } 
 
  Future<void> updateequipment(int id, Equipment equipment) async { 
    final response = await http.put(Uri.parse('$apiUrl/$id'), 
        headers: {"Content-Type": "application/json"}, 
        body: json.encode(equipment.toJson())); 
 
    if (response.statusCode == 200) { 
      final index = equipmentList.indexWhere((m) => m.id == id); 
      if (index != -1) { 
        equipmentList[index] = Equipment.fromJson(json.decode(response.body)); 
      } 
    } else { 
      throw Exception('Gagal Ubah Data equipment'); 
    } 
  } 
 
  Future<void> deleteequipment(int id) async { 
    final response = await http.delete(Uri.parse('$apiUrl/$id')); 
 
    if (response.statusCode == 204) { 
      equipmentList.removeWhere((m) => m.id == id); 
    } else { 
      throw Exception('Gagal Hapus Data equipment'); 
    } 
  } 
}