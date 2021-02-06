FORTUNE := /usr/share/games/fortunes
BIN := $$HOME/.local/bin

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
	sudo strfile -c % $(FORTUNE)/flip $(FORTUNE)/flip.dat
	sudo strfile -c % $(FORTUNE)/reset $(FORTUNE)/reset.dat

chmod:
	chmod +x ./tables
	chmod +x ./ws01