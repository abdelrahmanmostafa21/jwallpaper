/// Returns the file name from a string url.
///
/// Example:
/// Url: https://video.twimg.com/ext_tw_video/1322182514157346818/pu/vid/1280x720/VoCc7t0UyB_R-KvW.mp4?tag=10
/// returns 'VoCc7t0UyB_R-KvW.mp4'.
String? fileNameFromUrl(String? url) {
  if (url != null) {
    try {
      final startIndex = url.lastIndexOf('/') + 1;

      var endIndex = url.lastIndexOf('?');
      if (endIndex == -1) {
        endIndex = url.length;
      }

      return url.substring(startIndex, endIndex);
    } catch (e) {
      // unexpected url string
      return null;
    }
  } else {
    return null;
  }
}
