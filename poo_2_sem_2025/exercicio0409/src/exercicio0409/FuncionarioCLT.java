package exercicio0409;

public class FuncionarioCLT extends Funcionario {
	
	public double calcularSalario() { // Método para calcular salario de CLT
		
		return salarioBase + (salarioBase * 10/100);
	}
}
