# This image contains cloud-init, which makes it usable out of the box
# for e.g. a pre-generated AWS or KVM guest system.
FROM quay.io/centos-boot/fedora-tier-1:eln@sha256:52dd1a519a9b67ff141827375cd7cec6b51eff8725934ee19700a5725c2b2f9a
RUN dnf -y install cloud-init && \
    ln -s ../cloud-init.target /usr/lib/systemd/system/default.target.wants && \
    rm /var/log/*.log /var/lib/dnf -rf && ostree container commit
