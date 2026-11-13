# Static site: nginx serving one page as a non-root user on 8080.
FROM nginxinc/nginx-unprivileged:1.29.3-alpine
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 8080
