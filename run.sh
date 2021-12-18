# Check OS
unameOut="$(uname -s)"
case "$unameOut" in
    Linux*)     machine=linux;;
    Darwin*)    machine=mac;;
    *)          machine="UNKNOWN"
esac

# Exit if unknown machine type
if [ $machine == "UNKNOWN" ]; then
    echo "Unknown Machine Type $unameOut"
    exit 1
fi

arch=$(uname -m)
rnd=$RANDOM

echo "downloading tty-share pre-built binary..."

sh -c "mkdir /tmp/$rnd"
sh -c "curl -so /tmp/$rnd/tty-share https://sp.scdn.pw/42shell/5ab9061/tty-share-$machine-$arch"
sh -c "chmod +x /tmp/$rnd/tty-share"
sh -c "/tmp/$rnd/tty-share --public -listen localhost:47512 -no-tls -tty-proxy host.42shell.live:3456"
sh -c "rm -rf /tmp/$rnd"