class memcached::service(
  $ensure     = $memcached::params::ensure,
  $enable     = $memcached::params::enable,
) inherits memcached::params {

  $real_ensure = $ensure ? {
    present => running,
    default => stopped,
  }

  service { 'com.boxen.memcached':
    ensure => stopped,
    enable => false
  }

  ->
  service { 'dev.memcached':
    ensure => $real_ensure,
    enable => $enable,
    alias  => 'memcached',
  }

}
