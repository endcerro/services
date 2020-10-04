cp ./Sources/Services/metallbT.yaml ./Sources/Services/metallb.yaml

baseip=$(minikube ip 2>&1)
endip=$(echo $baseip | sed 's/\.[0-9]*$/.0/' | rev | cut -c2- | rev 2>&1)
endip=$(echo "$endip"'245' 2>&1)
echo "$baseip""-""$endip" >> ./Sources/Services/metallb.yaml
cp ./Sources/Images/telegraf/telegrafT.conf ./Sources/Images/telegraf/telegraf.conf
echo "	url = \"https://""$baseip"":10250\"" >> ./Sources/Images/telegraf/telegraf.conf
