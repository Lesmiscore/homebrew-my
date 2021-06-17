class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1623888210/youtube-dl.tar.gz"
  sha256 "b58966585c1c5ca5692bd3c7f06d9778954cdb20752a39e839adc96fdd8e9041"
  version "1623888210"

  head do
    url "https://github.com/ytdl-patched/ytdl-patched/releases/download/1623888210/youtube-dl.tar.gz"
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
