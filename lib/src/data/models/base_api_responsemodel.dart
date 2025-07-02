import 'package:flutter/foundation.dart';

import '../../core/resources/data_state.dart';
import '../../core/utils/error_utils.dart';

abstract class BaseApiResponseModel {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<T> Function() request,
  }) async {
    try {
      final response = await request();
      return ResultSuccess(response);
    } catch (e) {
      return ResultFailure(ErrorUtils.generateErrorDetails(e));
    }
  }
}
