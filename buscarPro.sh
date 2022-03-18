
mostrarArt() {
clear

echo "Mostrar codigo"
echo ""
read -p "Dime el articulo a mostrar: " codArt
echo ""
echo ""

if [[ $codArt == 1 ]]; then
	echo "Este archivo no existe"
	read -n 1 -p "Pulsa 1 para volver intentarlo. Pulsa m para volver al menú" result
	if [[ $result == 'm' || $result == 'M' ]]; then
		cd ../../..
		bash menu.sh
	elif [[ $result == "1" ]]; then
		mostrarArt
	fi
else
	echo "Este es el archivo $codArt"
	echo ""
	cat $codArt
	echo ""
fi
read -n 1 -p "Pulsa m para volver al menú" result
	if [[ $result == 'm' || $result == 'M' ]]; then
		cd "../../../"
		bash menu.sh
	fi
}



buscarMarca() {
clear

echo 'Buscar MARCA'
echo ""
echo ""
listadoMarca
echo ""
echo ""
read -p "Dime la categoria que buscas: " bMarca

if [[ -d  $bMarca ]]; then 
	cd $bMarca
	mostrarArt
fi


}

principal(){
clear
echo "Buscar Categoria"
echo ""
echo ""
listadoCat
echo ""
echo ""
read -p "Dime la categoria que buscas: " bCategoria

if [[ -d  $bCategoria ]]; then 
	cd $bCategoria
	buscarMarca
fi


}

listadoMarca() {

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

listadoCat() {

cd "$HOME/Escritorio/Proyecto2evaluacion/CATEGORIAS/"

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

principal
