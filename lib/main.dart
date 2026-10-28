import 'package:flutter/material.dart';
import 'injection.dart';
import 'mural_viewmodel.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MuralView(),
    );
  }
}

class MuralView extends StatefulWidget {
  const MuralView({super.key});

  @override
  State<MuralView> createState() => _MuralViewState();
}

class _MuralViewState extends State<MuralView> {
  final viewModel = getIt<MuralViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mural & Achados')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: viewModel.avisos.length,
            itemBuilder: (context, i) => ListTile(title: Text(viewModel.avisos[i])),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.adicionarAviso('Novo aviso adicionado'),
        child: const Icon(Icons.add),
      ),
    );
  }
}