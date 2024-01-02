# A cloud-init image

Pull specs:

- Fedora ELN: `quay.io/centos-bootc/fedora-bootc-cloud:eln`
- CentOS Stream 9: `quay.io/centos-bootc/centos-bootc-cloud:stream9`

This container image [Containerfile](Containerfile) builds on top of the
[base image](github.com/centos/centos-bootc) and adds cloud-init.  It
can be used in any virtualization/IaaS system that is
[supported by cloud-init](https://cloudinit.readthedocs.io/en/latest/reference/datasources.html)
such as [libvirt](https://blog.wikichoon.com/2020/09/virt-install-cloud-init.html),
AWS, etc.

## Pre-generated disk images

There are pre-generated disk images available which can be launched directly.

(Note: as of right now there are only disk images for Fedora until
 [this issue](https://github.com/osbuild/bootc-image-builder/issues/18) is fixed)

The disk images are stored as OCI artifacts; currently in the Github container
registry until
[this issue](https://github.com/CentOS/centos-bootc-layered/issues/25) is fixed.

### Unpacking the disk image using oras

The [oras](https://oras.land/) project offers a handy CLI tool that can be used
like this:

```text
$ oras pull ghcr.io/centos/fedora-bootc-cloud-disk:eln
...
Pulled ghcr.io/centos/fedora-bootc-cloud-disk:eln
Digest: sha256:2bd73cc3589f6c7c28d7335a704133fd08526e4c0197a3ae038f1821c736c144
$ zstd -d fedora-bootc-cloud-eln.qcow2.zst
```

### Unpacking using skopeo

It's more common to have `skopeo` instead of `oras`, but unfortunately the ergonomics
here are currently atrocious:

```text
$ skopeo copy docker://ghcr.io/centos/fedora-bootc-cloud-disk:eln oci:disk
Getting image source signatures
Copying blob da734940e022 done
Copying config 44136fa355 done
Writing manifest to image destination
$ find disk/blobs/ -type f -size -5M | xargs -r rm
$ mv disk/blobs/sha256/* fedora-bootc-cloud-eln.qcow2.zst
$ rm -rf disk
$ zstd -d fedora-bootc-cloud-eln.qcow2.zst
fedora-bootc-cloud-eln.qcow2.zst: 790560768 bytes
$
```
