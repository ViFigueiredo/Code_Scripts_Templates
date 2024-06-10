#Debian 9-11
curl https://packages.microsoft.com/keys/microsoft.asc | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc

# Debian 12
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

#Download appropriate package for the OS version
#Choose only ONE of the following, corresponding to your OS version

#Debian 9
curl https://packages.microsoft.com/config/debian/9/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

#Debian 10
curl https://packages.microsoft.com/config/debian/10/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

#Debian 11
curl https://packages.microsoft.com/config/debian/11/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

#Debian 12
curl https://packages.microsoft.com/config/debian/12/prod.list | sudo tee /etc/apt/sources.list.d/mssql-release.list

sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql18
# optional: for bcp and sqlcmd
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools18
echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
source ~/.bashrc
# optional: for unixODBC development headers
sudo apt-get install -y unixodbc-dev
# optional: kerberos library for debian-slim distributions
sudo apt-get install -y libgssapi-krb5-2


# List drivers
odbcinst -j