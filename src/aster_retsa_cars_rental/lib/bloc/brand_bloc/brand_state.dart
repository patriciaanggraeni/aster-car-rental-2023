import '../../models/brand.dart';

abstract class BrandState {
  const BrandState();

  List<Object> get props => [];
}

class InitialBrandState extends BrandState {}

class LoadedBandState extends BrandState {
  final List<Brand> brands;
  LoadedBandState(this.brands);

  @override
  List<Object> get props => [brands];
}

class ErrorBrandState extends BrandState {
  final String error;
  ErrorBrandState(this.error);

  @override
  List<String> get props => [error];
}