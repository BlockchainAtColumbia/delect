import 'candidate.dart';
import 'mock_candidates.dart';

class CandidateService {

    // TODO(majun23) Change this to ASYNC when we query from a server
    List<Candidate> getPresidents() {
        List<Candidate> presidents = [];
        for (Candidate candidate in mockCandidates) {
            if (candidate.position == "President")
                presidents.add(candidate);
        }
        return presidents;
      }
}
