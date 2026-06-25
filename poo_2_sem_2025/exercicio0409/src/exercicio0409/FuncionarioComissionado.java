package exercicio0409;

public class FuncionarioComissionado extends Funcionario { 
	
	public double comissao; 
	
	public double calcularSalario() { // Método para calcular salario de comissionado
		
		return salarioBase + comissao;
	}
}
