lynx -dump http://www.sensacaotermica.com.br/caxias-do-sul-rs | grep  "Velocidade do Vento:" | awk -F: '{print $2}' | tr -d km/h | tr -d " "  > /etc/zabbix/temp/caxias.txt
lynx -dump http://www.sensacaotermica.com.br/caxias-do-sul-rs | grep "Temperatura:" | awk -F: '{print $2}' | tr -d º | tr -d " "  > /etc/zabbix/temp/caxias.txt
lynx -dump http://www.sensacaotermica.com.br/caxias-do-sul-rs | grep "Sensação Térmica:"  | awk -F: '{print $2}' | tr -d º | tr -d " "  > /etc/zabbix/temp/caxias.txt
lynx -dump http://www.sensacaotermica.com.br/caxias-do-sul-rs | grep  "Clima Atual:"  | awk -F: '{print $2}'  | sed 's/^ \+//'  > /etc/zabbix/temp/caxias.txt

