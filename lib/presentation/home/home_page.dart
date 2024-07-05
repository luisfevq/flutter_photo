import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:omniprotest/domain/entities/photo_entity.dart';
import 'package:omniprotest/presentation/home/bloc/home_bloc.dart';
import 'package:omniprotest/presentation/widgets/item_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: Modular.get<HomeBloc>()
        ..add(
          const GetPhotoApi(page: 1),
        ),
      child: const _Listener(),
    );
  }
}

class _Listener extends StatefulWidget {
  const _Listener();

  @override
  State<_Listener> createState() => _ListenerState();
}

class _ListenerState extends State<_Listener> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Modular.get<HomeBloc>().add(LoadMorePhotos());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is PhotoFailure) {
            // OmniProDialog.customDialog(
            //   context: context,
            //   title: "Error",
            //   message: state.message,
            // );
          }
        },
        child: Column(
          children: [
            SafeArea(
              child: Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Hi 👋🏼 Onmi Pro',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          'Welcome back',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.purple[50],
                      radius: 26,
                    ),
                  ],
                ),
              ),
            ),
            _Body(
              controller: _scrollController,
            ),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ScrollController? controller;

  const _Body({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          current is PhotoLoaded ||
          current is PhotoFailure ||
          current is PhotoMoreFailure,
      builder: (context, state) {
        if (state is PhotoLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PhotoLoaded) {
          return Expanded(
            child: ListView.builder(
              controller: controller,
              itemCount: state.photos.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.photos.length) {
                  return const Column(
                    children: [
                      SizedBox(height: 16),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                }
                PhotoEntity photo = state.photos[index];
                return ItemListWidget(
                  id: photo.id!,
                  title: photo.title!,
                  url: photo.url!,
                );
              },
            ),
          );
        } else if (state is PhotoFailure) {
          return Center(
            child: Text(
              state.message,
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
