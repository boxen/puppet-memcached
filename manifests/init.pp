class memcached {
  require memcached::config

  package { 'boxen/brews/memcached':
    ensure => '1.4.13-boxen1',
    notify => Service['com.boxen.memcached']
  }

  service { 'com.boxen.memcached':
    ensure  => running,
    require => Package['boxen/brews/memcached']
  }

  file { "${boxen::config::envdir}/memcached.sh":
    content => template('memcached/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
