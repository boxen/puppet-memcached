class memcached::config {
  require github::config

  $datadir    = "${github::config::datadir}/memcached"
  $executable = "${github::config::homebrewdir}/bin/memcached"
  $logdir     = "${github::config::logdir}/memcached"
  $logfile    = "${logdir}/console.log"
  $port       = 21211

  file { [$datadir, $logdir]:
    ensure => directory
  }

  file { '/Library/LaunchDaemons/com.github.memcached.plist':
    content => template('memcached/com.github.memcached.plist.erb'),
    group   => 'wheel',
    notify  => Service['com.github.memcached'],
    owner   => 'root'
  }
}
