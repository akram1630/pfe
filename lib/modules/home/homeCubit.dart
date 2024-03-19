import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/models/allServicesModel.dart';
import 'package:pfe/shared/dio_helper.dart';

import '../../models/categories_model.dart';
import 'homeStates.dart';

class homeCubit extends Cubit<homeStates> {
  homeCubit() : super(homeInitialState());

  static homeCubit get(context) => BlocProvider.of(context);
  allServices ? all_services ;
  void getAllServices(){
    emit(homeGetServicesLoadingState());

    dioHelper.getData(url: 'Api/All_Services/' )
        .then((value){
      all_services = allServices.fromJson(value.data) ;
      print(all_services!.services.length);
      emit(homeGetServicesSuccessState());
    })
    .catchError((err){
      print(err.toString());
      emit(homeGetServicesErrorState());
    });
  }

  categoriesModel ? categories ;
  void getCategories(){
    emit(homeGetCategoriesLoadingState());

    dioHelper.getData(url: 'Api/All_Categories/' )
    .then((value){
      print(value.data);
      categories = categoriesModel.fromJson(json: value.data);
      emit(homeGetCategoriesLoadingState());
    })
    .catchError((err){
      print(err.toString());
      emit(homeGetCategoriesErrorState());

    });
  }

  void registerDate({
    required String ? token,
    required String ? serv_id,

  }){
    dioHelper.postData(
        url: 'Api/RegisterDate/',
        data: {
          "serv_id" : serv_id
        },
        token: token
    ).then((value){
      print(value.statusCode);
      print(value.data);
    }).catchError((err){
      print(err.toString());
    });
  }
}