# ruby-envconsul

Example using docker-compose:
```
version: '2'

services:
  rails_app:
    image: ruby-consul:2.3.0-rails
    command: rails
    container_name: rails_app
    ports:
      - 80:3000
    external_links:
      - consul
    volumes:
      - ./app:/app
      - gems:/gems
    environment:
      CONSUL_HOST: consul
      CONSUL_PREFIXES: -prefix=rails_app/global
      BUNDLE_PATH: /gems

networks:
  default:
    external:
      name: services_default

volumes:
  gems:
```
