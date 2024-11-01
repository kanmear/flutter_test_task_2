import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_test_task_2/shop/data/models/salad.dart';
import 'package:flutter_test_task_2/shop/state/salad_abstract.dart';

class SaladFilterState extends SaladState {
  final List<Salad> salads;
  final SaladFilter selectedFilter;

  SaladFilterState(this.salads, this.selectedFilter);
}

class FilterSalads extends SaladEvent {
  final SaladFilter filter;

  FilterSalads(this.filter);
}

class SaladFilterBloc extends Bloc<FilterSalads, SaladFilterState> {
  final List<Salad> salads;

  SaladFilterBloc(this.salads)
      : super(SaladFilterState(salads, SaladFilter.hottest)) {
    on<FilterSalads>((event, emit) {
      final filteredSalads = _getFilteredSalads(event.filter);
      emit(SaladFilterState(filteredSalads, event.filter));
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

enum SaladFilter {
  hottest(name: 'Hottest'),
  popular(name: 'Popular'),
  newCombo(name: 'New combo'),
  top(name: 'Top');

  final String name;

  const SaladFilter({required this.name});

  @override
  toString() => name;
}
