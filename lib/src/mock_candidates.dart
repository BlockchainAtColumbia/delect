import 'candidate.dart';

// Temporary Mocks before fetching from a web service
final mockCandidates = {
  "President" : [Candidate("Joe", "President", 2020, "Lion"),
    Candidate("Jan", "President", 2020, "Kings"),],
  "Vice President" : [Candidate("Nat", "Vice President", 2020, "Lion"),
    Candidate("Pat", "Vice President", 2021, "Kings"),
    Candidate("Alex", "Vice President", 2022, "Roar"),],
  "Treasurer" : [Candidate("Pearl", "Treasurer", 2020, "Lion"),
    Candidate("Mike", "Treasurer", 2020, "Kings"),
    Candidate("Lily", "Treasurer", 2021, "Roar"),
    Candidate("Joe", "Treasurer", 2021, "Blockchain"),
    Candidate("Poe", "Treasurer", 2022, "Columbia"),]
};
