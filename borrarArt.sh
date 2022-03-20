irCategorias() {
clear
cd ../../
echo "Ir a Categoria"

cat lista.txt

read -p "Dime la categoria a la que quieres ir: " categoria

if [[ -d ${categoria^^} ]]; then
	cd ${categoria^^}
	irMarca
else 
            echo 'El nombre no puede estar vacio'
            read -n 1 -p "Pulsa Enter para volver intentarlo. Pulsa m para volver al menú" result
            if [[ $result == 'm' || $result == 'M' ]]; then
                break
            fi
fi
	

}

listadoCod() {

touch ../otros.txt
tree -L 1 -i > ../otros.txt
sed -i '1d' ../otros.txt # eliminar la primera linea
sed -i '/^$/d' ../otros.txt #eliminar espacios en blanco 
sed -i '$ d' ../otros.txt # elimina la ultima linea
sed -i 's/[a-z]/\U&/g' ../otros.txt #cambia todos los caracteres de minuscula a mayuscula

n=1

while [[ true ]]; do
    sed -i "$n ""s/^/""$n""./" ../otros.txt
    n=$((n+1))

    #capturar la linea para saber si tiene algo escrito
    #en caso de no tener nada, para al bucle
    linea=$( sed -n "$n""p" ../otros.txt )
    if [[ $linea == "" ]]; then
        break
    fi
done


cat ../otros.txt

}

irCategoria() {
while [[ true ]]; do
clear
cd CATEGORIAS
echo "Ir a Categoria"
echo " "
echo " "
cat lista.txt
echo " "
echo " "
read -p "Dime la categoria a la que quieres ir: " categoria

if [[ -d ${categoria^^} ]]; then
	cd ${categoria^^}
	irMarca
else 
            echo 'La categoria no existe, pulsa N para ir a la creacion de categorias '
            read -n 1 -p "o pulsa m para volver a intentar :" result
            if [[ $result == 'n' || $result == 'N' ]]; then
                cd CATEGORIAS
		bash crearPro.sh
	    elif [[ $result == 'M' || $result == 'm' ]]; then
		cd ../
		bash menu.sh
            fi
fi
done

	

}

irMarca() {
while [[ true ]]; do
clear

echo "Ir a Marca"
echo " "
echo " "
cat lista.txt
echo " "
echo " "
read -p "Dime la marca a la que quieres ir: " marca

if [[ -d ${marca^^} ]]; then
	cd ${marca^^} 
	borrarArchivos
else 
            echo 'El nombre no puede estar vacio'
            read -n 1 -p "Pulsa 1 para volver intentarlo. Pulsa m para volver al menú" result
            if [[ $result == 'm' || $result == 'M' ]]; then
                cd ../../
		bash menu.sh
	    fi
fi
     
done

}

confirmacion() {
if [[ -a $codigo ]]; then
	echo "Proceso de borrado de producto"
	read -n 1 -p "'¿Has escrito $codigo ,estos datos son correctos?[s/n]': " result
	if [[ $result == 'n' || $result == 'N' ]]; then
		echo ' '
		read -n 1 -p "Pulsa una tecla para volver..."
		break
	
	elif [[ $result == 's' || $result == 'S' ]]; then
		rm $codigo
		echo ' '
		echo 'Archivo '$codigo' borrado correctamente'
		read -n 1 -p "¿Desea borrar otro archivo?[s/n]': " result2
			if [[ $result2 == 'n' || $result2 == 'N' ]]; then
				cd ../../..
				bash menu.sh
			fi
	fi
fi
}

borrarArchivos(){

while [[ true ]]; do
clear
echo ' '
echo 'BORRAR ARTICULO'
echo ' '
listadoCod
echo ' '
read -p "Escribe el codigo de articulo a borrar:  " codigo


if [[ -a $codigo ]]; then
	find $codigo
	confirmacion
elif [[ "" != $codigo ]]; then
	echo ""
	echo "No existe el producto"
	echo ""
	read -n 1 -p "Si quiere volver a introducir un codigo pulse cualquier letra, si quiere volver al menú pulse 1" tecla
	if [[ $tecla == "1" ]]; then
		cd ../../../
		bash menu.sh
	else
		echo ""
	fi
	
fi
done
}

irCategoria
