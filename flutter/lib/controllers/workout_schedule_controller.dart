import 'package:get/get.dart'; 
import 'package:http/http.dart' as http; 
import 'dart:convert'; 
import '../models/workoutSchedule.dart'; 
 
class WorkoutScheduleController extends GetxController { 
  var scheduleList = <WorkoutSchedule>[].obs; 
  // IP dari laravel dijalankan pada flutter run 
  // final String apiUrl = 'http://127.0.0.1:8000/api/workoutschedule';  
  // final String apiUrl = 'http://mobile-2410020001.test/api/workout_schedules';
  //koneksi hp asli
  // final String apiUrl = 'http://192.168.18.68/api/workout_schedules';
  
  
 
  // untuk  emulator android studio gunakan IP dibawah ini 
  final String apiUrl = 'http://10.0.2.2/api/workout_schedules'; 
    // Header agar Nginx mengarahkan request ke virtual host Laravel
  final Map<String, String> headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Host': 'mobile-2410020001.test',
  };
 
   @override 
  void onInit() { 
    super.onInit(); 
    tangkapDataworkoutschedule(); // Memanggil fetch data saat controller 
  } 
 
  Future<void> tangkapDataworkoutschedule() async { 
    final response = await http.get(Uri.parse(apiUrl), headers: headers,);
    // final response = await http.get(Uri.parse(apiUrl)); 
 
    if (response.statusCode == 200) { 
      List<dynamic> data = json.decode(response.body); 
      scheduleList.value = data.map((item) => 
WorkoutSchedule.fromJson(item)).toList(); 
    } else { 
       Exception('Gagal Ambil Data Jadwal'); 
    } 
  } 
 
  Future<void> addworkoutschedule(WorkoutSchedule workoutschedule) async { 
    final response = await http.post(Uri.parse(apiUrl), 
        headers: {"Content-Type": "application/json"}, 
        body: json.encode(workoutschedule.toJson())); 
 
    if (response.statusCode == 201) { 
      scheduleList.add(WorkoutSchedule.fromJson(json.decode(response.body))); 
    } else { 
      throw Exception('Gagal Simpan Data Jadwal'); 
    } 
  } 
 
  Future<void> updateworkoutschedule(int id, WorkoutSchedule workoutschedule) async { 
    final response = await http.put(Uri.parse('$apiUrl/$id'), 
        headers: {"Content-Type": "application/json"}, 
        body: json.encode(workoutschedule.toJson())); 
 
    if (response.statusCode == 200) { 
      final index = scheduleList.indexWhere((m) => m.id == id); 
      if (index != -1) { 
        scheduleList[index] = WorkoutSchedule.fromJson(json.decode(response.body)); 
      } 
    } else { 
      throw Exception('Gagal Ubah Data Jadwal'); 
    } 
  } 
 
  Future<void> deleteworkoutschedule(int id) async { 
    final response = await http.delete(Uri.parse('$apiUrl/$id')); 
 
    if (response.statusCode == 204) { 
      scheduleList.removeWhere((m) => m.id == id); 
    } else { 
      throw Exception('Gagal Hapus Data Jadwal'); 
    } 
  } 
}