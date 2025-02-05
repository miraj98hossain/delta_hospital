import 'dart:typed_data';

import 'package:delta_hospital/features/patient_portal/data/models/patient_report_gridlist_response.dart';
import 'package:delta_hospital/features/patient_portal/domain/repositories/pat_portal_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ReportPdfEvent {}

class ReportPdfGet extends ReportPdfEvent {
  final String hnId;
  final Report report;

  ReportPdfGet({required this.hnId, required this.report});
}

sealed class ReportPdfState {}

class ReportPdfInitial extends ReportPdfState {}

class ReportPdfLoading extends ReportPdfState {}

class ReportPdfError extends ReportPdfState {
  final Object error;

  ReportPdfError({required this.error});
}

class ReportPdfSuccess extends ReportPdfState {
  final Uint8List data;
  final Report report;
  ReportPdfSuccess({required this.data, required this.report});
}

class ReportPdfBloc extends Bloc<ReportPdfEvent, ReportPdfState> {
  final PatPortalRepository _repository;

  ReportPdfBloc(this._repository) : super(ReportPdfInitial()) {
    on<ReportPdfGet>((event, emit) async {
      emit(ReportPdfLoading());
      try {
        if (event.report.itemTypeNo == 1 &&
            !(event.report.webStatus == "1" &&
                event.report.nonLabStatus == 1)) {
          await _repository.previewPathReport(
            report: event.report,
          );
        }

        if (event.report.itemTypeNo == 2) {
          var response = await _repository.getNonLabFileRptByInvoiceItemNo(
            hnId: event.hnId,
            itemNo: event.report.itemNo!,
            invoiceNo: event.report.invoiceNo!,
          );
          if (response.isNotEmpty) {
            emit(ReportPdfSuccess(data: response, report: event.report));
          } else {
            emit(ReportPdfError(error: response));
          }
        }
        if (event.report.webStatus == "1" && event.report.nonLabStatus == 1) {
          var response = await _repository.getLabRptByInvoiceItemNo(
            hnId: event.hnId,
            itemNo: event.report.itemNo!,
            invoiceNo: event.report.invoiceNo!,
          );
          if (response.isNotEmpty) {
            emit(ReportPdfSuccess(data: response, report: event.report));
          } else {
            emit(ReportPdfError(error: response));
          }
        }
      } catch (e) {
        emit(ReportPdfError(error: e));
      }
    });
  }
}
