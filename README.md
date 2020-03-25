# Basic Asterisk Dockerfile

This repository contains a basic asterisk set-up within Docker. The image is based on Alpine 3.11.3.

## Usage

 - Make sure you've installed Docker
 - Clone this repository to a place of choice
 - Edit the configuration files.
 - Build the image according to the Dockerfile with:
   `docker build -t asterisk .` (include the dot)
 - Run the image in a _Docker container_:

   ```sh
   docker run --rm \
           --mount type=bind,source="$(pwd)"/configuration/sip.conf,target=/etc/asterisk/sip.conf,readonly \
           --mount type=bind,source="$(pwd)"/configuration/extensions.conf,target=/etc/asterisk/extensions.conf,readonly \
           --network host \
           -it asterisk
   ```

 - That's it.
