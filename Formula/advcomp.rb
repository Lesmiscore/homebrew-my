class Advcomp < Formula
  desc "advancecomp with newer zopfli"
  homepage "https://github.com/nao20010128nao/advancecomp"
  url "https://github.com/nao20010128nao/advancecomp/archive/f1dd23d313f736a9b64d3229328ae2f1dff4ca60.zip"
  sha256 "a9581b42892d1a784350c8538843eec02c49406791e0e805282d4f3e4efa3bf0"
  version "1.0.0"

  head do
    url "https://github.com/nao20010128nao/advancecomp/archive/master.zip"
  end

  bottle :unneeded

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
