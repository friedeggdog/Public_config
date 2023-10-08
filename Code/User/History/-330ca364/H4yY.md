# Instructions


Run the following commands
the second one is optional unless you are testing over a network

1)sudo iptables -A OUTPUT -t nat -p tcp --dport 22 -j REDIRECT --to-port 2222
2)sudo iptables -A PREROUTING -t nat -p tcp --dport 22 -j REDIRECT --to-port 2222

Start honeypot.py
Test using username@127.0.0.1
