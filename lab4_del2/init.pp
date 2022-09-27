# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include gossinbackup
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
