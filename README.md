# certbot-self-hosting


1. first request

```
export domain=example.com
export certbot_home=/data/var/lib/certbot

mkdir -p ${certbot_home}
mkdir -p ${certbot_home}/credentials
mkdir -p ${certbot_home}/letsencrypt

tee ${certbot_home}/letsencrypt/${domain}.ini <<-EOF
agree-tos = true
no-eff-email = true
authenticator = dns-aliyun
preferred-challenges = dns
dns-aliyun-credentials = '/root/.secrets/aliyun.ini'
dns-aliyun-propagation-seconds = 60

# REQUIRED
email = your_email@xxx.com
# REQUIRED
domains = '${domain},*.${domain}'
EOF


docker run --rm \
    -v ${certbot_home}/credentials:/root/.secrets \
    -v ${certbot_home}/letsencrypt:/etc/letsencrypt \
    lewangdev/certbot \
    certonly -c /etc/letsencrypt/${domain}.ini
```

2. renew

```
export domain=example.com
export certbot_home=/data/var/lib/certbot

mkdir -p ${certbot_home}
mkdir -p ${certbot_home}/credentials
mkdir -p ${certbot_home}/letsencrypt

tee ${certbot_home}/letsencrypt/${domain}.ini <<-EOF
agree-tos = true
no-eff-email = true
authenticator = dns-aliyun
preferred-challenges = dns
dns-aliyun-credentials = '/root/.secrets/aliyun.ini'
dns-aliyun-propagation-seconds = 60

# REQUIRED
email = your_email@xxx.com
# REQUIRED
domains = '${domain},*.${domain}'
EOF


docker run --rm \
    -v ${certbot_home}/credentials:/root/.secrets \
    -v ${certbot_home}/letsencrypt:/etc/letsencrypt \
    lewangdev/certbot \
    renew -c /etc/letsencrypt/${domain}.ini
```
