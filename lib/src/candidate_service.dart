import 'candidate.dart';
import 'mock_candidates.dart';

class CandidateService {

    // TODO(majun23) Change this to ASYNC when we query from a server
    List<Candidate> getPresidents() => mockCandidates["President"];
    List<Candidate> getVicePresidents() => mockCandidates["Vice President"];
    List<Candidate> getTreasures() => mockCandidates["Treasurer"];
}
