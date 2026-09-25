# homebrew-atic

Tap de Homebrew para [Atic](https://github.com/chrx3/atic).

```sh
brew install --cask chrx3/atic/atic
```

Atic se actualiza sola desde la app; `brew upgrade --cask atic` también sirve.

La app no está notarizada por Apple: el cask le quita la cuarentena al
instalarla para que Gatekeeper no la bloquee. Los permisos de macOS
(micrófono, accesibilidad, grabación de pantalla) se piden al abrirla.

Para desinstalar, incluidos los datos:

```sh
brew uninstall --zap --cask atic
```

## Publicar una versión nueva

Tras publicar el release `vX.Y.Z` en chrx3/atic:

```sh
brew bump-cask-pr --version X.Y.Z chrx3/atic/atic   # o a mano:
shasum -a 256 Atic_X.Y.Z_universal.dmg              # y editar Casks/atic.rb
```
