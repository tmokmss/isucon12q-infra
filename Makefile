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
	cp /etc/nginx/sites-enabled/isucondition.conf ./isucondition.conf | true
	sudo rm -f /etc/nginx/sites-enabled/isucondition.conf
	sudo ln -s `pwd`/isucondition.conf /etc/nginx/sites-enabled/isucondition.conf
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
