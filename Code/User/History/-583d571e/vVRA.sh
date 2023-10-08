psql -v ON_ERROR_STOP=1 --username "myusername" --dbname "rust_server" <<-EOSQL
	CREATE DATABASE rust_server;
EOSQL