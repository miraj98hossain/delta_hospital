import 'package:delta_hospital/data/models/patient_report_gridlist_response.dart';
import 'package:delta_hospital/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class ReportEvent {}

final class GetReportEvent extends ReportEvent {
  final int start;
  final int length;

  GetReportEvent({this.start = 0, this.length = 100});
}

@immutable
sealed class ReportState {}

final class ReportInitial extends ReportState {}

final class ReportLoading extends ReportState {}

final class ReportSuccess extends ReportState {
  final ReportGridList reportGridList;

  ReportSuccess({required this.reportGridList});
}

final class ReportError extends ReportState {
  final Object error;

  ReportError({required this.error});
}

class ReportBloc extends Bloc<ReportEvent, ReportState> {
  final PatPortalRepository _repository;
  ReportBloc(this._repository) : super(ReportInitial()) {
    on<GetReportEvent>((event, emit) async {
      emit(ReportLoading());
      try {
        var response = await _repository.getReportByAccessToken(
            start: event.start, length: event.length);
        emit(ReportSuccess(reportGridList: response));
      } catch (e) {
        emit(ReportError(error: e));
      }
    });
  }
}
