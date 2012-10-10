# Class: oabjava
#
# This module manages oabjava
#
# Parameters:
# 		java7 			- Build Java 7 packages instead of Java 6 (the default)
#		clean_old_pkgs	- Clean out previously existing Java packages from the apt cache
#		skip_if_built	- Skip building packages if they already exist
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This file is part of the oabjava Puppet module.
# [Remember: No empty lines between comments and class definition]
class oabjava (
	$java7			= false,
	$clean_old_pkgs	= false,
	$skip_if_built	= true
){


}
