# = Class: hhvm
#
# This is the main hhvm class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, hhvm class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $hhvm_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, hhvm main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $hhvm_source
#
# [*source_dir*]
#   If defined, the whole hhvm configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $hhvm_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $hhvm_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, hhvm main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $hhvm_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $hhvm_options
#
# [*service_autorestart*]
#   Automatically restarts the hhvm service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $hhvm_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $hhvm_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $hhvm_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $hhvm_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for hhvm checks
#   Can be defined also by the (top scope) variables $hhvm_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $hhvm_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $hhvm_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $hhvm_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $hhvm_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for hhvm port(s)
#   Can be defined also by the (top scope) variables $hhvm_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling hhvm. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $hhvm_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $hhvm_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $hhvm_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $hhvm_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in hhvm::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of hhvm package
#
# [*service*]
#   The name of hhvm service
#
# [*service_status*]
#   If the hhvm service init script supports status argument
#
# [*process*]
#   The name of hhvm process
#
# [*process_args*]
#   The name of hhvm arguments. Used by puppi and monitor.
#   Used only in case the hhvm process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user hhvm runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $hhvm_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $hhvm_protocol
#
#
# See README for usage patterns.
#

class hhvm (
  $use_hhvm_repo         = params_lookup( 'use_hhvm_repo' ),
  $config_php_ini_file   = params_lookup( 'config_php_ini_file' ),
  $source_php_ini_file   = params_lookup( 'source_php_ini_file' ),
  $template_php_ini_file = params_lookup( 'template_php_ini_file' ),
  $socket                = params_lookup( 'socket' ),
  $socket_file           = params_lookup( 'socket_file' ),
  $config_dir_extensions = params_lookup( 'config_dir_extensions' ),
  $template_extensions   = params_lookup( 'template_extensions' ),
  $module_prefix         = params_lookup( 'module_prefix'),
  $my_class              = params_lookup( 'my_class' ),
  $source                = params_lookup( 'source' ),
  $source_dir            = params_lookup( 'source_dir' ),
  $source_dir_purge      = params_lookup( 'source_dir_purge' ),
  $template              = params_lookup( 'template' ),
  $service_autorestart   = params_lookup( 'service_autorestart' , 'global' ),
  $options               = params_lookup( 'options' ),
  $version               = params_lookup( 'version' ),
  $absent                = params_lookup( 'absent' ),
  $disable               = params_lookup( 'disable' ),
  $disableboot           = params_lookup( 'disableboot' ),
  $monitor               = params_lookup( 'monitor' , 'global' ),
  $monitor_tool          = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target        = params_lookup( 'monitor_target' , 'global' ),
  $puppi                 = params_lookup( 'puppi' , 'global' ),
  $puppi_helper          = params_lookup( 'puppi_helper' , 'global' ),
  $firewall              = params_lookup( 'firewall' , 'global' ),
  $firewall_tool         = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src          = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst          = params_lookup( 'firewall_dst' , 'global' ),
  $debug                 = params_lookup( 'debug' , 'global' ),
  $audit_only            = params_lookup( 'audit_only' , 'global' ),
  $noops                 = params_lookup( 'noops' ),
  $package               = params_lookup( 'package' ),
  $service               = params_lookup( 'service' ),
  $service_status        = params_lookup( 'service_status' ),
  $process               = params_lookup( 'process' ),
  $process_args          = params_lookup( 'process_args' ),
  $process_user          = params_lookup( 'process_user' ),
  $config_dir            = params_lookup( 'config_dir' ),
  $config_file           = params_lookup( 'config_file' ),
  $config_file_mode      = params_lookup( 'config_file_mode' ),
  $config_file_owner     = params_lookup( 'config_file_owner' ),
  $config_file_group     = params_lookup( 'config_file_group' ),
  $config_file_init      = params_lookup( 'config_file_init' ),
  $pid_file              = params_lookup( 'pid_file' ),
  $data_dir              = params_lookup( 'data_dir' ),
  $log_dir               = params_lookup( 'log_dir' ),
  $log_file              = params_lookup( 'log_file' ),
  $port                  = params_lookup( 'port' ),
  $protocol              = params_lookup( 'protocol' )
  ) inherits hhvm::params {

  $bool_socket=any2bool($socket)
  $bool_use_hhvm_repo=any2bool($use_hhvm_repo)
  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)
  $bool_noops=any2bool($noops)

  ### Definition of some variables used in the module
  $manage_package = $hhvm::bool_absent ? {
    true  => 'absent',
    false => $hhvm::version,
  }

  $manage_service_enable = $hhvm::bool_disableboot ? {
    true    => false,
    default => $hhvm::bool_disable ? {
      true    => false,
      default => $hhvm::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $hhvm::bool_disable ? {
    true    => 'stopped',
    default =>  $hhvm::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $hhvm::bool_service_autorestart ? {
    true    => Service[hhvm],
    false   => undef,
  }

  $manage_port = $hhvm::bool_socket ? {
    true  => 'socket',
    false => $hhvm::port,
  }

  $manage_monitor_target = $hhvm::bool_socket ? {
    true  => $hhvm::socket_file,
    false => $hhvm::port,
  }

  $manage_file = $hhvm::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $hhvm::bool_absent == true
  or $hhvm::bool_disable == true
  or $hhvm::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $hhvm::bool_absent == true
  or $hhvm::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $hhvm::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $hhvm::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $hhvm::source ? {
    ''        => undef,
    default   => $hhvm::source,
  }

  $manage_file_content = $hhvm::template ? {
    ''        => undef,
    default   => template($hhvm::template),
  }

  $manage_php_ini_file_source = $hhvm::source_php_ini ? {
    ''        => undef,
    default   => $hhvm::source_php_ini,
  }

  $manage_php_ini_file_content = $hhvm::template_php_ini ? {
    ''        => undef,
    default   => template($hhvm::template_php_ini),
  }

  ### Managed resources
  if $hhvm::bool_use_hhvm_repo == true {
    require hhvm::prerequisites
  }

  package { $hhvm::package:
    ensure  => $hhvm::manage_package,
    noop    => $hhvm::bool_noops,
  }

  service { 'hhvm':
    ensure     => $hhvm::manage_service_ensure,
    name       => $hhvm::service,
    enable     => $hhvm::manage_service_enable,
    hasstatus  => $hhvm::service_status,
    pattern    => $hhvm::process,
    require    => Package[$hhvm::package],
    noop       => $hhvm::bool_noops,
  }

  file { 'hhvm.conf':
    ensure  => $hhvm::manage_file,
    path    => $hhvm::config_file,
    mode    => $hhvm::config_file_mode,
    owner   => $hhvm::config_file_owner,
    group   => $hhvm::config_file_group,
    require => Package[$hhvm::package],
    notify  => $hhvm::manage_service_autorestart,
    source  => $hhvm::manage_file_source,
    content => $hhvm::manage_file_content,
    replace => $hhvm::manage_file_replace,
    audit   => $hhvm::manage_audit,
    noop    => $hhvm::bool_noops,
  }

  file { 'php.ini':
    ensure  => $hhvm::manage_file,
    path    => $hhvm::config_php_ini_file,
    mode    => $hhvm::config_file_mode,
    owner   => $hhvm::config_file_owner,
    group   => $hhvm::config_file_group,
    require => Package[$hhvm::package],
    notify  => $hhvm::manage_service_autorestart,
    source  => $hhvm::manage_php_ini_file_source,
    content => $hhvm::manage_php_ini_file_content,
    replace => $hhvm::manage_file_replace,
    audit   => $hhvm::manage_audit,
    noop    => $hhvm::bool_noops,
  }

  # The whole hhvm configuration directory can be recursively overriden
  if $hhvm::source_dir {
    file { 'hhvm.dir':
      ensure  => directory,
      path    => $hhvm::config_dir,
      require => Package[$hhvm::package],
      notify  => $hhvm::manage_service_autorestart,
      source  => $hhvm::source_dir,
      recurse => true,
      purge   => $hhvm::bool_source_dir_purge,
      force   => $hhvm::bool_source_dir_purge,
      replace => $hhvm::manage_file_replace,
      audit   => $hhvm::manage_audit,
      noop    => $hhvm::bool_noops,
    }
  }

  ### Include custom class if $my_class is set
  if $hhvm::my_class {
    include $hhvm::my_class
  }

  ### Provide puppi data, if enabled ( puppi => true )
  if $hhvm::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'hhvm':
      ensure    => $hhvm::manage_file,
      variables => $classvars,
      helper    => $hhvm::puppi_helper,
      noop      => $hhvm::bool_noops,
    }
  }

  ### Service monitoring, if enabled ( monitor => true )
  if $hhvm::bool_monitor == true {
    if $hhvm::port != '' {
      monitor::port { "hhvm_${hhvm::protocol}_${hhvm::manage_port}":
        protocol => $hhvm::protocol,
        port     => $hhvm::port,
        target   => $hhvm::manage_monitor_target,
        tool     => $hhvm::monitor_tool,
        enable   => $hhvm::manage_monitor,
        noop     => $hhvm::bool_noops,
      }
    }
    if $hhvm::service != '' {
      monitor::process { 'hhvm_process':
        process  => $hhvm::process,
        service  => $hhvm::service,
        pidfile  => $hhvm::pid_file,
        user     => $hhvm::process_user,
        argument => $hhvm::process_args,
        tool     => $hhvm::monitor_tool,
        enable   => $hhvm::manage_monitor,
        noop     => $hhvm::bool_noops,
      }
    }
  }

  ### Firewall management, if enabled ( firewall => true )
  if $hhvm::bool_firewall == true and $hhvm::port != '' and $hhvm::socket_file == '' {
    firewall { "hhvm_${hhvm::protocol}_${hhvm::port}":
      source      => $hhvm::firewall_src,
      destination => $hhvm::firewall_dst,
      protocol    => $hhvm::protocol,
      port        => $hhvm::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $hhvm::firewall_tool,
      enable      => $hhvm::manage_firewall,
      noop        => $hhvm::bool_noops,
    }
  }

  ### Debugging, if enabled ( debug => true )
  if $hhvm::bool_debug == true {
    file { 'debug_hhvm':
      ensure  => $hhvm::manage_file,
      path    => "${settings::vardir}/debug-hhvm",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $hhvm::bool_noops,
    }
  }

}
