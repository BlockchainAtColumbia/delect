import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
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
      MaterialButtonComponent,
      MaterialIconComponent,
    ],
    providers: [
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

    void _getVicePresidents() {
      candidates = _candidateService.getVicePresidents();
      candidatePosition = "Vice President";
    }

    void _getTreasures() {
      candidates = _candidateService.getTreasures();
      candidatePosition = "Treasurer";
    }

    void addSelectedCandidate(var candidate) {
      selection.add(candidate);
      if (selection.last.position == "President") {
          _getVicePresidents();
      }
      else if (selection.last.position == "Vice President") {
          _getTreasures();
      }
    }

    void ngOnInit() => _getPresidents();
}
