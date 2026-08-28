enum LightSource {
  led(name: 'Full Spectrum LED', factor: 0.015),
  ndl(name: 'NDL / HPS', factor: 0.0122),
  cmh(name: 'CMH / LEC', factor: 0.0145);

  final String name;
  final double factor;

  const LightSource({
    required this.name,
    required this.factor,
  });
}
