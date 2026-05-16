# homebrew-fuga

Homebrew tap for [fuga](https://github.com/crodorg/fuga) — a
terminal-native music library aggregator that plays local files (via
MPD), Spotify, YouTube, SomaFM, and user-defined internet radio
through one TUI, one queue, one keyboard.

## Install

```sh
brew install crodorg/fuga/fuga
```

That builds fuga from source via `cargo` and pins to the latest
tagged release.

To get bleeding-edge `main`:

```sh
brew install --HEAD crodorg/fuga/fuga
```

## Optional runtime tools

`fuga` ships with embedded `librespot` for Spotify, so that source
needs nothing extra. The other sources rely on system tools — install
whichever you use:

```sh
brew install mpd       # Local source (browses the MPD library)
brew install yt-dlp    # YouTube source (search, stream, download)
```

Radio and SomaFM work out of the box.

## Upgrade

```sh
brew update && brew upgrade fuga
```

## License

The tap metadata is MIT, matching fuga itself.
