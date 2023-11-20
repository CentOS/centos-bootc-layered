# This image contains cloud-init, which makes it usable out of the box
# for e.g. a pre-generated AWS or KVM guest system.
FROM quay.io/centos-boot/fedora-tier-1:eln@sha256:4693953634fc2c3bff8d53a5f81a4682ac1aeb53b8184703273eef320eda66ef
RUN dnf -y install cloud-init && \
    ln -s ../cloud-init.target /usr/lib/systemd/system/default.target.wants && \
    rm /var/log/*.log /var/lib/dnf -rf && ostree container commit
