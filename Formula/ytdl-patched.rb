class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1619338267/youtube-dl.tar.gz"
  sha256 "94d8d7a73cd76ba3fc1b83ff214af28aea4266d4e7a20d73eaf4f83e4c4d46cd"
  version "1619338267"

  head do
    url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1619338267/youtube-dl.tar.gz"
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
