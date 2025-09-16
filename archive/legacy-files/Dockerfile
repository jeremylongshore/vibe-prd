FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    make \
    git \
    bash \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files
COPY . /app

# Add setup scripts to PATH
ENV PATH="/app/setup-scripts:${PATH}"

# Set default command
CMD ["make", "help"]