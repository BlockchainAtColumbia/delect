class Candidate{
  final int id;
  String name;
  String position;
  final int year;
  String political_party;

  Candidate(this.id, this.name, this.position, this.year, this.political_party);

  factory Candidate.fromJson(Map<String, dynamic> candidate) =>
      Candidate(_toInt(candidate['id']), candidate['name'],
      candidate['position'], _toInt(candidate['year']), candidate['political_party']);

   Map toJson() => {'id': id, 'name': name, 'position': position, 'year': year,
      'political_party': political_party};
}

int _toInt(i) => i is int ? i : int.parse(i);
