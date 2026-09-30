cask "falcon-pdf" do
  version "2026.9.0"
  sha256 "7d720380d006bb1084cb0b9d71d9557ed5193aaae8ec54ea279f9153ec9f7df9"

  url "https://github.com/avrapps/falcon-pdf-app/releases/download/2026.09/falconpdf-#{version}-mac-arm64.dmg",
      verified: "github.com/avrapps/falcon-pdf-app/"
  name "Falcon PDF"
  desc "Fast, lightweight PDF viewer and editor"
  homepage "https://falconpdf.com/"

  # The GitHub release tag (2026.09) differs from the DMG's internal version
  # (2026.9.0), so the tag cannot be derived from #{version}. Pin the livecheck
  # to the latest release page and resolve the DMG version from the asset name.
  livecheck do
    url "https://github.com/avrapps/falcon-pdf-app/releases/latest"
    strategy :page_match, regex(%r{falconpdf-(\d+(?:\.\d+)+)-mac-arm64\.dmg}i)
  end

  depends_on macos: ">= :monterey"
  depends_on arch: :arm64

  app "FalconPDF.app"

  zap trash: [
    "~/Library/Application Support/FalconPDF",
    "~/Library/Caches/com.falcon.reader",
    "~/Library/HTTPStorages/com.falcon.reader",
    "~/Library/Preferences/com.falcon.reader.plist",
    "~/Library/Saved Application State/com.falcon.reader.savedState",
  ]
end
