
cabecera(){
    clear
    echo '### TIPO DE ROPA ###'
    echo ''
}


crearCategoria() {
	
}

menuPrincipal(){
    while [[ true ]]; do
        cabecera
        echo 'Para crear una categoria pulsa N para volver al menu pulsa X'
        echo ''
        read -n 1 -p "Elige una opción: " opcion
       if [[ $opcion == 'N' ]]; then
           crearCategoria
        elif [[ $opcion == '2' ]]; then
            bash "$HOME/Escritorio/Proyecto/buscarPro.sh" $rutaPermitida
        elif [[ $opcion == 'X' ]]; then
		break
        fi
    done
}


