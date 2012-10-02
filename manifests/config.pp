class memcached::config {
  require boxen::config

  $datadir    = "${boxen::config::datadir}/memcached"
  $executable = "${boxen::config::homebrewdir}/bin/memcached"
  $logdir     = "${boxen::config::logdir}/memcached"
  $logfile    = "${logdir}/console.log"
  $port       = 21211

  file { [$datadir, $logdir]:
    ensure => directory
  }

  file { '/Library/LaunchDaemons/com.boxen.memcached.plist':
    content => template('memcached/com.boxen.memcached.plist.erb'),
    group   => 'wheel',
    notify  => Service['com.boxen.memcached'],
    owner   => 'root'
  }
}
