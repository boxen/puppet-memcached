class memcached::config($port) {
  require boxen::config

  $datadir    = "${boxen::config::datadir}/memcached"
  $executable = "${boxen::config::homebrewdir}/bin/memcached"
  $logdir     = "${boxen::config::logdir}/memcached"
  $logfile    = "${logdir}/console.log"
}
