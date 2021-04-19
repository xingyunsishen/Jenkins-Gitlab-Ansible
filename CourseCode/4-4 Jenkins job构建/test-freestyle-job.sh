#!/bin/sh

export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

# Print env variable
echo "[INFO] Print env variable"
echo "Current deployment envrionment is $deploy_env" >> test.properties
echo "THe build is $version" >> test.properties
echo "[INFO] Done..."

# Check test properties
echo "[INFO] Check test properties"
if [ -s test.properties ]
then
  cat test.properties
  echo "[INFO] Done..."
else
  echo "test.properties is empty"
fi

echo "[INFO] Build finished..."