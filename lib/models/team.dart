class Team {
  String name;
  String adminName;
  List<TeamMember> members;

  Team({
    this.name,
    this.adminName,
    this.members,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Team &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          adminName == other.adminName &&
          members == other.members);

  @override
  int get hashCode => name.hashCode ^ adminName.hashCode ^ members.hashCode;

  @override
  String toString() {
    return 'Team{' +
        ' name: $name,' +
        ' adminName: $adminName,' +
        ' members: $members,' +
        '}';
  }

  Team copyWith({
    String name,
    String adminName,
    List<TeamMember> members,
  }) {
    return new Team(
      name: name ?? this.name,
      adminName: adminName ?? this.adminName,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'adminName': this.adminName,
      'members': this.members,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return new Team(
      name: map['name'] as String,
      adminName: map['adminName'] as String,
      members: TeamMember.fromList(map['members'] as List<dynamic>),
    );
  }
}

class TeamMember {
  String name;
  String course;
  String username;

  TeamMember({
    this.name,
    this.course,
    this.username,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TeamMember &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          course == other.course &&
          username == other.username);

  @override
  int get hashCode => name.hashCode ^ course.hashCode ^ username.hashCode;

  @override
  String toString() {
    return 'TeamMember{' +
        ' name: $name,' +
        ' course: $course,' +
        ' username: $username,' +
        '}';
  }

  TeamMember copyWith({
    String name,
    String course,
    String username,
  }) {
    return new TeamMember(
      name: name ?? this.name,
      course: course ?? this.course,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'course': this.course,
      'username': this.username,
    };
  }

  factory TeamMember.fromMap(Map<String, dynamic> map) {
    return new TeamMember(
      name: map['name'] as String,
      course: map['course'] as String,
      username: map['username'] as String,
    );
  }

  factory TeamMember.fromStringMap(List<dynamic> member){
    return new TeamMember(
      name: member[0],
      course: member[1],
      username: member[2],
    );
  }

  static List<TeamMember> fromList(List<dynamic> members){
    return members.map((m) => TeamMember.fromStringMap(m)).toList();
  }

}