#!/bin/bash
DIR_TEMP=/etc/zabbix/prev_tempo
 [ -d $DIR_TEMP ] || mkdir -p $DIR_TEMP
for cidade in `echo $cidade bento-goncalves-rs canela-rs vacaria-rs santa-cruz-do-sul-rs cachoeira-do-sul-rs gramado-rs taquara-rs porto-alegre-rs novo-hamburgo-rs sao-leopoldo-rs`
do
> $DIR_TEMP/$cidade.txt

lynx -dump http://www.sensacaotermica.com.br/$cidade | grep  "Velocidade do Vento:" | awk -F: '{print $2}' | tr -d km/h | tr -d " "  >> $DIR_TEMP/$cidade.txt
lynx -dump http://www.sensacaotermica.com.br/$cidade | grep "Temperatura:" | awk -F: '{print $2}' | tr -d º | tr -d " "  >> $DIR_TEMP/$cidade.txt
lynx -dump http://www.sensacaotermica.com.br/$cidade | grep "Sensação Térmica:"  | awk -F: '{print $2}' | tr -d º | tr -d " "  >> $DIR_TEMP/$cidade.txt
lynx -dump http://www.sensacaotermica.com.br/$cidade | grep  "Clima Atual:"  | awk -F: '{print $2}'  | sed 's/^ \+//'  >> $DIR_TEMP/$cidade.txt

done

