enum MapStyle {
  classicDark(filePath: 'lib/google_maps/assets/style/map/classic_dark.json'),
  blackPink(filePath: 'lib/google_maps/assets/style/map/black_pink.json'),
  silverPink(filePath: 'lib/google_maps/assets/style/map/silver_pink.json');

  final String filePath;

  const MapStyle({required this.filePath});
}