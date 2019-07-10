# Projede hangi kütüphane kullanıldı.
FROM node:8.15.0-alpine

# Projenin kaynak dosyalarının kopyalanacagı yer
WORKDIR /usr/src/app

# Gerekli dosyaların kopyalanması.
COPY package*.json ./

# package.json daki gerekli kütüphanelerin yüklenmesi için : Express, body-parser, vs.
RUN npm install --only=production

# "." bütün kaynak kodları -> "." workdir de belirttiğim klasöre kopyala.
COPY . .

# kullanılacak port.
EXPOSE 1700

# docker run ederken kesin çalışacak komut için.
ENTRYPOINT [ "node" ]

# docker run ederken ENTRYPOINT komutunun yanına eklenecek ekstra parametre (docker run ederken degistirilebilir)
CMD [ "index.js" ]