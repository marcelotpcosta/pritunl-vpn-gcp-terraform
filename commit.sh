eval `ssh-agent -s`

ssh-add ~/work/cred/marcelotpcosta
sleep 1

git add *
sleep 1

export DATE=$(date +"%d-%m-%y")

git commit -m $DATE
sleep 1

git push
echo "done!"