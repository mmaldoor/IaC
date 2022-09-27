# Creating a module

## Resources
[The lab git](https://gitlab.stud.idi.ntnu.no/jhklemet/iikg3005-labs/-/blob/master/lab4-2.md)


-------------------

<br>

## Installing configurations

### Installing pdk

    sudo apt install pdk


### Installing modules and classes 
    #install module
    pdk new module gossinbackup

    #install classes
    pdk new module gossinbackup
    pdk new module gossinbackup:install
    pdk new module gossinbackup:config



### Init

        class gossinbackup (
        String $source_directory,
        String $destination_directory,
        String $exclude,
        String $days,
        String $months,
        String $years,
        String $max_file_size,
        String $exec_hours,
        String $exec_minutes
        ) {
        contain gossinbackup::install
        contain gossinbackup::config

        Class['gossinbackup::install']
        -> Class['gossinbackup::config']
        }



### Install class

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

### Config class

    class gossinbackup::config {
    cron { 'gossinbackup' :
        ensure  => present,
        command => '/opt/gossin-backup/gossin-backup',
        user    => root,
        hour    => $gossinbackup::exec_hours,
        minute  => $gossinbackup::exec_minutes,
    }
    $defaults = { 'path' => '/opt/gossin-backup/gossin-backup.conf' }
    $example = { 'Linux' => {
        'source' => $gossinbackup::source_directory,
        'basedest' => $gossinbackup::destination_directory,
        'exclude' => $gossinbackup::exclude,
        'days' => $gossinbackup::days,
        'months' => $gossinbackup::months,
        'years' => $gossinbackup::years,
        'max_file_size' => $gossinbackup::max_file_size,
    } }
    inifile::create_ini_settings($example, $defaults)
    }


### common defaults


    ---

    gossinbackup::exclude: '/opt/gossin-backup/rsyncexcludes'
    gossinbackup::days:    '7'
    gossinbackup::months:    '12'
    gossinbackup::years: '3'
    gossinbackup::max_file_size: '100M'
    gossinbackup::exec_hours:    '2'
    gossinbackup::exec_minutes:    '15'
