class memcached::package(
  $ensure     = $memcached::params::ensure,

  $package    = $memcached::params::package,
  $version    = $memcached::params::version,
) inherits memcached::params {

  $real_ensure = $ensure ? {
    present => $version,
    default => absent,
  }

  if $::operatingsystem == 'Darwin' {
    homebrew::formula { 'memcached': }
  }

  package { $package:
    ensure => $real_ensure,
  }

}
