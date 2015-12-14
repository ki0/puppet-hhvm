# Class: hhvm::params
#
# This class defines default parameters used by the main module class hhvm
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to hhvm class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class hhvm::params {

  ### Application related parameters

  $package = $::operatingsystem ? {
    default => 'hhvm',
  }

  $service = $::operatingsystem ? {
    default => 'hhvm',
  }

  $service_status = $::operatingsystem ? {
    default => true,
  }

  $process = $::operatingsystem ? {
    default => 'hhvm',
  }

  $process_args = $::operatingsystem ? {
    default => '',
  }

  $process_user = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'www-data',
    default                   => 'hhvm',
  }

  $config_dir = $::operatingsystem ? {
    default => '/etc/hhvm',
  }

  $config_dir_extensions = $::operatingsystem ? {
    default => '/usr/share/hhvm/extensions',
  }

  $config_file = $::operatingsystem ? {
    default => '/etc/hhvm/server.ini',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0644',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/hhvm',
    default                   => '/etc/sysconfig/hhvm',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/hhvm/pid',
  }

  $data_dir = $::operatingsystem ? {
    default => '/var/lib/hhvm',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/hhvm',
  }

  $log_file = $::operatingsystem ? {
    default => '/var/log/hhvm/hhvm.log',
  }

  $config_php_ini_file = $::operatingsystem ? {
    default => '/etc/hhvm/php.ini',
  }

  $module_prefix = $::operatingsystem ? {
    default => 'hhvm-'
  }

  $repo_central_path = $::operatingsystem ? {
    default => '/var/run/hhvm/hhvm.hhbc'
  }

  $socket = false
  $socket_file = '/var/run/hhvm/socket'

  $use_hhvm_repo = false

  $port = '9000'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_php_ini_file = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = 'hhvm/server.ini.erb'
  $template_php_ini_file = ''
  $template_extensions = 'hhvm/concat_ini_extensions.erb'
  $template_ini_header = 'hhvm/concat_ini_header.erb'
  $template_ini_footer = 'hhvm/concat_ini_footer.erb'
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $monitor_checksource = ''
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false
  $noops = false

}
