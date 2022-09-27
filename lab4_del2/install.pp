# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include gossinbackup::install
class gossinbackup::install {
  vcsrepo { '/opt/gossin-backup':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/githubgossin/gossin-backup',
  }

  $enhancers = ['crudini', 'rsync', 'git']

  package {
    $enhancers:
      ensure => 'installed',
  }

  file { '/backups':
    ensure => directory,
  }
}
