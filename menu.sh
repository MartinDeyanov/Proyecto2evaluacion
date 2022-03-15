
cabecera(){
    clear
    echo '### GESTION DE ROPA ###'
    echo ''
}


menuPrincipal(){
    while [[ true ]]; do
        cabecera
        echo '1.Crear Producto'
        echo '2.Buscar producto'
        echo '3.Salir'
        echo ''
        read -n 1 -p "Elige una opción: " opcion
       if [[ $opcion == '1' ]]; then
            	bash "$HOME/martin/Escritorio/Proyecto/crearPro.sh" 
        elif [[ $opcion == '2' ]]; then
            	bash "$HOME/martin/Escritorio/Proyecto/buscarPro.sh" 
        elif [[ $opcion == '3' ]]; then
		echo ""
            	read -n 1 -p "Realmente deseas salir?[s/n] " opcion
           	if [[ $opcion == 's' || $opcion == 'S' ]]; then
                	break
                fi
        fi
    done
}

comprobarRutaInicial(){
    cd $rutaPermitida
    acceso=$?
    if [[ $acceso == 1 ]];then
        clear
        echo 'NO TIENES ACCESO'
        echo 'No dispones de la ruta permitida'
        echo "RUTA PERMITIDA: $rutaPermitida"
    else
        menuPrincipal
    fi
}

rutaPermitida="$HOME/Escritorio/Proyecto/"
rutaOrigen=''
rutaDestino=''

comprobarRutaInicial
