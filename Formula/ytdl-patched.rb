class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1609675350/youtube-dl.tar.gz"
  sha256 "b13293906ad7f6da5d3557b0aa7aabea7fcab764bbd772f2ecf26814da9c5376"
  version "1609675350"

  head do
    url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1609675350/youtube-dl.tar.gz"
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
