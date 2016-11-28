require 'formula'

class Libmemcached < Formula
  homepage 'http://libmemcached.org'
  url 'https://launchpad.net/libmemcached/1.0/1.0.15/+download/libmemcached-1.0.15.tar.gz'
  sha256 'dd7e9560029835bddf761a5b4c2339d9e5c7374558659b6c11b2c95e7d3a4325'
  version '1.0.15-boxen1'

  depends_on 'memcached'

  def install
    ENV.append_to_cflags "-undefined dynamic_lookup" if MacOS.version == :leopard

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
