package com;
import com.clases.*;
public class Aplicacion {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
TiendaElectronica tienda = new TiendaElectronica();
Televisor tv = new Televisor("Samsung", 29.990, 5, 32, "1080p");
ComputadoraPortatil laptop = new ComputadoraPortatil("MacBook Pro", 14.990, 10, "Apple", 16, "qwerty");
tienda.agregar(tv);
tienda.agregar(laptop);
tienda.venta("Samsung", 5 );
tienda.venta("MacBook Pro", 10 );
tienda.mostrar();
	}

}
