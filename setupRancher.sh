#!/bin/bash

# Create a directory named "rancher" if it doesn't exist
mkdir -p rancher

# Change the current working directory to the "rancher" directory
cd rancher

# Create a directory named "volume" inside the "rancher" directory
mkdir volume

# Print the current working directory
pwd

# Change back to the previous directory
cd ..

# Change back to the previous directory again
cd ..

# Run the Docker command to start Rancher
sudo docker run --privileged -d --name rancher -v /home/jmwong/rancher/volume:/var/lib/rancher --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher

echo "Rancher setup complete."
echo "sudo docker ps"
echo "sudo docker logs CONTAINER-ID 2>&1 | grep "Bootstrap Password"
