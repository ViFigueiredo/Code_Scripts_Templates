# Testado em 
WSL2 + Debian 12
Python 12.
MSSQL Server 2019
ODBC Driver 18 for SQL Server

# Editar arquivo do OpenSSL
sudo nano /etc/ssl/openssl.cnf file
mudar openssl_conf = openssl_init para openssl_conf = default_conf

# Adicionar ao final do arquivo
[ default_conf ]
ssl_conf = ssl_sect

[ssl_sect]
system_default = system_default_sect

[system_default_sect]
MinProtocol = TLSv1.2
CipherString = DEFAULT@SECLEVEL=0

# Realizar teste fora do python
isql -v -k "Driver={ODBC Driver 18 for SQL Server};Server=xx;Database=xx;UID=xx;PWD=xx;Encrypt=no"