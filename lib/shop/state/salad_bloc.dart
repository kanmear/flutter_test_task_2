import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/data/models/salad.dart';

abstract class SaladEvent {}

class FilterSalads extends SaladEvent {
  final SaladFilter filter;

  FilterSalads(this.filter);
}

abstract class SaladState {}

class SaladListState extends SaladState {
  final List<Salad> salads;
  final SaladFilter selectedFilter;

  SaladListState(this.salads, this.selectedFilter);
}

enum SaladFilter { hottest, popular, newCombo, top }

class SaladBloc extends Bloc<SaladEvent, SaladState> {
  final List<Salad> salads;

  SaladBloc(this.salads) : super(SaladListState(salads, SaladFilter.hottest)) {
    on<FilterSalads>((event, emit) {
      final filteredSalads = _getFilteredSalads(event.filter);
      emit(SaladListState(filteredSalads, event.filter));
    });

    add(FilterSalads(SaladFilter.hottest));
  }

  List<Salad> _getFilteredSalads(SaladFilter filter) {
    final now = DateTime.now();
    switch (filter) {
      case SaladFilter.hottest:
        return salads
            .where((salad) => salad.lastOrdered
                .isAfter(now.subtract(const Duration(days: 3))))
            .toList()
          ..sort((a, b) => b.ordersCount.compareTo(a.ordersCount));
      case SaladFilter.popular:
        final result = salads;
        result.sort((a, b) => b.ordersCount.compareTo(a.ordersCount));
        return result.take(5).toList();
      case SaladFilter.newCombo:
        final result = salads;
        result.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
        return result.take(3).toList();
      case SaladFilter.top:
        final result = salads;
        result.sort((a, b) => b.rating.compareTo(a.rating));
        return result.take(3).toList();
    }
  }
}
