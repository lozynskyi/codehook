# codehook
Github hooks for php code quality. If the quality of the code is bad the commit will be banned.

Add this lines in composer.json file:

```
...
  "scripts": {
    "cghooks": [
        "vendor/bin/cghooks"
    ],
    "fcs" : [
        "git config advice.ignoredHook false",
        "cp vendor/lozynskyi/codehook/hooks/pre-commit.sh .git/hooks/pre-commit",
        "chmod +x .git/hooks/pre-commit"
    ]
  }
...
```

execute:
for install dependency: **composer update** or **composer install**
and after **composer fcs** for applying hooks in .git folder.

