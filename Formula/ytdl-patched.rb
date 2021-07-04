class YtdlPatched < Formula
  include Language::Python::Virtualenv

  desc "Download YouTube videos from the command-line"
  homepage "https://github.com/ytdl-patched/ytdl-patched"
  url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1625365644/youtube_dl-2021.07.04.1625365644-wheel.tar.gz"
  version "1625365644"
  sha256 "91ce0cb0f60dbe71e8a08455241fc2535860c68ea13d9eb876ac00e60b475c18"
  license "Unlicense"

  bottle :unneeded

  depends_on "python@3.9"

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
