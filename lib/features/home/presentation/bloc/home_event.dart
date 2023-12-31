part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeChatViewEvent extends HomeEvent {}

class HomeContactsViewEvent extends HomeEvent {}

class HomeProfileViewEvent extends HomeEvent {}
