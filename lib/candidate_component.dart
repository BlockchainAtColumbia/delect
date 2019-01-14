import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'src/candidate.dart';
import 'src/mock_candidates.dart';

@Component(
    selector: 'candidate',
    templateUrl: 'candidate_component.html',
    styleUrls: ['candidate_component.css'],
    directives: [
      coreDirectives,
      MaterialIconComponent,
      MaterialButtonComponent,
    ],
    providers: [
      materialProviders,
    ],
)
class CandidateComponent {
  List<Candidate> candidates = mockCandidates;


  void onSelectedCandidate(Candidate candidate){
    print(candidate.name);
  }
}
