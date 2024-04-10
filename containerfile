# Use Debian Slim as the base image
FROM debian:stable-slim

# Avoid frontend dialog
ENV DEBIAN_FRONTEND=noninteractive

# Install required system dependencies
RUN apt-get update && apt-get install --assume-yes --no-install-recommends \
 curl \
 sudo \
 xz-utils \
 bzip2 \
 ca-certificates \
 --no-install-recommends && \
 rm -rf /var/lib/apt/lists/*

# Add a non-root user for Nix multi-user installation
RUN adduser --disabled-password --gecos '' nixuser 
USER nixuser
# && \
#  adduser nixuser sudo && \
#  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER root
# Install Nix in multi-user mode
RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon

# Switch to nixuser to perform Nix operations

# Activate the Nix environment and install packages via flakes
RUN . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh


USER nixuser
# && \
# RUN nix-env -iA nixpkgs.git nixpkgs.git-lfs nixpkgs.starship

# Switch back to a dialog frontend
ENV DEBIAN_FRONTEND=dialog


# Copy the flake.nix and nix.conf to the container with correct permissions
COPY . /home/nixuser/
# COPY --chown=nixuser:nixuser .config/nix/nix.conf /home/nixuser/.config/nix/nix.conf
WORKDIR /home/nixuser

# Set the default shell to bash and start it
CMD ["bash"]


# # Use Debian Slim as the base image
# FROM debian:stable-slim

# # Avoid frontend dialog
# ENV DEBIAN_FRONTEND=noninteractive

# # Install required system dependencies
# RUN apt-get update && apt-get install -y \
#  curl \
#  sudo \
#  xz-utils \
#  bzip2 \
#  ca-certificates \
#  --no-install-recommends && \
#  rm -rf /var/lib/apt/lists/*

# # Add a non-root user for Nix multi-user installation
# RUN adduser --disabled-password --gecos '' nixuser && \
#  adduser nixuser sudo && \
#  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# # Install Nix in multi-user mode
# RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon

# # Prepare the environment for Nix Flakes
# RUN mkdir -p /etc/nix && echo 'experimental-features = nix-command flakes' > /etc/nix/nix.conf

# # Copy the flake.nix to the container and ensure the directory and file have the correct permissions
# COPY --chown=nixuser:nixuser flake.nix /home/nixuser/flake.nix
# COPY --chown=nixuser:nixuser .config/nix/nix.conf /home/nixuser/.config/nix/nix.conf
# # Switch to nixuser to perform Nix operations
# USER nixuser
# WORKDIR /home/nixuser

# # Setup starship for the nixuser
# RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc

# # Switch back to a dialog frontend
# ENV DEBIAN_FRONTEND=dialog

# # Set the default shell to bash and start it
# CMD ["bash"]


#------

# # Start from Debian Slim
# FROM debian:stable-slim

# ENV DEBIAN_FRONTEND=noninteractive

# # Install dependencies required for Nix
# RUN apt-get update && apt-get install -y \
#  curl \
#  sudo \
#  xz-utils \
#  bzip2 \
#  ca-certificates \
#  --no-install-recommends && \
#  rm -rf /var/lib/apt/lists/*

# # Add a user 'nixuser' with sudo privileges
# RUN adduser --disabled-password --gecos '' nixuser && \
#  adduser nixuser sudo && \
#  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# # Switch to nixuser
# USER nixuser
# WORKDIR /home/nixuser

# # Install Nix in multi-user mode
# RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon

# # Enable Flakes as nixuser
# RUN echo 'experimental-features = nix-command flakes' >> ~/.config/nix/nix.conf

# # Switch back to root to perform operations that require elevated permissions
# USER root

# # Copy the flake.nix file and adjust permissions accordingly
# COPY --chown=nixuser:nixuser flake.nix /home/nixuser/flake.nix

# # Switch to nixuser to install packages using the flake
# USER nixuser

# # Use the flake to install packages - Ensure Nix profile is sourced
# RUN . /home/nixuser/.nix-profile/etc/profile.d/nix.sh && \
#  nix-env -iA nixpkgs.git nixpkgs.git-lfs nixpkgs.starship

# # Setup starship prompt for nixuser
# RUN echo 'eval "$(starship init bash)"' >> ~/.bashrc

# # Switch back to noninteractive for CMD/ENTRYPOINT
# ENV DEBIAN_FRONTEND=

# # Set the default shell to bash
# SHELL ["/bin/bash", "-c"]

# CMD ["bash"]

# # Start from Debian Slim
# FROM debian:stable-slim

# ENV DEBIAN_FRONTEND=noninteractive

# # Install dependencies required for Nix
# RUN apt-get update && apt-get install -y \
#  curl \
#  sudo \
#  xz-utils \
#  bzip2 \
#  ca-certificates \
#  --no-install-recommends && \
#  rm -rf /var/lib/apt/lists/*

# # Add a user 'nixuser' with sudo privileges
# RUN adduser --disabled-password --gecos '' nixuser && \
#  adduser nixuser sudo && \
#  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# # Switch to nixuser
# USER nixuser
# WORKDIR /home/nixuser

# # Install Nix in multi-user mode
# RUN curl -L https://nixos.org/nix/install | sh -s -- --daemon

# # Enable Flakes
# USER root
# RUN . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && \
#  nix-env -iA nixpkgs.nixFlakes && \
#  mkdir -p /home/nixuser/.config/nix && \
#  echo 'experimental-features = nix-command flakes' >> /home/nixuser/.config/nix/nix.conf

# # Copy the flake.nix file
# COPY flake.nix /home/nixuser/flake.nix
# RUN chown nixuser:nixuser /home/nixuser/flake.nix

# # Use the flake to install packages
# USER nixuser
# RUN . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh && \
#  nix build /home/nixuser/#devShells.default && \
#  echo 'source /home/nixuser/.nix-profile/etc/profile.d/nix.sh' >> ~/.bashrc && \
#  echo 'eval "$(starship init bash)"' >> ~/.bashrc

# # Switch back to noninteractive for CMD/ENTRYPOINT
# ENV DEBIAN_FRONTEND=

# # Set the default shell to bash
# SHELL ["/bin/bash", "-c"]

# CMD ["bash"]
