wget https://github.com/miiton/Cica/releases/download/v5.0.1/Cica_v5.0.1_with_emoji.zip 
unzip Cica_v5.0.1.zip
mkdir -p ~/.fonts  
mv Cica-*.ttf ~/.fonts/.  
sudo fc-cache -fv  
rm -f Cica_v2.1.0.zip  
