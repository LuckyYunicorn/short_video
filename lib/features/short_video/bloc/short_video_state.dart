import 'package:equatable/equatable.dart';

class ShortVideoState extends Equatable {
  final List<String> videoUrl;
  final bool isPlaying;
  final bool isLoading;

  const ShortVideoState({
    this.videoUrl = const[],
    this.isPlaying = true,
    this.isLoading = false,
  });

  ShortVideoState copyWith({
    List<String>? videoUrl,
    bool? isPlaying,
    bool? isLoading,
  }) {
    return ShortVideoState(
      videoUrl: videoUrl ?? this.videoUrl,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [videoUrl, isPlaying, isLoading];
}
