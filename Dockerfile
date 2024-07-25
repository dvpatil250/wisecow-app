FROM ubuntu:24.04

# Install necessary packages
RUN apt-get update && \
apt-get install -y fortune cowsay netcat-openbsd && \
apt-get clean

# Add /usr/games to PATH where fortune and cowsay might be located
ENV PATH="/usr/games:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Set the working directory
WORKDIR /usr/src/app

# Copy the script to the container
COPY wisecow.sh .

# Ensure script is executable
RUN chmod +x wisecow.sh

# Expose port
EXPOSE 4499

# Command to run the script
CMD ["./wisecow.sh"]
