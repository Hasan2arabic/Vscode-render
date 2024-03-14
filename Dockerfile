# Use the official Visual Studio Code Server image
FROM codercom/code-server:latest

# Set the user as root with the custom name
USER root

# Expose the default port used by Visual Studio Code Server
EXPOSE 8080

# Set a password for authentication
ENV PASSWORD="1"

# Copy any additional extensions or settings you want to include
# For example, if you have a list of extensions in a file called extensions.txt:
# COPY extensions.txt /home/coder/extensions.txt
# RUN cat /home/coder/extensions.txt | xargs -n 1 code-server --install-extension

# Start Visual Studio Code Server on container startup with password protection
ENTRYPOINT ["dumb-init", "code-server", "--bind-addr", "0.0.0.0:8080", ".", "--auth", "password"]
