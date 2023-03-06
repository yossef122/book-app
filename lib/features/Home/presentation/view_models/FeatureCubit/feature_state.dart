part of 'feature_cubit.dart';

@immutable
abstract class FeatureState {}

class FeatureInitial extends FeatureState {}

class GetFeatureBookLoading extends FeatureState {}

class GetFeatureBookSuccess extends FeatureState {}

class GetFeatureBookFailure extends FeatureState {
  final String error;

  GetFeatureBookFailure({required this.error});
}
