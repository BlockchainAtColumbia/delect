import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'candidate.dart';

@Component(
  selector: 'candidate',
  templateUrl: 'candidate_component.html',
  styleUrls: const [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'candidate_component.css'
  ],
  directives: [
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
  ],
)
class CandidateComponent {
    @Input()
    Candidate candidate;

    void onSelectedCandidate(Candidate candidate){
      print(candidate.name);
    }
}
