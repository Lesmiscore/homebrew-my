class YtdlPatched < Formula
  include Language::Python::Virtualenv

  desc "youtube-dl fork fork fork with some more features"
  homepage "https://github.com/ytdl-patched/ytdl-patched"
  url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634554392/yt_dlp-wheel.tar.gz"
  version "1634554392"
  sha256 "96216c54cce1f579ace860a1b34bf458fa211d8ccc1521be6320183074955bd1"
  license "Unlicense"

  bottle :unneeded

  depends_on "python@3.9"

  resource "mutagen" do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634554392/yt_dlp-wheel.tar.gz"
    sha256 "96216c54cce1f579ace860a1b34bf458fa211d8ccc1521be6320183074955bd1"
  end

  resource "pycryptodomex" do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634554392/yt_dlp-wheel.tar.gz"
    sha256 "96216c54cce1f579ace860a1b34bf458fa211d8ccc1521be6320183074955bd1"
  end

  resource "websockets" do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634554392/yt_dlp-wheel.tar.gz"
    sha256 "96216c54cce1f579ace860a1b34bf458fa211d8ccc1521be6320183074955bd1"
  end

  def install
    virtualenv_install_with_resources
    # man1.install_symlink libexec/"share/man/man1/youtube-dl.1" => "youtube-dl.1"
    # bash_completion.install libexec/"etc/bash_completion.d/youtube-dl.bash-completion"
    # fish_completion.install libexec/"etc/fish/completions/youtube-dl.fish"
  end

  test do
    # commit history of homebrew-core repo
    system "#{bin}/youtube-dl", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    # homebrew playlist
    system "#{bin}/youtube-dl", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
