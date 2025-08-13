FROM ubuntu:22.04


# Create a simple shell script
RUN echo '#!/bin/sh' > /hello_world.sh && \
    echo 'echo "Hello, World! This is a Docker test."' >> /hello_world.sh && \
    chmod +x /hello_world.sh

# Run the script when the container starts
CMD ["/hello_world.sh"]