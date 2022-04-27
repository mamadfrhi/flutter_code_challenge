import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../services/PersonsServices.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PersonsService _personsService;

  HomeBloc(this._personsService) : super(HomeLoadingState()) {
    on<GetPersonsEvent>((event, emit) async {
      final persons = await _personsService.getPersons();
      emit(HomeLoadedState(persons: persons!));
    });
  }
}
