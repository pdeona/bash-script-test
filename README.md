## make-repo

#### Command line tool for making Github repos

### Installation

```
git clone https://github.com/pdeona/make-repo.git
cd make-repo/
bash setup.sh
```

### Usage

```bash
make-repo -u <GITHUB USERNAME> -n <REPO NAME> -[rp]

Flags:
  - -u: Required. Your Github username
  - -n: Required. Your desired Repo name
  - -r: Optional. Set up a remote link to the git repo in the directory you're running make-repo from. (Only use this flag if you are making the github repo from the working dir of the repo you want to push)
  - -p: Optional, defaults to false. Make your new repo private (Obviously will not work if you do not have private repo privilege on your Github account)

```
