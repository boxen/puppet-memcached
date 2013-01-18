class memcached {
  require memcached::config

  package { 'boxen/brews/memcached':
    ensure => '1.4.13-boxen1',
    notify => Service['dev.memcached']
  }

  service { 'dev.memcached':
    ensure  => running,
    require => Package['boxen/brews/memcached']
  }

  service { 'com.boxen.memcached': # replaced by dev.memcached
    before => Service['dev.memcached'],
    enable => false
  }

  file { "${boxen::config::envdir}/memcached.sh":
    content => template('memcached/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
