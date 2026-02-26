cask "typesteps" do
  version "1.0.2"

  # We will need to manually update this SHA after the first run.
  # For now I will put a placeholder
  sha256 "dc83bd66058003659533b4526c06bd931d3d427fc9dcfd0a59c1be5dd88d5f0d"

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
