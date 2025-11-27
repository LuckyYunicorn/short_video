import 'package:equatable/equatable.dart';

sealed class ShortVideoEvent extends Equatable {
  const ShortVideoEvent();
  @override
  List<Object?> get props => [];
}

class GetShortVideos extends ShortVideoEvent {}

