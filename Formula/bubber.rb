class Bubber < Formula
  homepage "https://github.com/ubercow/bubber"
  url "https://github.com/ubercow/bubber.git", :tag => "v0.2.0", :revision => "bdc24d4abdfc2a227890c168b2bebd285f714f64"
  head "https://github.com/ubercow/bubber.git"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/bubber"
  end

  test do
    assert_equal "ⓗⓔⓛⓛⓞ\n", pipe_output("#{bin}/bubber hello")
  end
end
