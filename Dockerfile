FROM nginx

# Make directories
RUN mkdir /usr/share/nginx/html/uglymol && \
    mkdir /usr/share/nginx/html/uglymol/1t38 && \
    mkdir /usr/share/nginx/html/uglymol/7bv2 && \
    mkdir /usr/share/nginx/html/uglymol/upload

# Copy files from examples to relevant paths.
COPY uglymol/1t38 /usr/share/nginx/html/uglymol/1t38
COPY uglymol/7bv2 /usr/share/nginx/html/uglymol/7bv2
COPY uglymol/upload /usr/share/nginx/html/uglymol/upload
COPY uglymol/emd_30210.map /usr/share/nginx/html/uglymol
COPY uglymol/pdb_00007bv2_xyz_v1-0.cif /usr/share/nginx/html/uglymol
COPY uglymol/pdb_00007bv2_xyz_v1-0.pdb /usr/share/nginx/html/uglymol

# Install uglymol from github.
RUN curl -L https://github.com/uglymol/uglymol/archive/refs/tags/v0.7.2.tar.gz > /tmp/uglymol.tar.gz && \
    mkdir /tmp/uglymol && \
    tar -xvf /tmp/uglymol.tar.gz --strip-components=1 --directory /tmp/uglymol && \
    cp /tmp/uglymol/uglymol.js /usr/share/nginx/html/uglymol/1t38 && \
    cp /tmp/uglymol/uglymol.js /usr/share/nginx/html/uglymol/7bv2 && \
    cp /tmp/uglymol/uglymol.js /usr/share/nginx/html/uglymol/upload  && \
    rm -r /tmp/uglymol.tar.gz /tmp/uglymol
