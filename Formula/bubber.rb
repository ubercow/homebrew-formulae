class Bubber < Formula
  homepage "https://github.com/ubercow/bubber"
  url "https://github.com/ubercow/bubber.git", :tag => "v0.1.0", :revision => "6a399e62db72175f9a0d53436d2c91a03a32f00a"
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
