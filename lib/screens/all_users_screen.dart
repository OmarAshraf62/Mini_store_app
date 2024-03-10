import 'dart:developer';

import 'package:fake_store_app/models/user_model.dart';
import 'package:fake_store_app/services/user_services.dart';
import 'package:fake_store_app/widgets/users_widget.dart';
import 'package:flutter/material.dart';

class AllUsersScreen extends StatelessWidget {
  const AllUsersScreen({super.key, required this.users});
  final List<UserModel> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<UserModel>>(
        future: UserService.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text("Error happened ${snapshot.error}");
          } else if (snapshot.hasError) {
            return const Text("No Data yet");
          } else {
            log("users ${snapshot.data}");
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => UsersWidget(
                user: snapshot.data![index],
              ),
            );
          }
        },
      ),
    );
  }
}
