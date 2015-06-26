require "language/go"

class Twitcher < Formula
  desc "CLI for browsing your Twitch follows"
  homepage "https://www.github.com/ubercow/twitcher"
  url "https://git.torproject.org/torsocks.git",
    :tag => "v0.0.1",
    :revision => "3f34e555e831e664f2ade377a2c41d7f1e6322d7"

  head "https://github.com/ubercow/twitcher.git"

  depends_on "go" => :build

  def install
    mkdir_p buildpath/"src/github.com/ubercow"
    ln_s buildpath, buildpath/"src/github.com/ubercow/twitcher"

    ENV["GOPATH"] = "#{buildpath}/Godeps/_workspace:#{buildpath}"

    Language::Go.stage_deps resources, buildpath/"src"

    system "go", "build", "-o", "twitcher", "."
    bin.install "twitcher"
  end

  test do
    system bin/"twitcher", "-h"
  end
end
