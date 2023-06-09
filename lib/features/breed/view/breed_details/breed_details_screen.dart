import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_app/common/service_locator.dart';
import 'package:flutter_demo_app/features/breed/cubit/breed_details_cubit.dart';
import 'package:flutter_demo_app/features/breed/models/breed/breed.dart';

import 'breed_details_list.dart';
import 'breed_image_slider.dart';

class BreedDetailsScreen extends StatelessWidget {
  const BreedDetailsScreen({super.key, required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BreedDetailsCubit>(param1: breed),
      child: BreedDetailsView(breed),
    );
  }
}

class BreedDetailsView extends StatelessWidget {
  const BreedDetailsView(this.breed, {super.key});

  final Breed breed;

  @override
  Widget build(BuildContext context) => BlocBuilder<BreedDetailsCubit, BreedDetailsState>(
        builder: (context, state) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: context.read<BreedDetailsCubit>().onFavoritePressed,
            child: Icon(
              state.isFavorite ? Icons.star_rounded : Icons.star_outline_rounded,
              size: 32,
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 250.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.7,
                  centerTitle: true,
                  title: Text(breed.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                  background: Hero(
                    tag: 'breed_image_${breed.id}',
                    child: BreedImageSlider(
                      children: state.imageUrls
                          .map((url) => CachedNetworkImage(
                                imageUrl: url,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) =>
                                    const Center(child: Text('No image')),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 8, 8),
                sliver: BreedDetailsList(breed),
              ),
            ],
          ),
        ),
      );
}
