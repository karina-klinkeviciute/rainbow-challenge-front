part of 'qr_code_scanner_cubit.dart';

abstract class QrCodeScannerState extends Equatable {
  const QrCodeScannerState();

  @override
  List<Object> get props => [];
}

class QrCodeScannerInitial extends QrCodeScannerState {}

class QrCodeScannerAdded extends QrCodeScannerState {}
