import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:http/browser_client.dart';
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
    static bool isBallotComplete = false;

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
      else if (selection.last.position == "Treasurer") {
          isBallotComplete = true;
      }
    }

    void submit() async {
        var url = 'http://0.0.0.0:8081/sendBallot'; // Temporary Place Holder
        var client = new BrowserClient();
        var message =[];
        selection.forEach((candidate) {
             message.add(candidate.toJson());
        });

        var jsonText = jsonEncode(selection);
        var response = await client.post(url, body: jsonText);
        /* TODO:(majun23) Handle Exceptions */
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');

        // Record Submision and Route Application
        if (response.statusCode == 200) {
            print("Route to Thank you Page");
        }
        client.close();
    }

    void ngOnInit() => _getPresidents();
}
