class YtdlPatched < Formula
  desc "Download YouTube videos from the command-line"
  homepage "https://ytdl-org.github.io/youtube-dl/"
  url "https://nao20010128nao.github.io/ytdl-patched/youtube-dl.tar.gz"
  sha256 "14d20b83fee6b573d17854bf0068872e2106ed677c224d43e479e57ea2b37a9d"
  version "1600446882"

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
