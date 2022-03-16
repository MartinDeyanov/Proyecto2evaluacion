
crearCategoria(){
clear
echo '### CREAR CATEGORIA ###'


read -p 'Dame el nombre de la categoria a crear: ' nombre
cd "CATEGORIAS"
mkdir $nombre

if [[ -d $nombre ]]; then
	crearMarca
fi

}

listadoMar() {
cd $opcion
tree -L 1 -d -i > lista.txt
sed -i '1d' lista.txt # eliminar la primera linea
sed -i '/^$/d' lista.txt #eliminar espacios en blanco 
sed -i '$ d' lista.txt # elimina la ultima linea
sed -i 's/[a-z]/\U&/g' lista.txt #cambia todos los caracteres de minuscula a mayuscula

n=1

while [[ true ]]; do
    sed -i "$n ""s/^/""$n""./" lista.txt
    n=$((n+1))

    #capturar la linea para saber si tiene algo escrito
    #en caso de no tener nada, para al bucle
    linea=$( sed -n "$n""p" lista.txt )
    if [[ $linea == "" ]]; then
        break
    fi
done


cat lista.txt

}

crearMarca() {
	clear
	echo "### CREAR MARCA $opcion ###"

	listadoMar

	read -p 'Dame el nombre de la categoria a crear: ' marca
	mkdir $marca

	

}

listadoCat() {

cd "$HOME/Escritorio/repositorioProyecto/Proyecto2evaluacion/CATEGORIAS"
touch lista.txt
tree -L 1 -d -i > lista.txt
sed -i '1d' lista.txt # eliminar la primera linea
sed -i '/^$/d' lista.txt #eliminar espacios en blanco 
sed -i '$ d' lista.txt # elimina la ultima linea
sed -i 's/[a-z]/\U&/g' lista.txt #cambia todos los caracteres de minuscula a mayuscula

n=1

while [[ true ]]; do
    sed -i "$n ""s/^/""$n""./" lista.txt
    n=$((n+1))

    #capturar la linea para saber si tiene algo escrito
    #en caso de no tener nada, para al bucle
    linea=$( sed -n "$n""p" lista.txt )
    if [[ $linea == "" ]]; then
        break
    fi
done


cat lista.txt

}

while [[ true ]]; do
	clear
	echo '### TIPO DE ROPA ###'
	echo ''
	echo 'Para crear una categoria pulsa N, para volver al menu pulsa X'
	listadoCat
	echo ''

	read -p "Categoria: " opcion
	if [[ $opcion == 'N' || $opcion == 'n' ]]; then
		crearCategoria
	elif [[ $opcion == 'X' || $opcion == 'x' ]]; then
		cd ../
		bash menu.sh
		break
	elif [[ -d $opcion ]]; then
		cd "CATEGORIAS/$opcion"
		crearMarca
	else
		read -n 1 -p "Esta opcion no es valida"
	fi
     
done



