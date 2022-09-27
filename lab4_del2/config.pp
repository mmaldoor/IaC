# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include gossinbackup::config
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
