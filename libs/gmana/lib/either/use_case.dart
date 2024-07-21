import 'package:gmana/gmana.dart';

class NoParams {}

abstract interface class UseCase<SuccessType, Params> {
  FutureEither<SuccessType> call(Params params);
}
