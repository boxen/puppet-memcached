class memcached::config(
  $ensure     = $memcached::params::ensure,

  $datadir    = $memcached::params::datadir,
  $executable = $memcached::params::executable,
  $logdir     = $memcached::params::logdir,
  $host       = $memcached::params::host,
  $port       = $memcached::params::port,
  $user       = $memcached::params::user,
) inherits memcached::params {

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

  '/Library/LaunchDaemons/dev.memcached.plist':
    content => template('memcached/dev.memcached.plist.erb'),
    group   => 'wheel',
    owner   => 'root'


  if $::operatingsystem == 'Darwin' {
    include boxen::config

    boxen::env_script { 'memcached':
      ensure   => $ensure,
      content  => template('memcached/env.sh.erb'),
      priority => 'lower',
    }

    file { "${boxen::config::envdir}/memcached.sh":
      ensure => absent,
    }
  }

}
