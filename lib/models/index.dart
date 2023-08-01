export 'model.dart';
export 'login_data.dart';
export 'server_response.dart';
export 'comment.dart';
export 'video_post.dart';
export 'event.dart';
export 'address.dart';
export 'devotional.dart';
export 'church.dart';
export 'user.dart';
export 'hierarchy.dart';
export 'audio_post.dart';
export 'pagination.dart';
export 'society.dart';
export 'resized_image.dart';
export 'poster.dart';
export 'feed.dart';
export 'post.dart';
export 'playable.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
