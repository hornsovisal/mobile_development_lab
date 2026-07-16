import 'package:flutter/material.dart';

import '../data/repositories/scores_repository.dart';
import '../data/services/auth_service.dart';
import '../model/score.dart';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({super.key});

  @override
  State<ScoresScreen> createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  List<Score>? scores;
  String? error;

  @override
  void initState() {
    super.initState();

    fetchScores();
  }

  void fetchScores() async {
    // Ask the ScoresRepository instance to fetch the scores
    // if succes, update the scores list and refresh
    // If failure, update the error and refresh

    try {
      final session = AuthenticationService.instance.session;
      if (session != null) {
        final fetchedScores = await ScoresRepository.instance.getSCores(
          session.token!,
        );
        setState(() {
          scores = fetchedScores;
          error = null;
        });
      } else {
        setState(() {
          error = "User not found. Please log in again.";
        });
      }
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  String? get userName {
    final session = AuthenticationService.instance.session;
    if (session != null) {
      return session.user.name;
    }
    return null;
  }

  Widget get content {
    // If scores list => dispaly the list using the ScoreTile
    try {
      if (scores != null) {
        return ListView.builder(
          itemCount: scores!.length,
          itemBuilder: (context, index) {
            return ScoreTile(score: scores![index]);
          },
        );
      }
    } catch (e) {
      error = e.toString();
      return Center(
        child: Text(error!, style: TextStyle(color: Colors.red)),
      );
    }

    // if error, dispaly the erro in red, centered

    // otherwise, we disaply the  CircularProgressIndicator
    return CircularProgressIndicator();
  }

  String get welcomeLabel => "Welcome ${userName != null ? userName! : ""} !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(welcomeLabel)),
      body: Center(
        child: Padding(padding: const EdgeInsets.all(20.0), child: content),
      ),
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(score.title),
        leading: Text(score.value.toString()),
      ),
    );
  }
}
