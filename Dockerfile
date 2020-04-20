#Local da imagem a ser usada
FROM wyveo/nginx-php-fpm:latest

#Diretório de trabalho
WORKDIR /usr/share/nginx

#Remover pasta html do nginx
RUN rm -rf /usr/share/nginx/html

#Copiar conteúdo do projeto para a pasta nginx do conainer
COPY . /usr/share/nginx

#Criar link simbólico da pasta html para a pasta public
RUN ln -fs public html

#Instalar o composer / mover o composer para a pasta bin
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer  
