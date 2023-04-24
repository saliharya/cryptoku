import 'dart:async';

abstract class BaseUseCase<REQUEST_TYPE, RESPONSE_TYPE> {
  FutureOr<RESPONSE_TYPE> invoke(REQUEST_TYPE request);
}
