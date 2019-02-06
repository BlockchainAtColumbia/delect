import 'candidate.dart';

// Temporary Mocks before fetching from a web service
final mockCandidates = {
  "President" : [Candidate(1, "Joe", "President", 2020, "Lion"),
    Candidate(2, "Jan", "President", 2020, "Kings"),],
  "Vice President" : [Candidate(3, "Nat", "Vice President", 2020, "Lion"),
    Candidate(4, "Pat", "Vice President", 2021, "Kings"),
    Candidate(5, "Alex", "Vice President", 2022, "Roar"),],
  "Treasurer" : [Candidate(6, "Pearl", "Treasurer", 2020, "Lion"),
    Candidate(7, "Mike", "Treasurer", 2020, "Kings"),
    Candidate(8, "Lily", "Treasurer", 2021, "Roar"),
    Candidate(9, "Joe", "Treasurer", 2021, "Blockchain"),
    Candidate(10, "Poe", "Treasurer", 2022, "Columbia"),]
};
