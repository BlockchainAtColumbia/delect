import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'src/candidate_component.dart';
import 'src/candidate_service.dart';
import 'src/candidate.dart';

@Component(
    selector: 'ballot',
    templateUrl: 'ballot_component.html',
    styleUrls: const ['ballot_component.css'],
    directives: [
      coreDirectives,
      CandidateComponent,
      MaterialIconComponent,
      MaterialButtonComponent,
    ],
    providers: [
      materialProviders,
      ClassProvider(CandidateService),
    ],
)
class BallotComponent implements OnInit {
    final CandidateService _candidateService;
    BallotComponent(this._candidateService);

    List<Candidate> candidates;
    String candidatePosition;

    List<Candidate> selection = [];

    void _getPresidents() {
      candidates = _candidateService.getPresidents();
      candidatePosition = "President";
    }

    void ngOnInit() => _getPresidents();
}
