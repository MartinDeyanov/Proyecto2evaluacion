
crearCategoria(){
clear
echo '### CREAR CATEGORIA ###'
echo ""
echo ""

read -p 'Dame el nombre de la categoria a crear: ' nombre
cd "CATEGORIAS"
mkdir $nombre

if [[ -d $nombre ]]; then
	crearMarca
fi

}

listadoMar() {
if [[ -d ${opcion^^} ]]; then
	cd ${opcion^^} 
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
else
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

fi
	


}

nuevoArticulo() {
clear
echo "### CATEGORIA ${opcion^^}  ###"
echo "### MARCA ${marca^^} ###"
echo ""
echo "-----------------------------------------------------------------------------"
read -p 'Dame el codigo del articulo: ' codigoArt
read -p 'Descripcion: ' descripcion
read -p 'Talla (XS/S/M/L) : ' tallas
read -p 'Precio: ' precio
read -p 'Stock: ' stock
echo "-----------------------------------------------------------------------------"
touch $codigoArt

echo ""
echo ""
echo "-----------------------------------------------------------------------------"
echo "CODIGO $codigoArt" > $codigoArt
echo "Descripcion: $descripcion" >> $codigoArt
echo "Talla (XS/S/M/L) : $tallas" >> $codigoArt
echo "Precio: $precio"  >> $codigoArt
echo "Stock: $stock" >> $codigoArt
echo ""
echo ""
cat $codigoArt

read -n 1 -p "Deseas volver a crear otro articulo: [s/n]" eleccion
if [[ $eleccion == 'N' || $eleccion == 'n' ]]; then
	cd ../
	bash menu.sh
elif [[ $eleccion == 'S' || $eleccion == 's' ]]; then
	articulo
else
	read -n 1 -p "Esta opcion no es valida"
fi

}


articulo() {
clear
echo "### CATEGORIA ${opcion^^}  ###"
echo "### MARCA ${marca^^} ###"
echo ""
echo "-----------------------------------------------------------------------------"
read -p 'Dame el codigo del articulo: ' codigoArt
read -p 'Descripcion: ' descripcion
read -p 'Talla (XS/S/M/L) : ' tallas
read -p 'Precio: ' precio
read -p 'Stock: ' stock
echo "-----------------------------------------------------------------------------"
echo ""
echo ""
cd ${marca^^}
touch $codigoArt

echo "-----------------------------------------------------------------------------"
echo "CODIGO $codigoArt" > $codigoArt
echo "Descripcion: $descripcion" >> $codigoArt
echo "Talla (XS/S/M/L) : $tallas" >> $codigoArt
echo "Precio: $precio"  >> $codigoArt
echo "Stock: $stock" >> $codigoArt
echo ""
cat $codigoArt
echo "-----------------------------------------------------------------------------"
read -n 1 -p "Deseas volver a crear otro articulo: [s/n]" eleccion
if [[ $eleccion == 'N' || $eleccion == 'n' ]]; then
	cd ../../../
	bash menu.sh
elif [[ $eleccion == 'S' || $eleccion == 's' ]]; then
	nuevoArticulo
else
	read -n 1 -p "Esta opcion no es valida"
fi

}

crearMarca() {
while [[ true ]]; do
	clear
	echo "### CREAR MARCA ${opcion^^}  ###"
	echo ""
	echo ""
	listadoMar
	echo ""
	echo ""
	read -p 'Dame el nombre de la categoria a crear: ' marca
	
	
	if [[ -d ${marca^^}  ]]; then
		articulo
	fi
	
	if [[ "" != ${marca^^}  ]]; then
	echo "Esta marca no existe"
	read -n 1 -p "¿Deseas crear una nueva marca? [s/n]" result
		if [[ $result == 's' || $result == 'S' ]]; then
			mkdir ${marca^^} 
		elif [[ $result == 'n' || $result == 'N' ]]; then
			crearMarca
		fi
	
	fi
done
}

listadoCat() {

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
	echo 'Para crear una categoria nueva Escribela, para volver al menu pulsa X'
	echo ""
	listadoCat
	echo ''

	read -p "Categoria: " opcion
	if [[ -d ${opcion^^}  ]]; then
		cd "CATEGORIAS/${opcion^^} "
		crearMarca
	elif [[ $opcion == 'X' || $opcion == 'x' ]]; then
		cd ../
		bash menu.sh
		break
	elif [[ "" != ${opcion^^}  ]]; then
	echo "Esta categoria no existe"
	read -n 1 -p "¿Deseas crear una nueva categoria? [s/n]" result
		if [[ $result == 's' || $result == 'S' ]]; then
			mkdir ${opcion^^}
		elif [[ $result == 'n' || $result == 'N' ]]; then
			break
		fi
	
	fi
	
     
done




