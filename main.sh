# Clone Upstream
mkdir -p ./pika-plasma-welcome
cp -rvf ./debian ./pika-plasma-welcome/
cp -rvf ./usr ./pika-plasma-welcome/
cp -rvf ./etc ./pika-plasma-welcome/
cd ./pika-plasma-welcome

# Get build deps
apt-get build-dep ./ -y

# Build package
dh_make --createorig
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
