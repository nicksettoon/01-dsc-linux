
args:
	./main.py -a -o if=/dev/random xvf

stdin:
	echo "nick is awesome" | ./main.py

file:
	cat test.txt | ./main.py