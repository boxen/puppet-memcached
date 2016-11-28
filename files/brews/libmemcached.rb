require 'formula'

class Libmemcached < Formula
  homepage 'http://libmemcached.org'
  url 'https://launchpad.net/libmemcached/1.0/1.0.15/+download/libmemcached-1.0.15.tar.gz'
  sha256 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  version '1.0.15-boxen1'

  depends_on 'memcached'

  def install
    ENV.append_to_cflags "-undefined dynamic_lookup" if MacOS.version == :leopard

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
