#!/bin/bash

#Get IP
local_ipv4="$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)"
#!/bin/bash
sudo yum update -y
sudo yum install -y amazon-linux-extras docker
sudo docker run -t -i kalilinux/kali-rolling
sudo service docker start

sudo systemctl start docker
sudo systemctl enable docker
#install nmap
sudo yum install nmap -y


#isntall masscan
sudo yum install git make gcc -y
git clone https://github.com/robertdavidgraham/masscan
cd masscan
sudo make
sudo make install

#install metasploit 
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall


# Install eye witness
sudo git clone https://github.com/FortyNorthSecurity/EyeWitness.git

# Install sudo amazon-linux-extras install mate-desktop1.x




sudo amazon-linux-extras install mate-desktop1.x -y
sudo bash -c 'echo PREFERRED=/usr/bin/mate-session > /etc/sysconfig/desktop'

sudo yum install tigervnc-server -y


sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum-config-manager --enable epel -y

sudo yum install guacd -y

sudo yum install libguac-client-vnc libguac-client-ssh libguac-client-rdp -y
sudo amazon-linux-extras install tomcat8.5 -y

wget https://downloads.apache.org/guacamole/1.1.0/binary/guacamole-1.1.0.war

sudo mv guacamole-1.1.0.war /var/lib/tomcat/webapps/guacamole.war