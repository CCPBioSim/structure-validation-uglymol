FROM nginx@sha256:b34848eff6db786b6b1282d3a9c3fd0b5563dfb6d261df4923378b419e0d24f0

# Make directories
RUN mkdir /usr/share/nginx/html/1t38 && \
    mkdir /usr/share/nginx/html/7bv2 && \
    mkdir /usr/share/nginx/html/upload

# Copy files from examples to relevant paths.
COPY uglymol/1t38 /usr/share/nginx/html/1t38
COPY uglymol/7bv2 /usr/share/nginx/html/7bv2
COPY uglymol/upload /usr/share/nginx/html/upload
COPY uglymol/emd_30210.map /usr/share/nginx/html
COPY uglymol/pdb_00007bv2_xyz_v1-0.cif /usr/share/nginx/html
COPY uglymol/pdb_00007bv2_xyz_v1-0.pdb /usr/share/nginx/html

# Install uglymol from github.
RUN curl -L https://github.com/uglymol/uglymol/archive/refs/tags/v0.7.2.tar.gz > /tmp/uglymol.tar.gz && \
    mkdir /tmp/uglymol && \
    tar -xvf /tmp/uglymol.tar.gz --strip-components=1 --directory /tmp/uglymol && \
    cp /tmp/uglymol/uglymol.js /usr/share/nginx/html/1t38 && \
    cp /tmp/uglymol/uglymol.js /usr/share/nginx/html/7bv2 && \
    cp /tmp/uglymol/uglymol.js /usr/share/nginx/html/upload  && \
    rm -r /tmp/uglymol.tar.gz /tmp/uglymol
