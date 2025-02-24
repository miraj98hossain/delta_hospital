import 'package:delta_hospital/presentations/management/data/models/financial_dash_report_response.dart';

import 'package:delta_hospital/presentations/management/domain/repositories/mng_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class FinancialReportEvent {}

final class FinancialReportGet extends FinancialReportEvent {
  final String fromDate;
  final String toDate;

  FinancialReportGet({required this.fromDate, required this.toDate});
}

@immutable
sealed class FinancialReportState {}

final class FinancialReportInitial extends FinancialReportState {}

final class FinancialReportLoading extends FinancialReportState {}

final class FinancialReportSuccess extends FinancialReportState {
  final List<FinancialReport> financialReportList;

  FinancialReportSuccess({required this.financialReportList});
}

final class FinancialReportError extends FinancialReportState {
  final Object error;

  FinancialReportError({required this.error});
}

class FinancialReportBloc
    extends Bloc<FinancialReportEvent, FinancialReportState> {
  final MngPortalRepository _mngRepository;
  FinancialReportBloc(this._mngRepository) : super(FinancialReportInitial()) {
    on<FinancialReportGet>((event, emit) async {
      emit(FinancialReportLoading());
      try {
        var response = await _mngRepository.findFinancialDashReport(
          fromDate: event.fromDate,
          toDate: event.toDate,
        );
        emit(FinancialReportSuccess(financialReportList: response));
      } catch (e) {
        emit(FinancialReportError(error: e));
      }
    });
  }
}
