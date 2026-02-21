cask "typesteps" do
  version "1.0.1"

  # We will need to manually update this SHA after the first run.
  # For now I will put a placeholder
  sha256 "3725eab27396f06e8c4aafbe18624ba9295145c6e154d7a3588ef3ded6356820"

  url "https://github.com/FALAK097/typesteps/releases/download/v#{version}/typesteps.zip"

  name "TypeSteps"
  desc "A privacy-focused passive macOS keystroke counter"
  homepage "https://github.com/FALAK097/typesteps"

  app "typesteps.app"

  auto_updates false

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/typesteps.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/typesteps",
    "~/Library/Preferences/com.falakgala.typesteps.plist",
  ]
end
