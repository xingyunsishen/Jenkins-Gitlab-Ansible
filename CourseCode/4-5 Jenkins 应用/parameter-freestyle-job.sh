#!/bin/sh

echo "Current deploy environment is $deploy_env"
echo "The build is $version"
echo "The paasword is $pass"

if $bool
then
	echo "Request is approved"
else
	echo "Request is rejected"
fi