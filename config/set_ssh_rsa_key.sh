#!/bin/bash

ssh-keygen -t rsa -b 4096 -C $USER_EMAIL

cat ~/.ssh/id_rsa.pub

# How to test your connection
#ssh -T git@github.com
