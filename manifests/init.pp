class memcached {
  require memcached::config

  package { 'github/brews/memcached':
    ensure => '1.4.13-github1',
    notify => Service['com.github.memcached']
  }

  service { 'com.github.memcached':
    ensure  => running,
    require => Package['github/brews/memcached']
  }

  file { "${github::config::envdir}/memcached.sh":
    content => template('memcached/env.sh.erb'),
    require => File[$github::config::envdir]
  }
}
