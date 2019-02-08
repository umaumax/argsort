# argsort

easy to use getopts (mainly for your original bash script)

## how to use
```
PATH=.:$PATH

args=($(OPT_WITH_ARG='+(-o)' argsort http://www.google.com -o index.html))
curl "${args[@]}"
```
