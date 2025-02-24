import 'dart:typed_data';

import 'package:delta_hospital/domain/repositories/pat_portal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
sealed class PrescriptionPdfEvent {}

final class PrescriptionPdfGet extends PrescriptionPdfEvent {
  final int prescriptionId;

  PrescriptionPdfGet({
    required this.prescriptionId,
  });
}

@immutable
sealed class PrescriptionPdfState {}

final class PrescriptionPdfInitial extends PrescriptionPdfState {}

final class PrescriptionPdfLoading extends PrescriptionPdfState {}

final class PrescriptionPdfSuccess extends PrescriptionPdfState {
  final Uint8List prescriptionPdf;

  PrescriptionPdfSuccess({required this.prescriptionPdf});
}

final class PrescriptionPdfError extends PrescriptionPdfState {
  final Object error;

  PrescriptionPdfError({required this.error});
}

class PrescriptionPdfBloc
    extends Bloc<PrescriptionPdfEvent, PrescriptionPdfState> {
  final PatPortalRepository _repository;
  PrescriptionPdfBloc(this._repository) : super(PrescriptionPdfInitial()) {
    on<PrescriptionPdfGet>((event, emit) async {
      emit(PrescriptionPdfLoading());
      try {
        var response = await _repository.getPrescriptionPdf(
          prescriptionId: event.prescriptionId,
        );
        emit(PrescriptionPdfSuccess(prescriptionPdf: response));
      } catch (e) {
        emit(PrescriptionPdfError(error: e));
      }
    });
  }
}
