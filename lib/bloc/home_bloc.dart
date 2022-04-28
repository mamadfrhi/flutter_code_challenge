import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_challenge/models/PersonView.dart';
import '../services/PersonsServices.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PersonsService _personsService;

  HomeBloc(this._personsService) : super(HomeLoadingState()) {
    on<GetPersonsEvent>((event, emit) async {
      emit(HomeLoadingState());
      final persons = await _personsService.getPersons();
      final personsView = _personsService.personsViews(persons);
      emit(HomeLoadedState(persons: personsView));
    });
  }
}
