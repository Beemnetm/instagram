import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:instagram/post/presentation/components/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Homepage")),
        actions: [
          IconButton(
              onPressed: () {
                context.read<AuthCubit>().logout();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
