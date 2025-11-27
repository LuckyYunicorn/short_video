import 'package:equatable/equatable.dart';

sealed class ShortVideoState extends Equatable {
  const ShortVideoState();
  @override
  List<Object?> get props => [];
}

class ShortVideoInitial extends ShortVideoState {}

class ShortVideoLoaded extends ShortVideoState {
  final List<String> shortVideoList;
  const ShortVideoLoaded({required this.shortVideoList});

  @override
  List<Object?> get props => [shortVideoList];
}

class ShortVideoError extends ShortVideoState {
  final String message;
  const ShortVideoError({required this.message});

  @override
  List<Object?> get props => [message];
}
