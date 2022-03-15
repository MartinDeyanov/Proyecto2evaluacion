
cabecera(){
    clear
    echo '### TIPO DE ROPA ###'
    echo ''
}

crearCategoria(){
echo '### CREAR CATEGORIA ###'
    echo ''

clear
echo 'Crear Categoria'
read -n 1 -p "Dime el nombre del archivo: " nomArch
	if [[ nomArch == nomArch ]];then
		cd $HOME/Escritorio/repositorioProyecto/Proyecto2evaluacion/ListaCat
		touch $nomArch.txt 
	fi


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
		break
	fi
     
done
}

menu
