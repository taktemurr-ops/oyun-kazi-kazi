import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kazi_kazi/oyun_kazi_kazi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kaziConfig.title.length, 33);
    expect(kaziConfig.tagline.length, 33);
    for (final s in kaziConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kaziRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kaziId, optionalMechanics: kaziRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(kaziRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
