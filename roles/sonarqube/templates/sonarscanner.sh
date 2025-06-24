#!/bin/bash 

ELV=$(rpm -qi basesystem | grep Release  | awk -F . '{print $NF}')
export OSVENDOR=$(rpm -qi basesystem  | grep Vendor | awk -F : '{print $NF}' | sed -e 's/^ //')

cd /opt
rm -rf sonar || true

if [ "$ELV" == "el7" ]; then
    curl -O https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.5.0.2216-linux.zip
    unzip sonar-scanner-cli-4.5.0.2216-linux.zip 
    mv sonar-scanner-4.5.0.2216-linux sonar 
elif [ "$ELV" == "el9" ]; then
    curl -O https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.1.0.4889-linux-x64.zip
    unzip sonar-scanner-cli-7.1.0.4889-linux-x64.zip
    mv sonar-scanner-7.1.0.4889-linux-x64 sonar
fi



ln -s /opt/sonar/bin/sonar-scanner /bin/sonar-scanner 
curl -s https://gitlab.com/thecloudcareers/opensource/-/raw/master/lab-tools/sonar-scanner/quality-gate >/bin/sonar-quality-gate.sh
chmod +x /bin/sonar-quality-gate.sh