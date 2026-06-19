class Fuga < Formula
  desc "Terminal-native multi-source music library aggregator"
  homepage "https://github.com/crodorg/fuga"
  url "https://github.com/crodorg/fuga/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "ac56648a4ebf6365e084d53c4866946d892c73f3ae0431fdc3f3d22a21a2a7f1"
  license "MIT"
  head "https://github.com/crodorg/fuga.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
    pkgshare.install "examples/config.toml"
    doc.install "README.md", "CHANGELOG.md", "docs"
  end

  def caveats
    <<~EOS
      Drop a starter config:
        mkdir -p ~/.config/fuga
        cp #{opt_pkgshare}/config.toml ~/.config/fuga/config.toml

      Optional runtime tools (install whichever sources you use):
        brew install mpd       # Local source (browses the MPD library)
        brew install yt-dlp    # YouTube source (search, stream, download)
        # Spotify needs nothing extra (librespot is embedded)
        # Radio + SomaFM work out of the box

      First-time Spotify auth:
        fuga --spotify-auth
        (see docs/spotify-setup.md for the full walkthrough)
    EOS
  end

  test do
    assert_match "fuga #{version}", shell_output("#{bin}/fuga --version")
  end
end
