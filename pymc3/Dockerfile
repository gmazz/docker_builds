FROM frolvlad/alpine-glibc:alpine-3.9
ENV CONDA_DIR="/opt/conda"
ENV PATH="$CONDA_DIR/bin:$PATH"

# Install conda
RUN CONDA_VERSION="latest" && \
    CONDA_MD5_CHECKSUM="718259965f234088d785cad1fbd7de03" && \
    apk add --no-cache --virtual=.build-dependencies wget ca-certificates bash && \
    apk add g++ && \
    apk add zsh && \
    mkdir -p "$CONDA_DIR" && \
    wget "http://repo.continuum.io/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh" -O miniconda.sh && \
    echo "$CONDA_MD5_CHECKSUM  miniconda.sh" | md5sum -c && \
    zsh miniconda.sh -f -b "$CONDA_DIR" && \
    #bash miniconda.sh -f -b -p "$CONDA_DIR" && \
    echo "export PATH=$CONDA_DIR/bin:\$PATH" > /etc/profile.d/conda.sh && \
    rm miniconda.sh && \
    conda config --add channels conda-forge && \
    conda config --set channel_priority strict && \
    conda update --all --yes && \
    conda config --set auto_update_conda False

# Install conda packages from conda-forge previously included
RUN conda install pymc3 --yes && \
    conda install arviz --yes && \
    conda install ipython --yes && \
    conda install jupyter --yes && \
    conda install mkl-service --yes

# Clean all dowladed packages to free space: 
RUN rm -r "$CONDA_DIR/pkgs/" && \
    apk del --purge .build-dependencies && \
    mkdir -p "$CONDA_DIR/locks" && \
    chmod 777 "$CONDA_DIR/locks"

CMD ["/bin/zsh"]
