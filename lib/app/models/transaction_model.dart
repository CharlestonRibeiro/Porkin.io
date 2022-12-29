class TransactionModel {
  final String? id ;
  final String title;
  final double ammount;
  final DateTime date;
  final bool category;

  TransactionModel({
    this.id,
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
  });

  TransactionModel copyWith({
    String? id,
    String? title,
    double? ammount,
    DateTime? date,
    bool? category,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      ammount: ammount ?? this.ammount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'ammount': ammount,
      'date': date,
      'category': category,
    };
  }
}
