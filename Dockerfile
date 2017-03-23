FROM indec/node-oracle

LABEL Description="Node LTS with Oracle client and Ruby installed for scss_lint"

# Ruby installation
RUN mkdir /tmp/ruby
RUN cd /tmp/ruby && curl --silent ftp://ftp.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz | tar xz
RUN cd /tmp/ruby/ruby-2.4.0 && ./configure --disable-install-rdoc && make install

RUN gem install scss_lint
