cask "typesteps" do
  version "1.0.4"
  sha256 "0b2ffa6430d2b611841afb7f1704d32e6009576aaa88fee3372657137b1abe3f"

  url "https://github.com/FALAK097/typesteps/releases/download/v#{version}/typesteps.zip"

  name "TypeSteps"
  desc "A privacy-focused passive macOS keystroke counter"
  homepage "https://github.com/FALAK097/typesteps"

  depends_on arch: :arm64

  preflight do
    # Extract zip to staged path
    system_command "unzip",
                   args: ["-q", "-o", "#{staged_path}/typesteps.zip", "-d", "#{staged_path}"],
                   sudo: false
  end

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
