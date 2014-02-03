class memcached(
  $ensure     = undef,

  $package    = undef,
  $version    = undef,

  $datadir    = undef,
  $executable = undef,
  $logdir     = undef,
  $host       = undef,
  $port       = undef,
  $user       = undef,

  $enable     = undef,
) {
  validate_string(
    $ensure,
    $package,
    $version,
    $datadir,
    $executable,
    $logdir,
    $host,
    $port,
    $user,
  )

  validate_bool(
    $enable,
  )

  class { 'memcached::config':
    ensure     => $ensure,

    datadir    => $datadir,
    executable => $executable,
    logdir     => $logdir,
    host       => $host,
    port       => $port,
    user       => $user,

    notify     => Service['memcached'],
  }

  ~>
  class { 'memcached::package':
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
