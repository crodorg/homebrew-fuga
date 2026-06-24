class Fuga < Formula
  desc "Terminal-native multi-source music library aggregator"
  homepage "https://github.com/crodorg/fuga"
  url "https://github.com/crodorg/fuga/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "79665d3c01498564f9c44d37a452c62379f54b94a2c5e17269bdd4e0ffa70f5a"
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
