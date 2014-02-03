class memcached::config(
  $ensure     = undef,

  $datadir    = undef,
  $executable = undef,
  $logdir     = undef,
  $host       = undef,
  $port       = undef,
  $user       = undef,
) {
  include boxen::config

  $dir_ensure = $ensure ? {
    present => directory,
    default => absent,
  }

  File {
    ensure => $ensure
  }

  file {
    [
      $datadir,
      $logdir
    ]:
      ensure => $dir_ensure ;
  }

  if $::operatingsystem == 'Darwin' {
    boxen::env_script { 'memcached':
      ensure   => $ensure,
      content  => template('memcached/env.sh.erb'),
      priority => 'lower',
    }

    file { "${boxen::config::envdir}/memcached.sh":
      ensure => absent,
    }

    file { '/Library/LaunchDaemons/dev.memcached.plist':
      content => template('memcached/dev.memcached.plist.erb'),
      group   => 'wheel',
      owner   => 'root',
    }
  }

}
