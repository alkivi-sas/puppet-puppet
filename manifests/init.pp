class puppet (
  $certname,
  $environment  = 'production',
  $server       = 'puppet.alkivi.fr',
  $parser       = 'future',
) {

  # declare all parameterized classes
  class { puppet::params: }
  class { puppet::install: }
  class { puppet::config: }
  class { puppet::service: }

  # declare relationships
  Class['puppet::params'] -> 
  Class['puppet::install'] -> 
  Class['puppet::config'] -> 
  Class['puppet::service']
}

