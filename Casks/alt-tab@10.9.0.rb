# frozen_string_literal: true

cask "alt-tab@10.9.0" do
  version "10.9.0"
  sha256 "be30ce7635bff5dc3907e2c693ee32acb5fba3770d69b53be5bf26661677d5da"

  url "https://github.com/qwqw-333/homebrew-casks/releases/download/alt-tab-10.9.0/AltTab-#{version}.zip"
  name "AltTab"
  desc "Enable Windows-like alt-tab"
  homepage "https://alt-tab.app/"

  livecheck do
    skip "Pinned to the bundled AltTab 10.9.0 archive"
  end

  depends_on :macos

  app "AltTab.app"

  postflight_steps do
    # AltTab 10.9 stores shortcuts as archived dictionaries. This payload was
    # generated with the bundled ShortcutRecorder framework and preserves Cmd.
    run "/usr/bin/defaults", args: [
      "write", "com.lwouis.alt-tab-macos", "holdShortcut",
      "-dict", "string", "⌘", "secureData", "-data",
      "62706c6973743030d4010203040506070a582476657273696f6e592461726368697665725424746f7058246f626a65637473" \
      "12000186a05f100f4e534b657965644172636869766572d1080954726f6f748001a70b0c191a1b1c1d55246e756c6cd60d" \
      "0e0f1011121314151417185d6d6f646966696572466c6167735f101b6368617261637465727349676e6f72696e674d6f64" \
      "6966696572735624636c6173735a63686172616374657273576b6579436f64655776657273696f6e800480058006800580" \
      "038002513111ffff120010000050d21e1f20215a24636c6173736e616d655824636c61737365735a535253686f72746375" \
      "74a22022584e534f626a65637400080011001a00240029003200370049004c00510053005b0061006e007c009a00a100ac" \
      "00b400bc00be00c000c200c400c600c800ca00cd00d200d300d800e300ec00f700fa0000000000000201000000000000" \
      "002300000000000000000000000000000103"
    ]
    run "/usr/bin/defaults",
        args: ["write", "com.lwouis.alt-tab-macos", "updatePolicy", "-string", "0"]
    run "/usr/bin/defaults",
        args: ["write", "com.lwouis.alt-tab-macos", "SUEnableAutomaticChecks", "-bool", "false"]
    run "/usr/bin/defaults",
        args: ["write", "com.lwouis.alt-tab-macos", "SUAutomaticallyUpdate", "-bool", "false"]
  end

  uninstall quit: "com.lwouis.alt-tab-macos"

  zap trash: [
    "~/Library/Application Support/com.lwouis.alt-tab-macos",
    "~/Library/Caches/com.lwouis.alt-tab-macos",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.lwouis.alt-tab-macos",
    "~/Library/Cookies/com.lwouis.alt-tab-macos.binarycookies",
    "~/Library/HTTPStorages/com.lwouis.alt-tab-macos",
    "~/Library/HTTPStorages/com.lwouis.alt-tab-macos.binarycookies",
    "~/Library/LaunchAgents/com.lwouis.alt-tab-macos.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.license.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.plist",
    "~/Library/Preferences/com.lwouis.alt-tab-macos.usage.plist",
  ]
end
