import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BaseStatus<T> extends Equatable {
  const BaseStatus();

  @override
  List<Object?> get props => [];
}

@immutable
class Initial<T> extends BaseStatus<T> {
  const Initial();

  @override
  List<Object?> get props => [];
}

@immutable
class Loading<T> extends BaseStatus<T> {
  const Loading();

  @override
  List<Object?> get props => [];
}

@immutable
class Success<T> extends BaseStatus<T> {
  final T? data;

  const Success({this.data});

  @override
  List<Object?> get props => [data];
}

@immutable
class ErrorStatus<T> extends BaseStatus<T> {
  final String message;
  final Object? error;

  const ErrorStatus({required this.message, this.error});

  @override
  List<Object?> get props => [message, error];
}

@immutable
class Empty<T> extends BaseStatus<T> {
  const Empty();

  @override
  List<Object?> get props => [];
}

// Extension for easier UI handling
extension BaseStatusExtension<T> on BaseStatus<T> {
  bool get isInitial => this is Initial<T>;
  bool get isLoading => this is Loading<T>;
  bool get isSuccess => this is Success<T>;
  bool get isError => this is ErrorStatus<T>;
  bool get isEmpty => this is Empty<T>;

  T? get data => isSuccess ? (this as Success<T>).data : null;
  String? get errorMessage => isError ? (this as ErrorStatus<T>).message : null;

  void when({
    void Function()? initial,
    void Function()? loading,
    void Function(T?)? success,
    void Function(String, Object?)? error,
    void Function()? empty,
  }) {
    if (isInitial && initial != null) {
      initial();
    } else if (isLoading && loading != null) {
      loading();
    } else if (isSuccess && success != null) {
      success((this as Success<T>).data);
    } else if (isError && error != null) {
      final err = this as ErrorStatus<T>;
      error(err.message, err.error);
    } else if (isEmpty && empty != null) {
      empty();
    }
  }

  Widget whenWidget({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(T?) success,
    required Widget Function(String, Object?) error,
    Widget Function()? empty,
  }) {
    if (isInitial) return initial();
    if (isLoading) return loading();
    if (isSuccess) return success((this as Success<T>).data);
    if (isError) {
      final err = this as ErrorStatus<T>;
      return error(err.message, err.error);
    }
    return empty != null ? empty() : const SizedBox.shrink();
  }
}