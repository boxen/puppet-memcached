class memcached::package(
  $ensure     = undef,

  $package    = undef,
  $version    = undef,
) {

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
