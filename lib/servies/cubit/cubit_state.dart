abstract class NewsState{

}
class InitialState extends NewsState{

}
class LoadState extends NewsState{

}
class PassStateBusiness extends NewsState{

}
class FailStateBusiness extends NewsState{
final String error;
FailStateBusiness(this.error);
}
class NewsBottomNav extends NewsState{

}
class LoadSportsState extends NewsState{

}
class PassSportsState extends NewsState{

}
class FailSportsState extends NewsState{
  final String error;
  FailSportsState(this.error);
}
class LoadscienceState extends NewsState{

}
class PassScienceState extends NewsState{

}
class FailScienceState extends NewsState{
  final String error;
  FailScienceState(this.error);
}
class AppChangeMode extends NewsState{

}
class LoadSearch extends NewsState{}
class PassSearch extends NewsState{}
class FailSearch extends NewsState{
  FailSearch(String string);
}