class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://nao20010128nao.github.io/ytdl-patched/youtube-dl.tar.gz"
  sha256 "bf2624d4742d3b902bd18e7793c4074c5f45fd1ec904f284b4987dca52710ffe"
  version "1590365844"

  head do
    url "https://github.com/nao20010128nao/void.git"
  end

  bottle :unneeded

  def install
    system "wget", "https://nao20010128nao.github.io/ytdl-patched/youtube-dl.tar.gz" if build.head?
    system "tar", "-xzvf", "youtube-dl.tar.gz", "--strip-components=1" if build.head?
    bin.install "youtube-dl"
  end

  test do
    system "#{bin}/youtube-dl", "--simulate", "https://www.youtube.com/watch?v=he2a4xK8ctk"
    system "#{bin}/youtube-dl", "--simulate", "--yes-playlist", "https://www.youtube.com/watch?v=iCkYw3cRwLo&list=LLnHXLLNHjNAnDQ50JANLG1g"
  end
end
