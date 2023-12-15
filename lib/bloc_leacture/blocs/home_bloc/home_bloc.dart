import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

int number = 0;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<AddToNumberEvent>((event, emit) {
      number = number++;
      return UpdateNumber(value: number);
    });
  }
}
