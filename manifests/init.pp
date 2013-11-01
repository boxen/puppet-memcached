class memcached(
  $ensure     = $memcached::params::ensure,

  $package    = $memcached::params::package,
  $version    = $memcached::params::version,

  $datadir    = $memcached::params::datadir,
  $executable = $memcached::params::executable,
  $logdir     = $memcached::params::logdir,
  $host       = $memcached::params::host,
  $port       = $memcached::params::port,
  $user       = $memcached::params::user,

  $enable     = $memcached::params::enable,
) inherits memcached::params {

  class { 'memcached::config':
    ensure     => $ensure,

    datadir    => $datadir,
    executable => $executable,
    logdir     => $logdir,
    host       => $host,
    port       => $port,
    user       => $user,
  }

  ~>
  class { 'memcached:package':
    ensure  => $ensure,

    package => $package,
    version => $version,
  }

  ~>
  class { 'memcached::service':
    ensure => $ensure,

    enable => $enable,
  }

}
