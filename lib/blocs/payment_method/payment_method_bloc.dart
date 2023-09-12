import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mepay/models/payment_method_model.dart';
import 'package:mepay/services/transaction_service.dart';
import 'package:meta/meta.dart';

part 'payment_method_event.dart';
part 'payment_method_state.dart';

class PaymentMethodBloc extends Bloc<PaymentMethodEvent, PaymentMethodState> {
  PaymentMethodBloc() : super(PaymentMethodInitial()) {
    on<PaymentMethodEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is PaymentMethodGet) {
        try {
          emit(PaymentMethodLoading());

          final res = await TransactionService().getPaymentMethods();

          emit(PaymentMethodSuccess(res));
        } catch (e) {
          emit(PaymentMethodFailed(e.toString()));
        }
      }
    });
  }
}
