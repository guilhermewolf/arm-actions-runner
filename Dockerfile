ARG RUNNER_VERSION=2.320.0
FROM ghcr.io/actions/actions-runner:${RUNNER_VERSION}

# Switch to root user to install packages
USER root

# Install unzip, Node.js, and any other necessary packages
RUN apt-get update && \
    apt-get install -y unzip curl && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the default user
USER runner
