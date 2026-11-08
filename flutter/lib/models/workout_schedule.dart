class WorkoutSchedule { 
  final int? id; 
  final String day; 
  final String category; 
  final String? description; 
 
  WorkoutSchedule({ 
    this.id, 
    required this.day, 
    required this.category, 
    this.description, 
  }); 
 
  factory WorkoutSchedule.fromJson(Map<String, dynamic> json) { 
    return WorkoutSchedule( 
      id: json['id'],  
      day: json['day'], 
      category: json['category'], 
      description: json['description'], 
    ); 
  } 
 
  Map<String, dynamic> toJson() { 
    return { 
      'day': day,  
      'category': category, 
      'description': description, 
    }; 
  } 
} 