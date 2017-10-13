#gmp
tar -xvJf gmp-6.1.2.tar.xz
cd gmp-6.1.2
./configure --prefix=/usr/local/gmp
make
make install
make clean
cd ..

#libmcrypt
tar -xzvf libmcrypt-2.5.7.tar.gz
cd libmcrypt-2.5.7
./configure
make
make install
make clean
cd ..

#lua
tar -xzvf lua-5.3.2.tar.gz
cd lua-5.3.2
make linux
make install
make clean
cd ..

#libevent
tar -xzvf libevent-2.0.22-stable.tar.gz
cd libevent-2.0.22-stable
./configure --prefix=/usr/local/libevent
make
make install
make clean
cd ..

#memcached
tar -xzvf memcached-1.4.24.tar.gz
cd memcached-1.4.24
./configure --with-libevent=/usr/local/libevent --prefix=/usr/local/memcached
make
make install
make clean
cd ..

#redis
tar -xzvf  redis-3.0.1.tar.gz
cd redis-3.0.1
make
make PREFIX=/usr/local/redis install
make clean
cd ..

#spawn-fcgi
tar -xzvf spawn-fcgi-1.6.3.tar.gz
cd spawn-fcgi-1.6.3
./autogen.sh
./configure --prefix=/usr/local/nginx
make
make install
make clean
cp /usr/local/nginx/bin/spawn* /usr/local/nginx/sbin
cd ..

#nginx
tar -xzvf nginx-1.10.2.tar.gz
cd nginx-1.10.2
export LUAJIT_LIB=/usr/local/luajit/lib
export LUAJIT_INC=/usr/local/luajit/include/luajit-2.0
./configure --prefix=/usr/local/nginx \
--with-http_ssl_module \
--with-http_stub_status_module \
--with-http_v2_module \
--with-ipv6 \
--with-http_gzip_static_module \
--with-http_realip_module \
--with-http_flv_module \
--with-pcre-jit \
--add-module=/data/source/nginx-rtmp-module \
--add-module=/data/source/lua-nginx-module \
--user=www --group=www
make
make install
make clean
cd ..

#luajit
tar -xzvf LuaJIT-2.0.4.tar.gz
cd LuaJIT-2.0.4
make PREFIX=/usr/local/luajit
make install PREFIX=/usr/local/luajit
make clean
mv /usr/local/luajit/lib/libluajit-5.1.so /usr/local/luajit/lib/libluajit-5.1.so.bak
cd ..

#fcgi
tar -xzvf fcgi-2.4.0.tar.gz
cd fcgi-2.4.0
./configure --prefix=/usr/local/fcgi
make
make install
make clean
cd ..

#php
tar -xzvf php-5.6.9.tar.gz
cd php-5.6.9
./configure  --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-zlib   --enable-mbstring --with-openssl --with-mysql --with-mysqli --with-mysql-sock --enable-gd-native-ttf --enable-pdo --with-gettext --with-curl --with-pdo-mysql --enable-sockets --enable-bcmath --enable-xml --with-bz2 --enable-zip --enable-mbregex --with-mhash --with-pcre-regex --with-gd --enable-sysvsem --enable-sysvshm --with-mcrypt --enable-inline-optimization --disable-debug --with-jpeg-dir=/usr/ --with-png-dir=/usr/ --with-freetype-dir=/usr/ --with-gmp=/usr/local/gmp --without-pear  --disable-phar
make
make install
make clean
cd ..

#pear扩展
wget  http://pear.php.net/go-pear.phar 
/usr/local/php/bin/php go-pear.phar

#yaf
tar -zxvf yaf-2.3.5.tgz
cd yaf-2.3.5
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
make clean
cd ..

#mongo
tar -zxvf mongo-1.6.14.tgz
cd mongo-1.6.14
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
make clean
cd ..

tar -xzvf mongodb-1.1.9.tgz
cd mongodb-1.1.9
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
make clean
cd ..

#swoole-src-1.9.8
tar -xzvf swoole-1.9.8.tgz
cd swoole-1.9.8
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
make clean
cd ..

#ImageMagick
tar -xzvf imagick-3.4.3.tgz
cd imagick-3.4.3
/usr/local/php/bin/phpize  && ./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
make clean
cd ..

cd ImageMagick
./configure
make
make install
make clean
cd ..
