# codehook
Github hooks for php code quality. Prevent committing in bad code quality. 

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
