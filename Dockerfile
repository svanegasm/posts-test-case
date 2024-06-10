FROM ruby:3.1.1-alpine3.15

# Instalar dependencias del sistema
RUN apk add --update build-base bash bash-completion libffi-dev tzdata postgresql-client postgresql-dev nodejs npm yarn git

# Establecer directorio de trabajo
WORKDIR /app

# Copiar Gemfile y Gemfile.lock
COPY Gemfile* /app/

# Instalar bundler y las gemas
RUN gem install bundler
RUN bundle install

# Copiar el resto de la aplicación
COPY . /app

# Precompilar Assets
RUN bundle exec rails assets:precompile

# Configurar alias en el .bashrc
RUN touch $HOME/.bashrc
RUN echo "alias ll='ls -alF'" >> $HOME/.bashrc
RUN echo "alias la='ls -A'" >> $HOME/.bashrc
RUN echo "alias l='ls -CF'" >> $HOME/.bashrc
RUN echo "alias q='exit'" >> $HOME/.bashrc
RUN echo "alias c='clear'" >> $HOME/.bashrc

# Configurar el comando por defecto
CMD [ "/bin/bash" ]