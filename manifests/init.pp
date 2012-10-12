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
class oabjava (
	$java7			= false,
	$clean_old_pkgs	= false,
	$skip_if_built	= true,
	$gpg_key		= false,
	$update			= false
){

	require Class['git']

	case $operatingsystem {
		/^(Debian|Ubuntu)$/:{
			include oabjava::params
			class{'oabjava::install':
				update	=> $update,
			} 
			class{'oabjava::run':
				java7 			=> $java7,
				clean_old_pkgs 	=> $clean_old_pkgs,
				skip_if_built 	=> $skip_if_built,
				gpg_key 		=> $gpg_key,
			}
		}
		default:{
			warning("The oabjava Puppet module is not configured for ${operatingsystem} on ${fqdn}.")
		}
	}


}
