class memcached::params {

  case $::operatingsystem {
    Darwin: {

      include boxen::config
      include homebrew

      $ensure     = present

      $package    = 'boxen/brews/memcached'
      $version    = '1.4.13-boxen1'

      $datadir    = "${boxen::config::datadir}/memcached"
      $executable = "${boxen::config::homebrewdir}/bin/memcached"
      $logdir     = "${boxen::config::logdir}/memcached"
      $host       = '127.0.0.1'
      $port       = 21211
      $user       = $::boxen_user

      $enable     = true

    }

    default: {
      fail("Unsupported operating system")
    }
  }

}
