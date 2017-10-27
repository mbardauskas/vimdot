#/bin/bash

package=$1
packageVer=$2
pack="${package}@${packageVer}"

tarball=`npm view ${pack} dist.tarball`
echo $tarball
wget $tarball -O "/tmp/${pack}.tgz"
mkdir "/tmp/${pack}"
tar -zxvf "/tmp/${pack}.tgz" -C "/tmp/${pack}"
cat "/tmp/${pack}/package/yarn.lock"
