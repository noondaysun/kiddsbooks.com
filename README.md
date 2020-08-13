# [kiddsbooks.com] (https://www.kiddsbooks.com) SITE CODE

### LOCAL DEVELOPMENT
```shell
cp .env.example .env

# Generate a local self-signed cert, or install a verified certificate with intermediates.
# See nginx unit documentation: [Nginx Unit SSL/TLS Configuration] (https://unit.nginx.org/configuration/#ssl-tls-and-certificates)
# See easyRSA CA setup documentation: [EasyRSA CA setup](https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-a-certificate-authority-ca-on-ubuntu-20-04)

cd unit-config


openssl genrsa -out local.kiddsbooks.com.key
openssl req -new -key local.kiddsbooks.com.key -out local.kiddsbooks.com.req

# Copy key to your CA server using scp/rsync
# rsync local.kiddsbooks.com.req user@server:/tmp
# scp local.kiddsbooks.com.req user@server:/tmp
# On CA

easyrsa import-req /tmp/local.kiddsbooks.com.req kiddsbooks
easyrsa sign-req server kiddsbooks

# Copy back to local
# scp user@server:/path/to/easyrsa/pki/issued/kiddsbooks.com .

openssl x509 -in kiddsbooks.crt -out kiddsbooks.pem

cd ../

docker-compose up --build -d

```
