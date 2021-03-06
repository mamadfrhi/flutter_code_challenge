import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_challenge/models/person_view.dart';
import '../services/person_service.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PersonsService _personsService;

  HomeBloc(this._personsService) : super(HomeLoadingState()) {
    on<FetchPersonsEvent>((event, emit) async {
      emit(HomeLoadingState());
      final persons = await _personsService.fetchNextPagePersons();
      final personsView = _personsService.personsViewsFromPersons(persons);
      emit(HomeLoadedState(persons: personsView));
    });
  }
}
