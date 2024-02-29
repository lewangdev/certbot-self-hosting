FROM certbot/certbot:v2.3.0

RUN pip install certbot-dns-cloudflare certbot-dns-aliyun
