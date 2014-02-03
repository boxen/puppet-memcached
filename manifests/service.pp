class memcached::service(
  $ensure      = undef,
  $enable      = undef,
  $servicename = undef,
) {

  $real_ensure = $ensure ? {
    present => running,
    default => stopped,
  }

  if $osfamily == 'Darwin' {
    service { 'com.boxen.memcached':
      ensure => stopped,
      enable => false,
      before => Service['memcached'],
    }
  }

  service { $servicename:
    ensure => $real_ensure,
    enable => $enable,
    alias  => 'memcached',
  }

}
