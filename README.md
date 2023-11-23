# centos-bootc-layered

Images layered on top of the core [centos-bootc][5] base images.

## Available images

### `quay.io/centos-boot/fedora-bootc-cloud:eln`

This [simple image](fedora-bootc-cloud/) builds on top of the base Fedora ELN image
and adds cloud-init.

## Badges

| Badge                   | Description          | Service      |
| ----------------------- | -------------------- | ------------ |
| [![Renovate][1]][2]     | Dependencies         | Renovate     |
| [![Pre-commit][3]][4]   | Static quality gates | pre-commit   |

[1]: https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovate
[2]: https://renovatebot.com
[3]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[4]: https://pre-commit.com/
[5]: https://github.com/CentOS/centos-bootc
