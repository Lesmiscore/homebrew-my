class YtdlPatched < Formula
  include Language::Python::Virtualenv

  desc "youtube-dl fork fork fork with some more features"
  homepage "https://github.com/ytdl-patched/ytdl-patched"
  url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1634686353/yt_dlp-wheel.tar.gz" # replace-marker
  version "1634686353" # replace-marker
  sha256 "a32f6644ace1df7a5f597e90fad3c83bb7b6e107272ca34608c9b0fa0bca6b9d" # replace-marker
  license "Unlicense"

  bottle :unneeded

  depends_on "python@3.9"

  resource "mutagen" do
    url "https://files.pythonhosted.org/packages/16/b3/f7aa8edf2ff4495116f95fd442b2a346aa55d1d46313143c8814886dbcdb/mutagen-1.45.1-py3-none-any.whl"
    sha256 "9c9f243fcec7f410f138cb12c21c84c64fde4195481a30c9bfb05b5f003adfed"
  end

  resource "pycryptodomex" do
    url "https://files.pythonhosted.org/packages/47/14/dd9ad29cd29ea4cc521286f2cb401ca7ac6fd5db0791c5e9bacaf2c9ac78/pycryptodomex-3.11.0.tar.gz"
    sha256 "0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/1c/f4/61aee1eb4baadf8477fb7f3bc6b04a50fe683ef8ad2f60282806821e4b3b/websockets-10.0.tar.gz"
    sha256 "c4fc9a1d242317892590abe5b61a9127f1a61740477bfb121743f290b8054002"
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
