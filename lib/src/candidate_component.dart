import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
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

    final _candidateSelection = StreamController<Candidate>();
    @Output() Stream<Candidate> get candidateSelection => _candidateSelection.stream;

    void onSelectedCandidate(Candidate candidate) {
        _candidateSelection.add(candidate);
        print(candidate.name);
    }
}
