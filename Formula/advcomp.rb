class Advcomp < Formula
  desc "advancecomp with newer zopfli"
  homepage "https://github.com/nao20010128nao/advancecomp"
  url "https://github.com/nao20010128nao/advancecomp/archive/v2.1.tar.gz"
  sha256 "6113c2b6272334af710ba486e8312faa3cee5bd6dc8ca422d00437725e2b602a"
  version "1.0.0"

  head do
    url "https://github.com/nao20010128nao/advancecomp/archive/master.zip"
  end

  depends_on "zlib"

  def install
    system "./autogen.sh"
    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "true"
  end
end
