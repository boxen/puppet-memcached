# Memcached Puppet Module for Boxen

Requires the following boxen modules:

* [boxen](https://github.com/boxen/puppet-boxen)

## Usage

```puppet
include memcached
```

### Environment

Once installed, you can access the following variables in your environment, projects, etc:

* BOXEN_MEMCACHED_PORT: the configured memcached port
* BOXEN_MEMCACHED_URL: the URL for memcached, including localhost & port

#### Rails with Dalli

For Rails development with the [dalli](https://github.com/mperham/dalli) client, add to `config/environments/development.rb`:

    config.cache_store = :dalli_store, "localhost:#{ENV['BOXEN_MEMCACHED_PORT'] || 11211}"
