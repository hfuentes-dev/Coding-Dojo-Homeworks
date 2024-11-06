package com.tunombre.controladores;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ControladorPeliculas {
    private static HashMap<String, String> listaPeliculas = new HashMap<String, String>();

    public ControladorPeliculas() {
        listaPeliculas.put("Winnie the Pooh", "Don Hall");    
        listaPeliculas.put("El zorro y el sabueso", "Ted Berman");
        listaPeliculas.put("Tarzán", "Kevin Lima");        
        listaPeliculas.put("Mulán", "Barry Cook");
        listaPeliculas.put("Oliver", "Kevin Lima");    
        listaPeliculas.put("Big Hero 6", "Don Hall");    
    }

    @GetMapping("/peliculas")
    public String obtenerTodasLasPeliculas() {
        return String.join(", ", listaPeliculas.keySet());
    }

    @GetMapping("/peliculas/{nombre}")
    public String obtenerPeliculaPorNombre(@PathVariable String nombre) {
        String director = listaPeliculas.get(nombre);
        if (director != null) {
            return "Película: " + nombre + ", Director: " + director;
        } else {
            return "La película no se encuentra en nuestra lista";
        }
    }

    @GetMapping("/peliculas/director/{nombre}")
    public String obtenerPeliculasPorDirector(@PathVariable String nombre) {
        List<String> peliculas = listaPeliculas.entrySet().stream()
                .filter(entry -> entry.getValue().equals(nombre))
                .map(entry -> entry.getKey())
                .collect(Collectors.toList());

        if (peliculas.isEmpty()) {
            return "No contamos con películas de ese director en nuestra lista.";
        } else {
            return "Películas dirigidas por " + nombre + ": " + String.join(", ", peliculas);
        }
    }
}

