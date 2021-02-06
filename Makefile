FORTUNE := /usr/share/games/fortunes
COW := /usr/share/cowsay/cows
BIN := $$HOME/.local/bin
.PHONY: ws01 tables

args: ##Tests the script by giving it arguments
	./ws01 -a -o if=/dev/random xvf

stdin: ##Tests the script by feeding a string to stdin
	echo "nick is awesome" | ./ws01

file: ##Tests the script by feeding a text file into stdin
	cat test.txt | ./ws01

ws01:
	sudo ln ./ws01 $(BIN)/ws01
	@echo 'run ws01 at the shell prompt to run this program'

tables:
	sudo ln ./tables $(BIN)/tables
	@echo 'run tables at the shell prompt to run this program'

fortunes:
	sudo cp flip.txt $(FORTUNE)/flip
	sudo cp reset.txt $(FORTUNE)/reset
	sudo cp cows.txt $(FORTUNE)/cows
	sudo strfile -c % $(FORTUNE)/flip $(FORTUNE)/flip.dat
	sudo strfile -c % $(FORTUNE)/reset $(FORTUNE)/reset.dat
	sudo strfile -c % $(FORTUNE)/cows $(FORTUNE)/cows.dat

cows:
	sudo cp flip.cow $(COW)
	sudo cp reset.cow $(COW)

chmod:
	chmod +x ./tables
	chmod +x ./ws01

locale:
	echo "\nexport LC_ALL=C" >> $$HOME/.bash_profile

setup:
	make tables
	make fortunes
	make cows
	make chmod
	make locale
reset:
	sudo rm $(COW)/flip
	sudo rm $(COW)/reset
	sudo rm $(FORTUNE)/flip
	sudo rm $(FORTUNE)/flip.dat
	sudo rm $(FORTUNE)/reset
	sudo rm $(FORTUNE)/reset.dat
	sudo rm $(BIN)/tables
	sudo rm $(BIN)/ws01
	sed '/export LC_ALL/d' $$HOME/.bash_profile
	sudo apt remove fortune cowsay lolcat cmatrix
	snap remove lolcat-c
