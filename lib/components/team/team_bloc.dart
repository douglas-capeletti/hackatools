import 'package:hackatools/components/team/team_api.dart';
import 'package:hackatools/models/team.dart';
import 'package:hackatools/models/user.dart';
import 'package:hackatools/utils/response.dart';
import 'package:hackatools/utils/simple_bloc.dart';

class TeamBloc extends SimpleBloc {
  fetch() async {
    try {
      List<Team> times = await TeamApi.getTimes();
      add(times);
      return times;
    } catch (err, stacktrace) {
      print("Team fetch error: $err - $stacktrace");
      addError(err);
    }
  }

  createTeam(String name) async {
    return User.get().then(
      (user) {
        Team time = Team(
          name: name,
          adminName: user.email,
          members: List.filled(
            1,
            TeamMember(
              name: user.name,
              course: user.course,
              username: user.email,
            ),
          ),
        );
        add(GenericResponse(true, result: List.filled(1, time)));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


}
