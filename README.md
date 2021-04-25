# codehook
Feel free to use hooks :)
Github hooks for php code quality. If the quality of the code is bad the commit will be banned.

***Add this lines in composer.json file:

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
***How to use:

Execute
1. install dependency: ```composer update``` or ```composer install```

2. And after ```composer fcs``` for applying git hooks in pre-commit action.

