FROM ruby:2.7-slim-buster

RUN apt-get update -qq && apt-get install -yy curl wget

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get update && apt-get install -qq -y nodejs build-essential \
    libxml2-dev libxslt1-dev libqtwebkit4 libqt4-dev xvfb wait-for-it \
    libpq-dev --fix-missing --no-install-recommends \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# install latest bundler
RUN gem install bundler
RUN npm install yarn -g

# Create app directory
WORKDIR /relaton.org

# Set bundle path
ENV BUNDLE_PATH /bundle

# Copy the application
COPY . .


CMD ["./entrypoint.sh"]
