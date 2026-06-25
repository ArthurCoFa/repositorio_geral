// =========================================================
// MOCK DATA: Simulação de Usuários (Supervisores e Vendedores)
// =========================================================

// RN-004: Simulação de usuários ativos no sistema (Para validação de existência)
const mockUsers = {
    '001': { nome: 'Ana Souza', isSupervisor: true },
    '005': { nome: 'Bruno Costa', isSupervisor: true },
    '010': { nome: 'João Silva', isSupervisor: false },
    '011': { nome: 'Maria Oliveira', isSupervisor: false },
    '012': { nome: 'Pedro Santos', isSupervisor: false }
    // IDs que o protótipo pode usar para teste
};

// Variável para armazenar temporariamente os membros da equipe que está sendo editada/criada
let currentTeamMembers = ['010', '011']; 


// =========================================================
// FUNÇÃO 1: Adicionar Vendedor (RN-004)
// =========================================================

function handleAddVendedor(event) {
    event.preventDefault(); // Impede o submit do formulário

    const vendedorIdInput = document.getElementById('vendedorId');
    const vendedorId = vendedorIdInput.value.trim();
    const membersList = document.querySelector('.members-list-box ul');
    const user = mockUsers[vendedorId];

    // Limpeza visual de feedback anterior
    const existingFeedback = document.querySelector('.form-card .feedback-message');
    if (existingFeedback) existingFeedback.remove();

    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message';
    
    // Anexa o feedback ao card para que possamos referenciá-lo facilmente
    const formCard = document.querySelector('.form-card');
    
    // ----------------------------------------------------
    // 1. Validação de Existência (RN-004)
    // ----------------------------------------------------
    if (!user) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO (RN-004): Usuário ID '${vendedorId}' não encontrado no sistema.`;
        formCard.prepend(feedbackDiv);
        return;
    }

    // ----------------------------------------------------
    // 2. Validação de Duplicidade e Tipo
    // ----------------------------------------------------
    if (user.isSupervisor) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO: ID ${vendedorId} é um Supervisor e não pode ser adicionado como Vendedor.`;
        formCard.prepend(feedbackDiv);
        return;
    }

    if (currentTeamMembers.includes(vendedorId)) {
        feedbackDiv.classList.add('warning');
        feedbackDiv.textContent = `ALERTA: Vendedor ID ${vendedorId} já está na equipe.`;
        formCard.prepend(feedbackDiv);
        return;
    }

    // ----------------------------------------------------
    // 3. Sucesso: Adiciona ao Mock Data e à Lista HTML
    // ----------------------------------------------------
    
    // Adiciona ao mock data temporário
    currentTeamMembers.push(vendedorId);

    // Cria o item da lista
    const listItem = document.createElement('li');
    listItem.setAttribute('data-id', vendedorId);
    listItem.innerHTML = `
        ${vendedorId} (${user.nome}) 
        <button type="button" class="btn-remove" onclick="removeVendedor(this, '${vendedorId}')">Remover</button>
    `;
    membersList.appendChild(listItem);

    feedbackDiv.classList.add('success');
    feedbackDiv.textContent = `Vendedor ${user.nome} (ID ${vendedorId}) adicionado com sucesso!`;
    formCard.prepend(feedbackDiv);
    
    vendedorIdInput.value = ''; // Limpa o campo
}

// =========================================================
// FUNÇÃO 2: Remover Vendedor
// =========================================================

function removeVendedor(button, id) {
    // Remove do mock data
    currentTeamMembers = currentTeamMembers.filter(memberId => memberId !== id);

    // Remove do HTML
    button.closest('li').remove();
    
    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message success';
    feedbackDiv.textContent = `Vendedor ID ${id} removido da equipe.`;
    
    const formCard = document.querySelector('.form-card');
    const existingFeedback = document.querySelector('.form-card .feedback-message');
    if (existingFeedback) existingFeedback.remove();

    formCard.prepend(feedbackDiv);
}

// =========================================================
// FUNÇÃO 3: Salvar/Criar Equipe
// =========================================================

function handleSaveTeam(event) {
    event.preventDefault();
    
    // Note: Em um ambiente real, aqui você validaria o idSupervisor (se existe e se é supervisor)
    // E checaria se a equipe tem pelo menos 1 membro.
    
    const idEquipe = document.getElementById('idEquipe').value.trim();
    const nomeEquipe = document.getElementById('nomeEquipe').value.trim();
    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message';
    
    const formCard = document.querySelector('.form-card');
    const existingFeedback = document.querySelector('.form-card .feedback-message');
    if (existingFeedback) existingFeedback.remove();

    // Simulação: Se o ID da Equipe estiver vazio, é CRIAÇÃO
    if (!idEquipe) {
        // Simula a geração de um ID
        const newId = (Math.floor(Math.random() * 100) + 3).toString().padStart(2, '0');
        document.getElementById('idEquipe').value = newId; 
        
        feedbackDiv.classList.add('success');
        feedbackDiv.textContent = `Sucesso na CRIAÇÃO! Equipe ${nomeEquipe} salva com ID ${newId}.`;
        
    } else {
        feedbackDiv.classList.add('success');
        feedbackDiv.textContent = `Sucesso na ATUALIZAÇÃO! Equipe ID ${idEquipe} salva.`;
    }
    
    formCard.prepend(feedbackDiv);
}

// =========================================================
// FUNÇÃO 4: Inicialização (Limpa e Vincula Eventos)
// =========================================================

function initializeTeamManagement() {
    // 1. Limpar a lista de membros de exemplo do HTML para que o JS a preencha
    const initialMembers = document.querySelectorAll('.members-list-box ul li');
    initialMembers.forEach(li => li.remove());

    // 2. Vínculo do botão "Adicionar" (para Vendedores)
    const btnAddVendedor = document.querySelector('.btn-add');
    if (btnAddVendedor) {
        btnAddVendedor.addEventListener('click', handleAddVendedor);
    }
    
    // 3. Vínculo do formulário "Salvar Equipe"
    const teamDetailsForm = document.querySelector('.team-details-form');
    if (teamDetailsForm) {
        teamDetailsForm.addEventListener('submit', handleSaveTeam);
    }
    
    // 4. Vínculo do botão "Criar Nova Equipe" (Simula o reset do form)
    const btnCreateNew = document.querySelector('.create-btn');
    if (btnCreateNew) {
        btnCreateNew.addEventListener('click', () => {
             alert('Simulação de Limpar/Resetar Formulário para Nova Criação.');
             teamDetailsForm.reset();
             document.getElementById('idEquipe').value = '';
        });
    }
    
    // 5. Vínculo do botão "Desativar"
    const btnDesativar = document.querySelector('.btn-secondary');
    if (btnDesativar) {
        btnDesativar.addEventListener('click', () => {
            alert('Equipe desativada com sucesso (Simulação).');
        });
    }

    // 6. Simulação: Recria a lista de membros atuais (para que o HTML não fique vazio ao carregar)
    currentTeamMembers.forEach(id => {
        const user = mockUsers[id];
        if (user) {
            const membersList = document.querySelector('.members-list-box ul');
            const listItem = document.createElement('li');
            listItem.setAttribute('data-id', id);
            listItem.innerHTML = `
                ${id} (${user.nome}) 
                <button type="button" class="btn-remove" onclick="removeVendedor(this, '${id}')">Remover</button>
            `;
            membersList.appendChild(listItem);
        }
    });
}

document.addEventListener('DOMContentLoaded', initializeTeamManagement);