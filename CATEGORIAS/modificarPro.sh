

listadoCod() {

cd ${marca^^}
touch ../modificar.txt
tree -L 1 -i > ../modificar.txt
sed -i '1d' ../modificar.txt # eliminar la primera linea
sed -i '/^$/d' ../modificar.txt #eliminar espacios en blanco 
sed -i '$ d' ../modificar.txt # elimina la ultima linea
sed -i 's/[a-z]/\U&/g' ../modificar.txt #cambia todos los caracteres de minuscula a mayuscula

n=1

while [[ true ]]; do
    sed -i "$n ""s/^/""$n""./" ../modificar.txt
    n=$((n+1))

    #capturar la linea para saber si tiene algo escrito
    #en caso de no tener nada, para al bucle
    linea=$( sed -n "$n""p" ../modificar.txt )
    if [[ $linea == "" ]]; then
        break
    fi
done


cat ../modificar.txt

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
listadoCod
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
listadoCod
echo ""
echo "-----------------------------------------------------------------------------"
read -p 'Dame el codigo del articulo: ' codigoArt
echo ""

	if [[ -a $codigoArt  ]]; then
	modificarArticulo
	fi
	
	if [[ "" != $codigoArt  ]]; then
	echo "Este codigo no existe"
	read -n 1 -p "¿Deseas volver a intentarlo? [s/n]" result
		if [[ $result == 's' || $result == 'S' ]]; then
			cd ../
			articulo
		elif [[ $result == 'n' || $result == 'N' ]]; then
			cd ../../../
			bash menu.sh
		fi
	
	fi

}

modificarArticulo(){

cat $codigoArt
		echo ""
		echo "Dame la modificacion del producto: "
		read -p 'Descripcion: ' descripcion
		read -p 'Talla (XS/S/M/L) : ' tallas
		read -p 'Precio: ' precio
		read -p 'Stock: ' stock
		echo "-----------------------------------------------------------------------------"
		echo ""
		echo ""
		clear
		echo "Datos nuevos del producto modificado: "
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
		read -n 1 -p "Deseas volver a modificar otro articulo: [s/n]" eleccion
		if [[ $eleccion == 'N' || $eleccion == 'n' ]]; then
			cd ../../../
			bash menu.sh
		elif [[ $eleccion == 'S' || $eleccion == 's' ]]; then
			cd ../
			articulo
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
	read -n 1 -p "¿Deseas volver a intentarlo? [s/n]" result
		if [[ $result == 's' || $result == 'S' ]]; then
			crearMarca
		elif [[ $result == 'n' || $result == 'N' ]]; then
			cd ../../
			bash menu.sh
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
meu() {
while [[ true ]]; do
	clear
	echo '### MODIFICAR PRODUCTO ###'
	echo ''
	echo ""
	listadoCat
	echo ''

	read -p "Elige la Categoria: " opcion
	if [[ -d ${opcion^^}  ]]; then
		cd "CATEGORIAS/${opcion^^} "
		crearMarca
	elif [[ "" != ${opcion^^}  ]]; then
	echo "Esta categoria no existe"
	read -n 1 -p "¿Deseas volver a intentarlo? [s/n]" result
		if [[ $result == 's' || $result == 'S' ]]; then
			meu
		elif [[ $result == 'n' || $result == 'N' ]]; then
			cd ../
			bash menu.sh
		fi
	
	fi
	
     
done

}
meu




