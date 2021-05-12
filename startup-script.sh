#!/bin/sh

# gcloud compute instances add-metadata mud43ad-base-vm --metadata=startup-script=startup-script.sh

ngayon=$(date)

cat << EOF > /etc/nginx/sites-available/r4ur1c1-io-tk
server {
  listen 80 default_server;
  listen [::]:80 default_server;
  server_name www.r4ur1c1-io.tk r4ur1c1-io.tk;
  return 301 https://r4ur1c1-io.tk$request_uri;
}
EOF

ln -s /etc/nginx/sites-available/r4ur1c1-io-tk /etc/nginx/sites-enabled/default

systemctl restart mysql

systemctl restart nginx

cat > /etc/supervisor/conf.d/r4ur1c1-io-tk.conf << EOF
[program:r4ur1c1-io-tk]
directory=/root/sites/demo-api
command=bash -lc "/root/.rbenv/shims/bundle exec /root/.rbenv/shims/rails server"
autostart=true
autorestart=true
stdout_logfile=/var/log/r4ur1c1-io-tk-out.log
stderr_logfile=/var/log/r4ur1c1-io-tk-err.log
user=root
;stdout_logfile=syslog
;stderr_logfile=syslog
;ngayon
EOF

cat /etc/supervisor/conf.d/r4ur1c1-io-tk.conf |
  sed -i "s|ngaun|${ngaun}|g"

supervisorctl reread
supervisorctl update
