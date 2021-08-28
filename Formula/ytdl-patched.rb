class YtdlPatched < Formula
  include Language::Python::Virtualenv

  desc "youtube-dl fork fork fork with some more features"
  homepage "https://github.com/ytdl-patched/ytdl-patched"
  url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1630109994/yt_dlp-2021.08.28.1630109994-wheel.tar.gz"
  version "1630109994"
  sha256 "60a5c3a8df1b28897e1e2a73b551ac0757cc82c4596cf74c5d35030a51a60e43"
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
