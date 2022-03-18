
cabecera(){
    clear
    echo '### GESTION DE ROPA ###'
    echo ''
}




while [[ true ]]; do
cabecera
echo '1.Crear Producto'
echo '2.Modificar producto'
echo '3.Buscar producto'
echo '4.Borrar producto'
echo '5.Salir'
echo ''
read -n 1 -p "Elige una opción: " opcion
if [[ $opcion == '1' ]]; then
	cd CATEGORIAS
    	bash crearPro.sh
elif [[ $opcion == '2' ]]; then
	cd CATEGORIAS
    	bash modificarPro.sh
elif [[ $opcion == '3' ]]; then
    	bash buscarPro.sh
elif [[ $opcion == '4' ]]; then
    	bash borrarArt.sh
elif [[ $opcion == '5' ]]; then
	echo ""
    	read -n 1 -p "Realmente deseas salir?[s/n] " opcion
   	if [[ $opcion == 's' || $opcion == 'S' ]]; then
        	break
        fi
fi
done


