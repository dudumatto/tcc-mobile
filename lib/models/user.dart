class User {
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.course,
    this.avatarUrl,
    this.roles = const <String>[],
  });

  final String id;
  final String name;
  final String email;
  final String? course;
  final String? avatarUrl;
  final List<String> roles;

  factory User.fromJwtPayload(Map<String, dynamic> payload) {
    return User(
      id: '${payload['sub'] ?? payload['id'] ?? ''}',
      name: '${payload['name'] ?? payload['fullName'] ?? ''}',
      email: '${payload['email'] ?? ''}',
      course: payload['course'] as String?,
      avatarUrl: payload['avatarUrl'] as String?,
      roles: (payload['roles'] as List?)?.map((e) => '$e').toList() ?? const <String>[],
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: '${json['id'] ?? ''}',
      name: '${json['name'] ?? ''}',
      email: '${json['email'] ?? ''}',
      course: json['course'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      roles: (json['roles'] as List?)?.map((e) => '$e').toList() ?? const <String>[],
    );
  }
}

