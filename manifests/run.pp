# Class: oabjava
#
# This module manages the basic oabjava install and does the sanity checking
# and any pre-installation actions or checks.
#
# Parameters:
# 		java7 			- Build Java 7 packages instead of Java 6 (the default)
#		clean_old_pkgs	- Clean out previously existing Java packages from the apt cache
#		skip_if_built	- Skip building packages if they already exist
#		gpg_key			- Sets the GPG key of the local repo unless false
#
# Actions:
#
# Requires:
#		git				- Requires the nesi/git Puppet module
#
# Sample Usage:
#
# This file is part of the oabjava Puppet module.
# [Remember: No empty lines between comments and class definition]
class oabjava::run(
	$java7,
	$clean_old_pkgs,
	$skip_if_built,
	$gpg_key
){

	include oabjava::params

	$option_7 = $java7 ? {
		false 	=> '',
		default	=> ' -7',
	}

	$option_clean = $clean_old_pkgs ? {
		false	=> '',
		default => ' -c'
	}

	$option_skip = $skip_if_built ? {
		false	=> '',
		default	=> ' -s',
	}

	$option_key = $gpg_key ? {
		false	=> '',
		default => " -k ${gpg_key}",
	}

	$command_options = "${option_7}${option_clean}${option_skip}${option_key}"

	$oabjava_command = "${oabjava::params::exec_bin}${command_options}"

	exec{'run_oabjava':
		command => $oabjava_command,
		creates => $oabjava::params::work_path
		require => File[$oabjava::params::exec_bin],
	}
}