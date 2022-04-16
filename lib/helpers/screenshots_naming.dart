get screenShotName {
  String time = DateTime.now()
      .toIso8601String()
      .replaceAll('.', '-')
      .replaceAll(':', '-');
  return 'shots-' + time + '.png';
}
