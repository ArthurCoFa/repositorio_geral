package aula0409;

public class Carro extends Automovel{
	
	public boolean temAc; // Ac = Ar condicionado
	
	// Método igual na classe Automovel, a preferência sempre é das classes filhas
	public void ligar() {
		super.ligar();
		System.out.println("Carro ligado!");
	}
}
