#! /bin/bash
make -C docs clean 
# sphinx-apidoc -f -o docs/source . -H Test -e -t docs/source/_templates
make -C docs html
chown runner:docker -R *
git config --global --add safe.directory docs/build/html
cd docs/build/html/
git init
touch .nojekyll
git add -A
git config --local user.email "action@github.com"
git config --local user.name "GitHub Action"
git commit -m 'deploy'