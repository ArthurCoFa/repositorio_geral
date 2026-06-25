// =========================================================
// MOCK DATA: Simulação de Estoque Físico Atual
// =========================================================

const mockStockData = {
    // ID: { Nome, EstoqueFisico }
    '01': { nome: 'Coca-Cola 300mL Alumínio', estoqueFisico: 1500 },
    '002': { nome: 'Suco de Uva 500mL PET', estoqueFisico: 50 }, // Estoque baixo para testar RN-005
    '03': { nome: 'Coca-Cola 250mL Vidro', estoqueFisico: 200 }
};

// =========================================================
// FUNÇÃO PRINCIPAL: Processar Movimentação (RN-005)
// =========================================================

function handleMovimentacao(event) {
    event.preventDefault();

    const tipoMovimentacao = document.getElementById('tipoMovimentacao').value;
    const idProduto = document.getElementById('idProduto').value.trim();
    const quantidade = parseInt(document.getElementById('quantidade').value);
    
    const formContainer = document.querySelector('.form-container');
    
    // Limpeza de feedback anterior
    const existingFeedback = formContainer.querySelector('.feedback-message');
    if (existingFeedback) existingFeedback.remove();

    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message';

    const product = mockStockData[idProduto];

    // ----------------------------------------------------
    // 1. Validação de Entrada e Existência
    // ----------------------------------------------------
    if (!product) {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = `ERRO: Produto ID '${idProduto}' não encontrado no cadastro.`;
        formContainer.prepend(feedbackDiv);
        return;
    }
    if (tipoMovimentacao === "") {
         feedbackDiv.classList.add('error');
         feedbackDiv.textContent = `ERRO: Selecione o Tipo de Movimentação (ENTRADA ou SAÍDA).`;
         formContainer.prepend(feedbackDiv);
         return;
    }

    let novoEstoque = product.estoqueFisico;

    // ----------------------------------------------------
    // 2. Lógica de Movimentação (RN-005)
    // ----------------------------------------------------

    if (tipoMovimentacao === 'ENTRADA') {
        novoEstoque += quantidade;
        
    } else if (tipoMovimentacao === 'SAIDA') {
        // Validação RN-005: Saldo não pode ser negativo
        if (product.estoqueFisico < quantidade) {
            feedbackDiv.classList.add('error');
            feedbackDiv.textContent = `ERRO (RN-005): Saldo insuficiente. Estoque atual: ${product.estoqueFisico} UN. Saída solicitada: ${quantidade} UN.`;
            formContainer.prepend(feedbackDiv);
            return;
        }
        novoEstoque -= quantidade;
    }

    // ----------------------------------------------------
    // 3. Sucesso e Atualização do Mock Data
    // ----------------------------------------------------
    
    // Simulação da atualização do estoque
    const estoqueAntigo = product.estoqueFisico;
    product.estoqueFisico = novoEstoque;

    feedbackDiv.classList.add('success');
    feedbackDiv.innerHTML = `
        <p>✅ **Movimentação Registrada:** ${tipoMovimentacao} de ${quantidade} UN do produto **${product.nome}**.</p>
        <p>Estoque anterior: ${estoqueAntigo} UN | **Novo Estoque: ${novoEstoque} UN**</p>
    `;
    formContainer.prepend(feedbackDiv);
    
    // Limpar o formulário (inputs de produto e quantidade)
    document.getElementById('idProduto').value = '';
    document.getElementById('quantidade').value = '';
    document.getElementById('tipoMovimentacao').value = ''; 
}

// =========================================================
// FUNÇÃO DE VINCULAÇÃO
// =========================================================

document.addEventListener('DOMContentLoaded', () => {
    const movimentacaoForm = document.querySelector('.movimentacao-form');
    if (movimentacaoForm) {
        movimentacaoForm.addEventListener('submit', handleMovimentacao);
    }
});