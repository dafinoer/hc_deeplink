import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hc_deeplink/bloc/top_stories/top_stories_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TopStoriesCubit _topStoriesCubit;

  @override
  void initState() {
    super.initState();
    _topStoriesCubit = TopStoriesCubit.create();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: BlocBuilder(
        bloc: _topStoriesCubit,
        builder: (context, state) {
          switch (state.runtimeType) {
            case TopStoriesLoading:
              return const Center(child: CircularProgressIndicator());
            case TopStoriesSuccess:
              final stateItem = state as TopStoriesSuccess;
              return ListView.builder(
                itemCount: stateItem.itemNews.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(stateItem.itemNews[index].title),
                  subtitle: Text(stateItem.itemNews[index].type),
                ),
              );
            case TopStoriesError:
              return Center(child: Text('oops'));
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _topStoriesCubit.close();
    super.dispose();
  }
}
