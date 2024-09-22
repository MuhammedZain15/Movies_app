import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/popular/popular_movies_model.dart';
import 'package:movies_app/moduls/home/upcoming_manager/states.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';

class UpComingCubit extends Cubit<UpComingStates> {
  UpComingCubit() : super(LoadingUpComingStates());
   List<MoviesModel> _upComingMovies = [];

  List<MoviesModel> get upComingList => _upComingMovies;

  static UpComingCubit get(context) => BlocProvider.of(context);

  Future<void> getUpComingMovies() async {
    try {
      _upComingMovies =await ApiManager.fetchUpcomingMovies();
      emit(SuccessUpComingStates());
    } catch (e) {
      emit(ErrorUpComingStates());
    }
  }
}
