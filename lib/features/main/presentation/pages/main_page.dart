import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shivapardaz_test/features/main/presentation/bloc/photo_event.dart';
import 'package:shivapardaz_test/features/main/presentation/widgets/custom_card.dart';

import '../../../../core/utils/show_snackbar.dart';
import '../bloc/photo_state.dart';
import '../bloc/photo_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PhotoBloc>().add(PhotoFetchAllPhotos());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  void _getMoreData() {
    context.read<PhotoBloc>().add(PhotoFetchMorePhotos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PhotoBloc, PhotoState>(
        listener: (context, state) {
          if (state is PhotoFailure) {
            showSnackBar(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is PhotoLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PhotosDisplaySuccess) {
            return ListView.builder(
              controller: _scrollController,
              itemExtent: 80,
              itemCount: state.photos.length + 1,
              itemBuilder: (context, index) {
                if (index == state.photos.length) {
                  return const Center(child: CircularProgressIndicator());
                }
                return CustomCard(photo: state.photos[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
