part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState with EquatableMixin {
  final HomeStatus? homeOverviewStatus;
  final List<Character>? listOfCharacter;

  const HomeState({
    this.homeOverviewStatus = HomeStatus.initial,
    this.listOfCharacter = const [],
  });

  HomeState copyWith({
    HomeStatus? homeOverviewStatus,
    List<Character>? listOfCharacter,
  }) {
    return HomeState(
      homeOverviewStatus: homeOverviewStatus ?? this.homeOverviewStatus,
      listOfCharacter: listOfCharacter ?? this.listOfCharacter,
    );
  }

  @override
  List<Object> get props => [homeOverviewStatus!, listOfCharacter ?? []];
}
