class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://nao20010128nao.github.io/ytdl-patched/youtube-dl.tar.gz"
  sha256 "5d949e09be32235730a842d58230e73bf9c72bf36103bfb1c6d7cc87b3974770"
  version "1574510977"

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
