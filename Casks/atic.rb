cask "atic" do
  version "0.5.6"
  sha256 "daf1c93c9eb4b79d5b338a2e784e59f926d6be54cdaecb217a006207fe07269d"

  url "https://github.com/chrx3/atic/releases/download/v#{version}/Atic_#{version}_universal.dmg"
  name "Atic"
  desc "Local-first desktop toolbox: agents, meetings, dictation and captures"
  homepage "https://github.com/chrx3/atic"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Atic se actualiza sola (actualizador integrado): brew no la pisa en `upgrade`.
  auto_updates true
  depends_on macos: :ventura

  app "Atic.app"

  # La app no está notarizada: sin esto Gatekeeper la bloquea al abrirla.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Atic.app"], base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/com.ciat.atic",
    "~/Library/Caches/atic-desktop",
    "~/Library/Caches/com.ciat.atic",
    "~/Library/Preferences/com.ciat.atic.plist",
    "~/Library/Saved Application State/com.ciat.atic.savedState",
    "~/Library/WebKit/atic-desktop",
    "~/Library/WebKit/com.ciat.atic",
  ]
end
