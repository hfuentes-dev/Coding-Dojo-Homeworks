package com.clases;
import java.util.ArrayList;

public class TiendaElectronica {
private ArrayList<ProductoElectrodomestico>listaDeProductos = new ArrayList<>();
public void agregar (ProductoElectrodomestico producto) {
	listaDeProductos.add(producto);
}

public void mostrar () {
	for(ProductoElectrodomestico producto : listaDeProductos) {
	producto.mostrarInformacion();
	System.out.println();
	}
}
	public ProductoElectrodomestico buscar (String nombre) {
		for(ProductoElectrodomestico producto : listaDeProductos) {
		if(producto.getNombre().equalsIgnoreCase(nombre)) {
			return producto;
		
		}
		} return null;
}
	public void venta(String nombreProducto , int cantidad) {
		ProductoElectrodomestico producto = buscar(nombreProducto);
		if(producto != null) {
			if(producto.getCantidadDisponible() >= cantidad ) {
				producto.setCantidadDisponible(producto.getCantidadDisponible()-cantidad);
				System.out.println("La venta ha sido realizada." + cantidad + " unidades De " + nombreProducto );
			}else {
				System.out.println("Producto agotado." + nombreProducto);
			}
		}
	}
}
