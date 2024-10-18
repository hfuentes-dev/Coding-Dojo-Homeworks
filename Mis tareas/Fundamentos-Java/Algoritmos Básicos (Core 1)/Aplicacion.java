import clases.Algoritmos;

public class Aplicacion {
    public static void main(String[] args) {
        // Demostración de los métodos de la clase Algoritmos

        // Test de esPar
        System.out.println("esPar(4): " + Algoritmos.esPar(4)); // true
        System.out.println("esPar(5): " + Algoritmos.esPar(5)); // false

        // Test de esPrimo
        System.out.println("esPrimo(7): " + Algoritmos.esPrimo(7)); // true
        System.out.println("esPrimo(10): " + Algoritmos.esPrimo(10)); // false

        // Test de stringEnReversa
        System.out.println("stringEnReversa('Hola'): " + Algoritmos.stringEnReversa("Hola"));

        // Test de esPalindromo
        System.out.println("esPalindromo('radar'): " + Algoritmos.esPalindromo("radar")); // true
        System.out.println("esPalindromo('hola'): " + Algoritmos.esPalindromo("hola")); // false

        // Test de secuenciaFizzBuzz
        System.out.print("Secuencia FizzBuzz (15): ");
        Algoritmos.secuenciaFizzBuzz(15); // Imprime la secuencia del 1 al 15
    }
}
