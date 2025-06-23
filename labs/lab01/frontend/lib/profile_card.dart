import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final int age;
  final String? avatarUrl;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.email,
    required this.age,
    this.avatarUrl,
  }) : super(key: key);

  Widget _buildAvatar() {
    if (avatarUrl != null && avatarUrl != "") {
      return CircleAvatar (
        radius : 50,
        backgroundImage: NetworkImage(avatarUrl!),
      );
    } else {
      return CircleAvatar(
        radius : 50,
        child : Text(
          name.substring(0, 1),
          style : const TextStyle(
            color : Colors.white,
            fontSize : 30,
            )
          ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      width : 400,
      height : 300,
      padding : const EdgeInsets.all(16),
      margin : const EdgeInsets.symmetric(vertical : 8),
      decoration : const BoxDecoration (
        color : Colors.lightBlueAccent,
      ),
      child : Column (
        children : [
          _buildAvatar(),
          Text (
           name,
            style : const TextStyle(
              color : Colors.white,
              fontSize : 24
            ),
          ),
          Text (
           'Age: $age',
            style : const TextStyle(
              color : Colors.white,
              fontSize : 24
            ),
          ),
          Text (
            email,
            style : const TextStyle(
              color : Colors.white,
              fontSize : 24
            )
          )
        ]
      )
    );
  }
}
