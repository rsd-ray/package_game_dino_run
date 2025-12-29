import 'package:flame/camera.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'game/dino_run.dart';
import 'widgets/game_over_menu.dart';
import 'widgets/hud.dart';
import 'widgets/main_menu.dart';
import 'widgets/pause_menu.dart';
import 'widgets/settings_menu.dart';

class GameDinoRun extends StatefulWidget {
  const GameDinoRun({super.key});

  @override
  State<GameDinoRun> createState() => _GameDinoRunState();
}

class _GameDinoRunState extends State<GameDinoRun> {

  @override
  void dispose() {
    FlameAudio.bgm.stop();
    Flame.device.restoreFullscreen();
    Flame.device.setPortrait();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget<DinoRun>.controlled(
        // This will dislpay a loading bar until [DinoRun] completes
        // its onLoad method.
        loadingBuilder: (conetxt) => const Center(
          child: SizedBox(width: 200, child: LinearProgressIndicator()),
        ),
        // Register all the overlays that will be used by this game.
        overlayBuilderMap: {
          MainMenu.id: (_, game) => MainMenu(game),
          PauseMenu.id: (_, game) => PauseMenu(game),
          Hud.id: (_, game) => Hud(game),
          GameOverMenu.id: (_, game) => GameOverMenu(game),
          SettingsMenu.id: (_, game) => SettingsMenu(game),
        },
        // By default MainMenu overlay will be active.
        initialActiveOverlays: const [MainMenu.id],
        gameFactory: () => DinoRun(
          // Use a fixed resolution camera to avoid manually
          // scaling and handling different screen sizes.
          camera: CameraComponent.withFixedResolution(
            width: 360,
            height: 180,
          ),
        ),
      ),
    );
  }
}