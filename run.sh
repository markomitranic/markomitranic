#!/bin/sh

docker volume create bundle_cache
docker volume create gem_cache

docker run --rm \
    --name markomitranic \
    -v $(pwd):/srv/jekyll \
    -v bundle_cache:/usr/local/bundle \
    -v gem_cache:/usr/gem \
    --publish 4000:4000 \
    --env-file .env \
    -it --rm jekyll/jekyll:4 \
    jekyll serve