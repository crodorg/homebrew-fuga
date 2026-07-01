class Fuga < Formula
  desc "Terminal-native multi-source music library aggregator"
  homepage "https://github.com/crodorg/fuga"
  url "https://github.com/crodorg/fuga/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "14bc33ec86ff2f3b23ed7c8b7d6094cbbb27f7ef9712f59864ff3e12180e9ef8"
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
