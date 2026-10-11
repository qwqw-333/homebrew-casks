# frozen_string_literal: true

cask "fireflies" do
  arch arm: "-arm64"

  version "0.1.41"
  sha256 arm:   "84148af51233164d94a1d66df89652db8a24cda24bea2e4eea2718009083df93",
         intel: "4dbbb316ece2082190173ac95ca338524559bf463364848150337b60dfcfbc41"

  url "https://storage.googleapis.com/desktop-releases-production-ff/desktop/releases/Fireflies-#{version}#{arch}.dmg"
  name "Fireflies"
  desc "Transcribe, summarize, and analyze meetings with AI"
  homepage "https://fireflies.ai/desktop"

  livecheck do
    url "https://m.fireflies.ai/desktop/releases/download?platform=macos&arch=arm64"
    regex(/Fireflies[._-]v?(\d+(?:\.\d+)+)-arm64\.dmg/i)
    strategy :header_match
  end

  auto_updates true
  depends_on macos: :monterey

  app "Fireflies.app"

  uninstall quit: "ai.fireflies.desktop"
end
