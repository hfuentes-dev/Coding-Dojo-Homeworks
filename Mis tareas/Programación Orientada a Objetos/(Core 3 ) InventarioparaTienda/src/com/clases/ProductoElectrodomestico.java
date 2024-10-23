package com.clases;

public class ProductoElectrodomestico {
private String nombre;
private Double precio;
private int cantidadDisponible;
public ProductoElectrodomestico(String nombre, Double precio, int cantidadDisponible) {
	super();
	this.nombre = nombre;
	this.precio = precio;
	this.cantidadDisponible = cantidadDisponible;
}
public String getNombre() {
	return nombre;
}
public void setNombre(String nombre) {
	this.nombre = nombre;
}
public Double getPrecio() {
	return precio;
}
public void setPrecio(Double precio) {
	this.precio = precio;
}
public int getCantidadDisponible() {
	return cantidadDisponible;
}
public void setCantidadDisponible(int cantidadDisponible) {
	this.cantidadDisponible = cantidadDisponible;
}

public void mostrarInformacion() {
System.out.println("nombre: " + nombre);
System.out.println("precio: " + precio);
System.out.println("cantidadDisponible: " + cantidadDisponible);
}

}
