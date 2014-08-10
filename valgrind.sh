G_SLICE=always-malloc G_DEBUG=gc-friendly,resident-modules valgrind --log-file=log.valgrind --leak-check=full --show-possibly-lost=no --num-callers=30 ./ldraw
leafpad log.valgrind &
