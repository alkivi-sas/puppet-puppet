class puppet::install () {
  package { $puppet::params::puppet_package_name:
    ensure => installed,
  }
}
