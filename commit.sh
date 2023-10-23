eval `ssh-agent -s`

ssh-add ~/work/marcelotpcosta
sleep 1

git add *
sleep 1

export DATE=$(date +"%d-%m-%y")

git commit -m $DATE
sleep 1

git push
echo "done!"