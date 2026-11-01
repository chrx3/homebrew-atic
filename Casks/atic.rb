cask "atic" do
  version "0.5.5"
  sha256 "71f90d6a0751e00d8c950ebcf77f49a74e25b9e741bda4e4c0140fbc50072488"

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
