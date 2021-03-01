class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1614621714/youtube-dl.tar.gz"
  sha256 "34779eae0bf25abf4df8643434f1797d26803cf6efa63b28326526f81a54ed88"
  version "1614621714"

  head do
    url "https://github.com/nao20010128nao/ytdl-patched/releases/download/1614621714/youtube-dl.tar.gz"
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
