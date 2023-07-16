class Advcomp < Formula
  desc "advancecomp with newer zopfli"
  homepage "https://github.com/nao20010128nao/advancecomp"
  url "https://github.com/nao20010128nao/advancecomp/archive/v1.23.tar.gz"
  sha256 "fe89d6ab382efc6b6be536b8d58113f36b83d82783d5215c261c14374cba800a"
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
