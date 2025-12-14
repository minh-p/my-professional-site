cd src/
hugo --minify
sudo rsync -av --delete public/ /var/www/landing/
