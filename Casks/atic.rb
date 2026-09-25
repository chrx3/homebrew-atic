cask "atic" do
  version "0.4.39"
  sha256 "4af80d9a73d3de3098c7fa94daf73bdfc7e32e5800f93ed50f8707bd34bd7a00"

  url "https://github.com/chrx3/atic/releases/download/v#{version}/Atic_#{version}_universal.dmg"
  name "Atic"
  desc "Local-first desktop assistant: dictation, recording, captures and clipboard"
  homepage "https://github.com/chrx3/atic"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Atic se actualiza sola (updater de Tauri): brew no la pisa en `upgrade`.
  auto_updates true
  depends_on macos: :big_sur

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
