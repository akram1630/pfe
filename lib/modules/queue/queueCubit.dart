import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pfe/modules/queue/queueStates.dart';
import 'package:pfe/shared/dio_helper.dart';

import '../../models/relatedObjectsModel.dart';

class queueCubit extends Cubit<queueStates> {
  queueCubit() : super(queueInitialState());

  static queueCubit get(context) => BlocProvider.of(context);

  relatedObjectsModel ? objects ;
  void getReletedObj(){
    emit(queueGetRelatedObjectsLoadingState());
    dioHelper.getData(
        url: 'Api/Related_objects/',
        token: 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4NjI1NjQ5LCJpYXQiOjE3MTA4NDk2NDksImp0aSI6IjJmMzM0OGY5MzczMzQxYWZiZmZlODE3MjZjOTM4NGE0IiwidXNlcl9pZCI6MzN9.9MfZx_sG7TZZMHef5lyNK2xzFWtNHv6s8mCnAYuh-vY'
    ).then((value){
      print(value.data);
      objects = relatedObjectsModel.fromJson(value.data);
      emit(queueGetRelatedObjectsSeccessState());
    })
        .catchError((err){
      print(err.toString());
      emit(queueGetRelatedObjectsErrorState());
    });
  }
}