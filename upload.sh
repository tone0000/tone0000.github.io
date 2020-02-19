#! /bin/bash
read -p "please input commit word: " commit
git add .
git commit -m "$commit"
git push origin hexo
hexo g -d
