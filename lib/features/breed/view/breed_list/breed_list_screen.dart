import 'package:breed_repository/breed_repository.dart' show BreedRepository;
import 'package:flutter/material.dart';
import 'package:flutter_demo_app/common/ext/context_ext.dart';
import 'package:flutter_demo_app/features/breed/cubit/breed_list_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'breed_list_item.dart';

part 'breed_list_components.dart';

class BreedListScreen extends StatelessWidget {
  const BreedListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BreedListCubit(context.read<BreedRepository>()),
      child: const BreedListView(),
    );
  }
}

class BreedListView extends StatelessWidget {
  const BreedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Good Boys Catalogue')),
      body: BlocConsumer<BreedListCubit, BreedListState>(
        builder: (context, state) {
          switch (state.status) {
            case BreedListStatus.initial:
              return const BreedListEmpty();
            default:
              return const BreedListPopulated();
          }
        },
        listener: (context, state) {
          if (state.status == BreedListStatus.failure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(context.l10n.commonError)));
          }
        },
      ),
    );
  }
}
