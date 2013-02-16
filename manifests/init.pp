# = Class: autofs
#
# This is the main autofs class
#
#
# == Parameters
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, autofs class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $autofs_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, autofs main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $autofs_source
#
# [*source_dir*]
#   If defined, the whole autofs configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $autofs_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $autofs_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, autofs main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $autofs_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $autofs_options
#
# [*service_autorestart*]
#   Automatically restarts the autofs service when there is a change in
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
#   Can be defined also by the (top scope) variable $autofs_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $autofs_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $autofs_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $autofs_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for autofs checks
#   Can be defined also by the (top scope) variables $autofs_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $autofs_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $autofs_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $autofs_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $autofs_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for autofs port(s)
#   Can be defined also by the (top scope) variables $autofs_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling autofs. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $autofs_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $autofs_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $autofs_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $autofs_audit_only
#   and $audit_only
#
# [*noops*]
#   Set noop metaparameter to true for all the resources managed by the module.
#   Basically you can run a dryrun for this specific module if you set
#   this to true. Default: false
#
# Default class params - As defined in autofs::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of autofs package
#
# [*service*]
#   The name of autofs service
#
# [*service_status*]
#   If the autofs service init script supports status argument
#
# [*process*]
#   The name of autofs process
#
# [*process_args*]
#   The name of autofs arguments. Used by puppi and monitor.
#   Used only in case the autofs process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user autofs runs with. Used by puppi and monitor.
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
#   Can be defined also by the (top scope) variable $autofs_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $autofs_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include autofs"
# - Call autofs as a parametrized class
#
# See README for details.
#
#
# == Author
#   Alessandro Franceschi <al@lab42.it/>
#
class autofs (
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $noops               = params_lookup( 'noops' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits autofs::params {

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
  $manage_package = $autofs::bool_absent ? {
    true  => 'absent',
    false => $autofs::version,
  }

  $manage_service_enable = $autofs::bool_disableboot ? {
    true    => false,
    default => $autofs::bool_disable ? {
      true    => false,
      default => $autofs::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $autofs::bool_disable ? {
    true    => 'stopped',
    default =>  $autofs::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $autofs::bool_service_autorestart ? {
    true    => Service[autofs],
    false   => undef,
  }

  $manage_file = $autofs::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $autofs::bool_absent == true
  or $autofs::bool_disable == true
  or $autofs::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $autofs::bool_absent == true
  or $autofs::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $autofs::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $autofs::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $autofs::source ? {
    ''        => undef,
    default   => $autofs::source,
  }

  $manage_file_content = $autofs::template ? {
    ''        => undef,
    default   => template($autofs::template),
  }

  ### Managed resources
  package { $autofs::package:
    ensure  => $autofs::manage_package,
    noop    => $autofs::bool_noops,
  }

  service { 'autofs':
    ensure     => $autofs::manage_service_ensure,
    name       => $autofs::service,
    enable     => $autofs::manage_service_enable,
    hasstatus  => $autofs::service_status,
    pattern    => $autofs::process,
    require    => Package[$autofs::package],
    noop       => $autofs::bool_noops,
  }

  file { 'autofs.conf':
    ensure  => $autofs::manage_file,
    path    => $autofs::config_file,
    mode    => $autofs::config_file_mode,
    owner   => $autofs::config_file_owner,
    group   => $autofs::config_file_group,
    require => Package[$autofs::package],
    notify  => $autofs::manage_service_autorestart,
    source  => $autofs::manage_file_source,
    content => $autofs::manage_file_content,
    replace => $autofs::manage_file_replace,
    audit   => $autofs::manage_audit,
    noop    => $autofs::bool_noops,
  }

  # The whole autofs configuration directory can be recursively overriden
  if $autofs::source_dir {
    file { 'autofs.dir':
      ensure  => directory,
      path    => $autofs::config_dir,
      require => Package[$autofs::package],
      notify  => $autofs::manage_service_autorestart,
      source  => $autofs::source_dir,
      recurse => true,
      purge   => $autofs::bool_source_dir_purge,
      force   => $autofs::bool_source_dir_purge,
      replace => $autofs::manage_file_replace,
      audit   => $autofs::manage_audit,
      noop    => $autofs::bool_noops,
    }
  }


  ### Include custom class if $my_class is set
  if $autofs::my_class {
    include $autofs::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $autofs::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'autofs':
      ensure    => $autofs::manage_file,
      variables => $classvars,
      helper    => $autofs::puppi_helper,
      noop      => $autofs::bool_noops,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $autofs::bool_monitor == true {
    if $autofs::port != '' {
      monitor::port { "autofs_${autofs::protocol}_${autofs::port}":
        protocol => $autofs::protocol,
        port     => $autofs::port,
        target   => $autofs::monitor_target,
        tool     => $autofs::monitor_tool,
        enable   => $autofs::manage_monitor,
        noop     => $autofs::bool_noops,
      }
    }
    if $autofs::service != '' {
      monitor::process { 'autofs_process':
        process  => $autofs::process,
        service  => $autofs::service,
        pidfile  => $autofs::pid_file,
        user     => $autofs::process_user,
        argument => $autofs::process_args,
        tool     => $autofs::monitor_tool,
        enable   => $autofs::manage_monitor,
        noop     => $autofs::bool_noops,
      }
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $autofs::bool_firewall == true and $autofs::port != '' {
    firewall { "autofs_${autofs::protocol}_${autofs::port}":
      source      => $autofs::firewall_src,
      destination => $autofs::firewall_dst,
      protocol    => $autofs::protocol,
      port        => $autofs::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $autofs::firewall_tool,
      enable      => $autofs::manage_firewall,
      noop        => $autofs::bool_noops,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $autofs::bool_debug == true {
    file { 'debug_autofs':
      ensure  => $autofs::manage_file,
      path    => "${settings::vardir}/debug-autofs",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
      noop    => $autofs::bool_noops,
    }
  }

}
