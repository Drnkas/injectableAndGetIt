import 'package:flutter/material.dart';
import 'package:geti_injectable/managers/session_manager.dart';

import '../injection/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SessionManager sessionManager = getIt();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Seja bem-viado, ${sessionManager.user?.name ?? 'Não logado'}!'),
      ),
    );
  }
}
