cd /var/www/html
echo "cloning backend"
git clone https://github.com/STS-Rosario/carpoolear_backend.git
cd carpoolear_backend
echo "installing backend"
composer install
cp .env.example .env
sed -i 's/APP_URL = http:\/\/www.carpoolear.com.ar/APP_URL = http:\/\/carpoolear22.test/g' .env
sed -i 's/DB_DATABASE=homestead/DB_DATABASE=dbname/g' .env
sed -i 's/DB_USERNAME=homestead/DB_USERNAME=dbuser/g' .env
sed -i 's/DB_PASSWORD=secret/DB_PASSWORD=123/g' .env
sed -i 's/MAIL_DRIVER=smtp/MAIL_DRIVER=log/g' .env
chmod -R ugo+rw storage/
php artisan key:generate
php artisan migrate
cd /var/www/html
echo "cloning frontend"
git clone https://github.com/STS-Rosario/carpoolear.git
cd carpoolear
echo "npm install might take a while"
npm install
sed -i 's/https:\/\/carpoolear.com.ar/http:\/\/carpoolear22.test/g' config/dev.env.js
sed -i 's/https:\/\/carpoolear.com.ar/http:\/\/carpoolear22.test/g' config/prod.env.js
echo "cordova android build might take a while"
cd cordova && cordova platform add android
echo "cordova browser build might take a while"
cordova build browser --release
echo "symlinking, almost there"
cd /var/www/
rm -rf carpoolear && ln -s /var/www/html/carpoolear_backend/public/ carpoolear
cd /var/www/html/carpoolear_backend/public/ && rm -rf app
ln -s /var/www/html/carpoolear/cordova/platforms/browser/www/ app
echo "carpoolear should be accesible at carpoolear22.test and carpoolear22.test/app"