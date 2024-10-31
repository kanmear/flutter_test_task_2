import 'package:rxdart/transformers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/data/models/salad.dart';
import 'package:flutter_test_task_2/shop/state/salad_abstract.dart';

class SaladSearchState extends SaladState {
  final List<Salad> saladList;
  final String title;
  final String searchText;

  SaladSearchState({
    required this.saladList,
    this.title = 'Recommended Combo',
    this.searchText = '',
  });

  SaladSearchState copyWith({
    List<Salad>? saladList,
    String? title,
    String? searchText,
  }) {
    return SaladSearchState(
      saladList: saladList ?? this.saladList,
      title: title ?? this.title,
      searchText: searchText ?? this.searchText,
    );
  }
}

class LoadInitialSalads extends SaladEvent {}

class SearchSalads extends SaladEvent {
  final String query;
  SearchSalads(this.query);
}

class SaladSearchBloc extends Bloc<SaladEvent, SaladSearchState> {
  final List<Salad> allSalads;

  SaladSearchBloc(this.allSalads)
      : super(SaladSearchState(saladList: allSalads.take(3).toList())) {
    on<LoadInitialSalads>((event, emit) {
      emit(SaladSearchState(
        saladList: allSalads.take(3).toList(),
        title: 'Recommended Combo',
      ));
    });

    on<SearchSalads>(
      (event, emit) {
        if (event.query.isEmpty) {
          emit(SaladSearchState(
            saladList: allSalads.take(3).toList(),
            title: 'Recommended Combo',
          ));
        } else {
          final filteredSalads = allSalads
              .where((salad) =>
                  salad.name.toLowerCase().contains(event.query.toLowerCase()))
              .toList();

          emit(SaladSearchState(
            saladList: filteredSalads,
            title: 'Search results',
            searchText: event.query,
          ));
        }
      },
      transformer: debounce(const Duration(milliseconds: 400)),
    );
  }

  EventTransformer<E> debounce<E>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
  }
}
