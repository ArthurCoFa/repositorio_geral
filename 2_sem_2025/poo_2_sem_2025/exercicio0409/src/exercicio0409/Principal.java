package exercicio0409;

public class Principal {
	
	public static void main(String[] args) {
		
		FuncionarioCLT f1 = new FuncionarioCLT();// Criação do objeto para CLT
		f1.cpf = "019.289.789.01"; // CPF CLT
		f1.nome = "João da Silva"; // Nome CLT
		f1.salarioBase = 1200; // Salário Base CLT
		
		
		FuncionarioComissionado f2 = new FuncionarioComissionado(); // Criação do objeto do comissionado
		f2.cpf = "123.456.789.01";// CPF comissionado
		f2.nome = "Felipe"; // Nome comissionado
		f2.salarioBase = 2000;// salário base comissionado
		f2.comissao = 100; // comissão do comissionado
		
		
		FuncionarioPJ f3 = new FuncionarioPJ();// Criação do objeto PJ
		f3.cpf = "987.654.321.00";// CPF PJ
		f3.nome = "Carlos";// Nome PJ
		f3.salarioBase = 3000;// Salario base PJ
		
		System.out.println(f1.nome);
		System.out.println(f1.calcularSalario());
		
		System.out.println(f2.nome);
		System.out.println(f2.calcularSalario());
	
		System.out.println(f3.nome);
		System.out.println(f3.calcularSalario());
	}
}
