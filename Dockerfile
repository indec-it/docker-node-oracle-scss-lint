FROM collinestes/docker-node-oracle

LABEL Description="Node LTS with Oracle client and Ruby installed for scss_lint"

# Required for Yarn installation
RUN apt-get update && apt-get install -y apt-transport-https

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn

# Ruby installation
RUN mkdir /tmp/ruby
RUN cd /tmp/ruby && curl --silent ftp://ftp.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz | tar xz
RUN cd /tmp/ruby/ruby-2.4.0 && ./configure --disable-install-rdoc && make install

RUN gem install scss_lint
