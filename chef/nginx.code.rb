upstream project {
  server 22.22.22.2:80;
  server 22.22.22.3:80;
  #server 22.22.22.5:3000;
}

server {
  listen 80;

  location / {
    proxy_pass http://project;
             }
  location ~* \.(css|js|gif|jpe?g|png)$ {
    expires 168h;
                                         } 


        } 