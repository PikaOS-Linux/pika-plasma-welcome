# Add dependent repositories
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
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
