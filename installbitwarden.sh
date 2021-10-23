#! /bin/sh
echo "starting you dumbfuck"
curl https://sh.rustup.rs -sSf | sh
echo 'export PATH=~/.cargo/bin:$PATH' >> ~/.bashrc
export PATH=~/.cargo/bin:$PATH 
which rustc
/home/bitwarden/.cargo/bin/cargo
wget https://nodejs.org/dist/latest-v9.x/node-v9.11.2-linux-x64.tar.xz
tar -xvf node-v9.11.2-linux-x64.xz
sudo mv node-v9.11.2-linux-x64 /opt/
sudo ln -sf /opt/node-v9.11.2-linux-x64 /opt/node
echo 'export PATH=/opt/node/bin:$PATH' >> ~/.bashrc
export PATH=/opt/node/bin:$PATH
which npm
/opt/node/bin/npm
git clone https://github.com/dani-garcia/bitwarden_rs && pushd bitwarden_rs 
cargo clean && cargo build --features sqlite --release
file target/release/bitwarden_rs 
target/release/bitwarden_rs: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked
pushd target/release/
git clone git clone https://github.com/bitwarden/web.git web-vault.git && cd web-vault.git
git checkout v2.11
git apply v2.11.0.patch
npm run sub:init && npm install && npm run dist
./bitwarden_rs
