# Why debris

This github action will fetch random fact that is useless (or maybe not) just like debris

> Currently it only fetches fact from [here](https://uselessfacts.jsph.pl/)

# Usage

## Readme Setting

On your readme put this comment:

```markdown
<!--START_SECTION:debris-->   
<!--END_SECTION:debris-->
```

The github action will put the output between those two comment section

## Github Token

- Go to your **Settings** > **Developer settings** > **Personal access tokens** and create new token with `repo` and `user` scope

- Copy the token

- Goto your repo's **Settings** > **Secrets** and then create new secret with the name `GITHUB_TOKEN` and the token you was copied as the value
  
  If you need more info, you can see [the github documentaion](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

## Workflow Setting

```yaml
on:
  push:
    # Run at every push on branches master
    branches: master
  schedule:
    # Or every 1.30 am UTC
    - cron: '30 1 * * *'

jobs:
  update-readme:
    runs-on: ubuntu-latest
    name: Update Readme with Github Action
    env:
      GITHUB_TOKEN: ${{secrets.GITHUB_TOKEN}}
    steps:
      - uses: actions/checkout@v2
      - name: Debris action
        uses: ekickx/debris@master 
        with:
          fact_args: 'random'
```

You can input `fact_args` with `random` or `today`.

- **`random`**: It will fetch different fact everytime the job run

- **`today`**: It will fecth the same fact every push and will only change after 24 hours
