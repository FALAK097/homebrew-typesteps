cask "typesteps" do
  version "1.0.3"
  sha256 "be29368407ab4ac960244c652e385cbd90a6522110a1691a2f963603c8471595"

  url "https://github.com/FALAK097/typesteps/releases/download/v#{version}/typesteps.zip"

  name "TypeSteps"
  desc "A privacy-focused passive macOS keystroke counter"
  homepage "https://github.com/FALAK097/typesteps"

  depends_on arch: :arm64

  postflight do
    # Manually extract and install to /Applications
    system_command "unzip",
                   args: ["-q", "-o", "#{staged_path}/typesteps.zip", "-d", "/Applications"],
                   sudo: false
    
    # Remove quarantine attribute
    system_command "xattr",
                   args: ["-dr", "com.apple.quarantine", "/Applications/typesteps.app"],
                   sudo: false
  end

  auto_updates false

  zap trash: [
    "~/Library/Application Support/typesteps",
    "~/Library/Preferences/com.falakgala.typesteps.plist",
  ]
end
