import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/details_model/details.dart';
import 'package:movies_app/moduls/home/details_manager/states.dart';
import 'package:movies_app/services/api_manager/apimanager.dart';

import '../../../models/popular/popular_movies_model.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit() : super(LoadingsStates());

  static DetailsCubit get(context) => BlocProvider.of(context);
   DetailsModel? _movie;
  List<MoviesModel> _movies = [];

  List<MoviesModel> get movies => _movies;

  DetailsModel? get movieDetails => _movie;

  Future<void> getMoreLikeThis(int id) async {
    try {
      _movies = await ApiManager.fetchSimilarMovies(id);
      log(movies.length.toString());
      emit(SuccessStates());
    } catch (e) {

      emit(ErrorStates());
    }
  }

  Future<void> getDetails(int id) async {
    try {
      _movie = await ApiManager.fetchDetails(id);
      emit(SuccessStates());
    } catch (e) {
      emit(ErrorStates());
    }
  }
}
