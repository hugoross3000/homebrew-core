class Fileicon < Formula
  desc "macOS CLI for managing custom icons for files and folders"
  homepage "https://github.com/mklement0/fileicon"
  url "https://github.com/mklement0/fileicon/archive/v0.3.1.tar.gz"
  sha256 "3ccc1c65afa39f41c5e63a923128ec41d4fba911b22142cc5f578bccd9b96d03"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "351fd94a479c755b17d874a82eba7986842aaeb57e8b6d65c4aee3b1b5434f32"
  end

  depends_on :macos

  def install
    bin.install "bin/fileicon"
    man1.install "man/fileicon.1"
  end

  test do
    icon = test_fixtures "test.png"
    system bin/"fileicon", "set", testpath, icon
    assert_predicate testpath/"Icon\r", :exist?
    stdout = shell_output "#{bin}/fileicon test #{testpath}"
    assert_includes stdout, "HAS custom icon: '#{testpath}'"
  end
end
