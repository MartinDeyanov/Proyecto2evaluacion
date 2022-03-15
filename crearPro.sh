
cabecera(){
    clear
    echo '### TIPO DE ROPA ###'
    echo ''
}

crearCategoria(){

echo 'Crear Categoria'
read -n 1 -p


}

menu(){
	while [[ true ]]; do
	cabecera
	echo 'Para crear una categoria pulsa N para volver al menu pulsa X'
	echo ''
	read -n 1 -p "Elige una opción: " opcion
	if [[ $opcion == 'N' || $opcion == 'n' ]]; then
	   crearCategoria
	elif [[ $opcion == 'X' || $opcion == 'x' ]]; then
		bash "$HOME/Escritorio/repositorioProyecto/Proyecto2evaluacion/menu.sh"
	fi

	done
}

menu
