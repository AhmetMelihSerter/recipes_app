import 'package:recipes_app/core/base/model/base_model.dart';

abstract class BaseModelResponse<T> extends BaseModel<T> {
  BaseModelResponse({
     this.from,
     this.to,
     this.count,
  });
  
  int? from;
  int? to;
  int? count;

  @override
  String toString() => 'BaseModelResponse(from: $from, to: $to, count: $count)';
}
