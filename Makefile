SHELL=/bin/bash
init:
	cp ~/.bashrc ./.bashrc | true
	rm -f ~/.bashrc
	ln -s `pwd`/.bashrc ~/.bashrc
	cp ~/.tmux.conf ./.tmux.conf | true
	rm -f ~/.tmux.conf
	ln -s `pwd`/.tmux.conf ~/.tmux.conf
	cp ~/.vimrc ./.vimrc | true
	rm -f ~/.vimrc
	ln -s `pwd`/.vimrc ~/.vimrc
	cp /etc/inputrc ./.inputrc | true
	rm -f ~/.inputrc
	ln -s `pwd`/.inputrc ~/.inputrc
	cp ~/env.sh ./env.sh | true
	rm -f ~/env.sh
	ln -s `pwd`/env.sh ~/env.sh
	cp /etc/nginx/sites-enabled/isuports.conf ./isuports.conf | true
	sudo rm -f /etc/nginx/sites-enabled/isuports.conf
	sudo ln -s `pwd`/isuports.conf /etc/nginx/sites-enabled/isuports.conf
	cp /etc/nginx/nginx.conf ./nginx.conf | true
	sudo rm -f /etc/nginx/nginx.conf
	sudo ln -s `pwd`/nginx.conf /etc/nginx/nginx.conf
	# cannot load my.cnf from a symbolic link somehow...	
	#sudo cp /etc/mysql/my.cnf ./my.cnf | true
	#sudo rm -f /etc/mysql/my.cnf
	#sudo ln -s `pwd`/my.cnf /etc/mysql/my.cnf
apply:
	source ~/.bashrc
	# bind -f ~/.inputrc
	sudo nginx -s reload
apply_db:
	sudo service mysql restart

db:
	sudo systemctl restart mysql.service

nginx:
	sudo systemctl restart nginx.service

app:
	sudo systemctl restart isucondition.go.service

alp:
	sudo cat /var/log/nginx/access.log | alp ltsv -m '/api/condition/.*','/isu/.*/condition','/isu/.*/graph','/api/isu/.*/icon','/api/isu/.*','/isu/.*','/assets/.*'

ptq:
	sudo pt-query-digest --limit 10 /var/log/mysql/mysql-slow.log

mss:
	sudo mysqldumpslow -s t -t 20

reset-log:
	sudo rm /var/log/mysql/mysql-slow.log || true
	sudo rm /var/log/nginx/access.log || true
	make db
	make nginx
