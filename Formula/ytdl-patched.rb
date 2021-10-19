class YtdlPatched < Formula
  include Language::Python::Virtualenv

  desc "youtube-dl fork fork fork with some more features"
  homepage "https://github.com/ytdl-patched/ytdl-patched"
  url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634610952/yt_dlp-wheel.tar.gz"
  version "1634610952"
  sha256 "e8d7caa6a76197b2cd2be24b41587a173bef25463743bfe23a11f3cbfee75021"
  license "Unlicense"

  bottle :unneeded

  depends_on "python@3.9"

  resource "mutagen" do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634610952/yt_dlp-wheel.tar.gz"
    sha256 "e8d7caa6a76197b2cd2be24b41587a173bef25463743bfe23a11f3cbfee75021"
  end

  resource "pycryptodomex" do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634610952/yt_dlp-wheel.tar.gz"
    sha256 "e8d7caa6a76197b2cd2be24b41587a173bef25463743bfe23a11f3cbfee75021"
  end

  resource "websockets" do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634610952/yt_dlp-wheel.tar.gz"
    sha256 "e8d7caa6a76197b2cd2be24b41587a173bef25463743bfe23a11f3cbfee75021"
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
