function docker-setup
    colima start \
    --profile default \
    --activate \
    --arch aarch64 \
    --cpu 10 \
    --disk 48 \
    --memory 24 \
    --mount $HOME:w \
    --mount-inotify \
    --ssh-agent \
    --vm-type vz \
    --vz-rosetta \
    --verbose
end