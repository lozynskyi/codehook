# codehook
Github hooks for php code quality. If the quality of the code is bad the commit will be banned.

```
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
```
