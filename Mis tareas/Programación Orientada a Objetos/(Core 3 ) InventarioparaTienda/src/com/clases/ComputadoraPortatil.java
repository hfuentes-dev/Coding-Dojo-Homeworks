package com.clases;

public class ComputadoraPortatil extends ProductoElectrodomestico {
	private String marca;
	private int memoriaRAM;
	private String numeroSerie;
	public ComputadoraPortatil(String nombre, Double precio, int cantidadDisponible, String marca, int memoriaRAM,
			String numeroSerie) {
		super(nombre, precio, cantidadDisponible);
		this.marca = marca;
		this.memoriaRAM = memoriaRAM;
		this.numeroSerie = numeroSerie;
	}
	@Override
	public void mostrarInformacion() {
		// TODO Auto-generated method stub
		super.mostrarInformacion();
		System.out.println("marca: " + marca);
		System.out.println("memoriaRAM: " + memoriaRAM);
		System.out.println("numeroSerie: " + numeroSerie);
	}
}
