# [kiddsbooks.com](https://www.kiddsbooks.com)

![workflows](https://github.com/noondaysun/kiddsbooks.com/workflows/CI%20Workflow/badge.svg)

Site code for [kiddsbooks.com](https://www.kiddsbooks.com)

## LOCAL DEVELOPMENT

```shell
cp .env.example .env

docker-compose up --build -d

# If port 53 is already in use - $(netstat -tulpn | grep 53)
echo '127.0.0.1 local.kiddsbooks.com local' >> /etc/hosts

open http://local.kiddsbooks.com

docker-compose exec php composer ci # to run test suite
```
