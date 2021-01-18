class YtdlPatched < Formula
  include Language::Python::Virtualenv
 
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1610908868/youtube-dl.tar.gz"
  sha256 "143d758b02d351879302d2abf14f7ade2e4de2ccc2803ef097c38682726dc1e3"
  version "1610908868"
  license "Unlicense"

  head do
    url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1610908868/youtube-dl.tar.gz"
  end

  bottle :unneeded

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/youtube-dl", "--simulate", "https://www.youtube.com/watch?v=pOtd1cbOP7k"
    system "#{bin}/youtube-dl", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=pOtd1cbOP7k&list=PLMsZ739TZDoLj9u_nob8jBKSC-mZb0Nhj"
  end
end
