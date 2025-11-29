// Simulação do MGET - Credenciais Válidas (CU-001)
const mockUsers = {
    // Vendedor (Perfil Básico)
    'vendedor1': { senha: '123', perfil: 'Vendedor' },
    // Gerente (Perfil Acesso Total)
    'gerente1': { senha: '456', perfil: 'Gerente Comercial' },
    // Operador de Estoque (Para CU-006)
    'estoque1': { senha: '789', perfil: 'Operador de Estoque' }
};

function handleLogin(event) {
    // Impede o envio padrão do formulário (que recarregaria a página)
    event.preventDefault();

    const usernameInput = document.getElementById('username').value.toLowerCase().trim();
    const passwordInput = document.getElementById('password').value.trim();
    const feedbackDiv = document.getElementById('login-feedback');
    
    // Limpar mensagens anteriores
    feedbackDiv.textContent = '';
    feedbackDiv.className = 'feedback-message';

    const user = mockUsers[usernameInput];

    if (user && user.senha === passwordInput) {
        // Sucesso na Autenticação
        feedbackDiv.textContent = `Sucesso! Bem-vindo(a), ${user.perfil}. Redirecionando...`;
        feedbackDiv.classList.add('success');
        
        // Simulação de Redirecionamento (Média Fidelidade)
        setTimeout(() => {
            alert(`LOGIN BEM SUCEDIDO. Perfil: ${user.perfil}. Você seria redirecionado para o Dashboard.`);
            // Na vida real, haveria um window.location.href para a dashboard.html
            // Aqui, apenas limpamos o formulário para simular o reset.
            document.getElementById('loginForm').reset();
        }, 1500);

    } else {
        // Falha na Autenticação
        feedbackDiv.textContent = 'Usuário ou senha inválidos. Tente novamente.';
        feedbackDiv.classList.add('error');
    }
}

function handleForgotPassword(event) {
    // Impede a navegação padrão do link (que levaria ao topo da página)
    event.preventDefault();

    const feedbackDiv = document.getElementById('login-feedback');
    
    // Limpa o feedback de login, se houver
    feedbackDiv.textContent = '';
    feedbackDiv.className = 'feedback-message';

    // Exibe a mensagem de recuperação de senha
    feedbackDiv.textContent = 'Instruções enviadas para o e-mail cadastrado. Verifique sua caixa de entrada, spam ou lixo eletrônico.';
    feedbackDiv.classList.add('info'); // Uma nova classe para mensagens informativas
}
// ----------------------------------------------------
// 3. Vinculação ao Evento de Submit do Formulário
// ----------------------------------------------------
document.addEventListener('DOMContentLoaded', () => {
    // 1. Liga o evento de SUBMIT do formulário
    const loginForm = document.querySelector('form');
    if (loginForm) {
        loginForm.addEventListener('submit', handleLogin);
    }

    // 2. Liga o evento de CLIQUE do link
    const forgotLink = document.getElementById('forgot-password-link');
    if (forgotLink) {
        forgotLink.addEventListener('click', handleForgotPassword);
        console.log("Link de esqueci a senha vinculado com sucesso.");
    } else {
        console.error("ERRO: Elemento 'forgot-password-link' não encontrado no HTML.");
    }
});