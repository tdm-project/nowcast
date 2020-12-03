
FROM tdmproject/tdmq-client-conda

RUN apt-get update -q \
 && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends libgl1-mesa-glx \
 && apt-get clean -y \
 && rm -rf /var/lib/apt/lists/*

RUN mamba install -c conda-forge --strict-channel-priority --yes \
  'pysteps=1.3.2' \
  'dask>=2.30,<3' \
  'toolz>=0.11,<0.12' \
  'pyfftw>=0.12,<0.13' \
 && mamba clean --all -y

RUN useradd -m -s /bin/bash -d /home/tdm tdm
WORKDIR /home/tdm

COPY --chown=root nowcast /usr/local/bin/
RUN chmod 755 /usr/local/bin/nowcast

ENTRYPOINT [ "/usr/local/bin/nowcast" ]
USER tdm
