FROM nginx:alpine
RUN chmod -R 766 /var/log/nginx && \
  unlink /var/log/nginx/access.log && \
  unlink /var/log/nginx/error.log && \
  ln -sf /dev/stdout /var/log/nginx/stdout.log && \
  ln -sf /dev/stderr /var/log/nginx/stderr.log 

COPY template.nginx.conf /etc/nginx/template.nginx.conf
COPY entrypoint.sh /
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
