ARG BASE_IMAGE
FROM "$BASE_IMAGE"

COPY . .
RUN bash ci/ray_ci/windows/build_ray.sh

WORKDIR /rayci
