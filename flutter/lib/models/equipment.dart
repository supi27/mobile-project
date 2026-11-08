class Equipment { 
  final int? id; 
  final String name; 
  final String description; 
  final String? imagePath; 
 
  Equipment({ 
    this.id, 
    required this.name, 
    required this.description, 
    this.imagePath, 
  }); 
 
  factory Equipment.fromJson(Map<String, dynamic> json) { 
    return Equipment( 
      id: json['id'],  
      name: json['name'], 
      description: json['description'], 
      imagePath: json['image_path'], 
    ); 
  } 
 
  Map<String, dynamic> toJson() { 
    return { 
      'name': name,  
      'description': description, 
      'image_path': imagePath, 
    }; 
  } 
} 