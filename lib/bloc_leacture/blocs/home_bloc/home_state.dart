// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class UpdateNumber extends HomeState {
  late int value;
  UpdateNumber({
    required this.value,
  });
}
