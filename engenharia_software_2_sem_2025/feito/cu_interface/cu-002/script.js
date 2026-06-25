const mockExistingCampaigns = {
    '01': { nome: 'Promoção Junina', idCampanha: '01' },
    '02': { nome: 'Campanha Natal', idCampanha: '02' },
    '03': { nome: 'Carnaval', idCampanha: '03' }
};
const mockProductPrices = { // Valores dos produtos de acordo com seus id
    '01': { // Id para digitar
        precoPadrao: 6.50, // Preço padrão para comparação
        nome: 'Coca-Cola 1L PET', // Nome que vai aparecer na tabela
        idDisplay: '01' // Id que vai aparecer na tabela
    },
    '02': { 
        precoPadrao: 5.00, 
        nome: 'Suco de Uva 500ML', 
        idDisplay: '02' 
    },
    '03': { 
        precoPadrao: 2.99, 
        nome: 'Água Mineral 2L', 
        idDisplay: '03' 
    },
    '04': { 
        precoPadrao: 7.50, 
        nome: 'Refrigerante Citrus 1L', 
        idDisplay: '04' 
    }
};


// Função para adicionar produtos na campanha, no caso ela não existe por não estar
function handleAddProduct(event) {
    event.preventDefault();

    const idCampanhaDisplay = document.getElementById('idCampanhaProduto').value.trim();
    const idProduto = document.getElementById('idProduto').value.toUpperCase().trim();
    const precoPromocional = parseFloat(document.getElementById('precoPromocional').value);
    const tbody = document.querySelector('.product-list-table tbody');
    
    // Elemento para feedback (será colocado dentro do card de produtos)
    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message';

    // Limpeza de feedback anterior
    const existingFeedback = document.querySelector('.produtos-card .feedback-message');
    if (existingFeedback) existingFeedback.remove();

    // ----------------------------------------------------
    // 1. Validação de Existência da Campanha (USABILIDADE/INTEGRIDADE)
    // ----------------------------------------------------
    const campanha = mockExistingCampaigns[idCampanhaDisplay];

    if (!campanha) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO: Campanha ID '${idCampanhaDisplay}' não encontrada ou não está ativa. Verifique o ID.`;
        document.querySelector('.produtos-card').prepend(feedbackDiv);
        return; 
    }

    const nomeCampanha = campanha.nome;

    // ----------------------------------------------------
    // 2. Validação de Existência do Produto
    // ----------------------------------------------------
    const productData = mockProductPrices[idProduto]; 
    
    if (!productData) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO: Produto ID '${idProduto}' não encontrado no cadastro de produtos.`;
        document.querySelector('.produtos-card').prepend(feedbackDiv);
        return;
    }

    const precoPadrao = productData.precoPadrao;

    // ----------------------------------------------------
    // 3. Validação RN-001: Preço Promocional deve ser menor que o Preço Padrão
    // ----------------------------------------------------
    if (precoPromocional >= precoPadrao) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO (RN-001): O Preço Promocional (R$ ${precoPromocional.toFixed(2)}) deve ser menor que o Preço Padrão (R$ ${precoPadrao.toFixed(2)}).`;
        document.querySelector('.produtos-card').prepend(feedbackDiv);
        return;
    }

    // ----------------------------------------------------
    // 4. Sucesso: Adiciona Linha na Tabela e Feedback
    // ----------------------------------------------------
    const newRow = tbody.insertRow();
    newRow.innerHTML = `
        <td>${idCampanhaDisplay}</td>
        <td>${nomeCampanha}</td>
        <td>${productData.idDisplay}</td>
        <td>${productData.nome}</td>
        <td>R$ ${precoPromocional.toFixed(2)}</td>
        <td><button class="btn-remove" onclick="removeProduct(this)">X</button></td>
    `;
    
    feedbackDiv.classList.add('success');
    feedbackDiv.textContent = `Produto ${productData.nome} adicionado à campanha "${nomeCampanha}".`;
    document.querySelector('.produtos-card').prepend(feedbackDiv);
    
    document.getElementById('add-product-form').reset();
}

// Função para remover produto da tabela (simulação)
function removeProduct(button) {
    const row = button.parentNode.parentNode;
    row.remove();
    alert("Produto removido com sucesso.");
}


// =========================================================
// FUNÇÃO 2: Validação de Datas da Campanha e Submissão
// =========================================================

function handleSaveCampanha(event) {
    event.preventDefault();

    const dataInicio = new Date(document.getElementById('dataInicio').value);
    const dataFim = new Date(document.getElementById('dataFim').value);
    const idCampanha = document.getElementById('idCampanha').value.trim();
    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message';

    // Remove feedback anterior
    const existingFeedback = document.querySelector('.campanha-form-card .feedback-message');
    if (existingFeedback) existingFeedback.remove();

    // 1. Validação de Datas (Data de Início não pode ser depois da Data de Fim)
    if (dataInicio >= dataFim) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO: A Data de Início deve ser anterior à Data de Fim.`;
        document.querySelector('.campanha-form-card').prepend(feedbackDiv);
        return;
    }

    // 2. Simulação de Sucesso e Gravação
    const acao = idCampanha ? 'ATUALIZAÇÃO' : 'CRIAÇÃO';
    
    feedbackDiv.classList.add('success');
    feedbackDiv.textContent = `Sucesso na ${acao} da Campanha!`;
    document.querySelector('.campanha-form-card').prepend(feedbackDiv);

    // Na vida real, o código aqui enviaria os dados ao backend
}


// =========================================================
// VINCULAÇÃO DOS EVENTOS (DOMContentLoaded)
// =========================================================

document.addEventListener('DOMContentLoaded', () => {
    // 1. Vínculo do formulário de Adicionar Produto
    const addProductForm = document.getElementById('add-product-form');
    if (addProductForm) {
        addProductForm.addEventListener('submit', handleAddProduct);
    }
    
    // 2. Vínculo do formulário de Salvar Campanha
    const campanhaDetailsForm = document.getElementById('campanha-details-form');
    if (campanhaDetailsForm) {
        campanhaDetailsForm.addEventListener('submit', handleSaveCampanha);
    }
});