cask "typesteps" do
  version "1.0.5"
  sha256 "45a8d0f48c06b9e122977e15853097996371d37c340c3ff478342274d007e0b0"

  url "https://github.com/FALAK097/typesteps/releases/download/v#{version}/typesteps.zip"

  name "TypeSteps"
  desc "A privacy-focused passive macOS keystroke counter"
  homepage "https://github.com/FALAK097/typesteps"

  depends_on arch: :arm64

  app "typesteps.app"

  postflight do
    # Remove quarantine attribute
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/typesteps.app"],
                   sudo: false
  end

  auto_updates false

  zap trash: [
    "~/Library/Application Support/typesteps",
    "~/Library/Preferences/com.falakgala.typesteps.plist",
  ]
end
