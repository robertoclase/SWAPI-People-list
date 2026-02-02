import 'package:swapi_people_list/core/services/people_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:swapi_people_list/features/people_list/bloc/people_list_bloc.dart';

class PeoplePageView extends StatefulWidget {
  const PeoplePageView({super.key});

  @override
  State<PeoplePageView> createState() => _PeoplePageViewState();
}

class _PeoplePageViewState extends State<PeoplePageView> {
  late PeopleListBloc peopleListBloc;

  @override
  void initState() {
    super.initState();
    peopleListBloc = PeopleListBloc(PeopleService())
      ..add(PeopleListFetchAllEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars Characters'),
        
      ),
      body: BlocBuilder<PeopleListBloc, PeopleListState>(
        bloc: peopleListBloc,
        builder: (context, state) {
          if (state is PeopleListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PeopleListSuccess) {
            return ListView.builder(
              itemCount: state.peopleList.length,
              itemBuilder: (context, index) {
                final person = state.peopleList[index];
                return ListTile(
                  title: Text(person.name),
                  subtitle: Text('${person.gender} - ${person.birthYear}'),
                );
              },
            );
          } else if (state is PeopleListError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
