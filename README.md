# git-updater

This repository can be used for updating all repositories within one single directory (`ROOTDIR`).

```bash
export ROOTDIR=~/your-base-path
bash update-git.sh
```

For previous example, structure of repositories is the following:

```text
your-base-path
│
├── repository1
│
├── repository2
│
└── repository3
```

For fully automating this process, please ensure, that you do not manually need to enter any credentials.
