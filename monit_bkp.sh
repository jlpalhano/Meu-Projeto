#!/bin/bash


print_help() {
	 echo "Usage" >&2 ; 
} 

  while getopts c:nfdtbh OPCAO; do
     case "${OPCAO}" in
        c) cod="${OPTARG}";;
        n) nome=1 ;;
        f) file=1 ;;
        d) data=1 ;;
	t) tam=1 ;;
        b) bkp=1 ;;
	h) par_h=1 ;;
	?) echo "Ô loco!!"
     esac
done



shift $((OPTIND - 1))


cd /usr/lib/zabbix/externalscripts
BASE_DADOS=$( egrep "^${cod}\s"  * | sed 's/:.*//g' )                           #Descobre em qual arquivo esta a informacao passada na variavel ${cod}
#sleep 10
TAMANHO=$( grep ^"${cod}" $BASE_DADOS | awk '{print $5}' )
NOME=$( grep ^"${cod}" $BASE_DADOS | awk '{print $2}' )
DATA=$( grep ^"${cod}" $BASE_DADOS | awk '{print $3}' )
BKP=$( grep ^"${cod}" $BASE_DADOS | awk '{print $4}' )
  [  ${cod} ] 
	
  [ ${nome} ] &&
 	echo "$NOME" 
  [ ${file} ] &&
	echo "$BASE_DADOS"
  
  [ ${data} ] && 
	echo "$DATA"
  [ ${tam} ] &&
	echo "$TAMANHO"
  
  [ ${bkp} ] && 
	echo "$BKP"

  [ ${par_h} ] && awk '{print $1"--->"$2}' Fez_Nao_fez.dat | sed '1d' 
  
exit 0

