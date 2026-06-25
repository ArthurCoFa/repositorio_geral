// =========================================================
// MOCK DATA: Simulação de Estoque Físico
// =========================================================

const mockStockData = {
    // ID: { Nome, EstoqueFisico }
    '01': {
        nome: 'Refrigerante Coca-Cola 300mL Alumínio',
        estoqueFisico: 1500
    },
    '02': {
        nome: 'Suco de Uva 500mL PET',
        estoqueFisico: 800
    },
    '03': {
        nome: 'Refrigerante Coca-Cola 250mL Vidro',
        estoqueFisico: 200
    },
    '04': {
        nome: 'Água Mineral 2L',
        estoqueFisico: 5000
    }
};

// =========================================================
// FUNÇÃO PRINCIPAL: Processar a Busca e Exibir Resultados
// =========================================================

function handleSearchStock(event) {
    const searchId = document.getElementById('idProdutoSearch').value.trim();
    const tbody = document.getElementById('atp-results');
    
    // Limpa resultados anteriores
    tbody.innerHTML = ''; 

    // Limpeza de feedback
    const resultsCard = document.querySelector('.results-card');
    const existingFeedback = resultsCard.querySelector('.feedback-message');
    if (existingFeedback) existingFeedback.remove();

    let resultsFound = 0;
    
    const productsToDisplay = [];
    
    if (searchId) {
        // Busca Específica
        const product = mockStockData[searchId];
        if (product) {
            productsToDisplay.push({ id: searchId, ...product });
        }
    } else {
        // Listar Todos
        for (const id in mockStockData) {
            productsToDisplay.push({ id: id, ...mockStockData[id] });
        }
    }
    
    // ----------------------------------------------------
    // Exibir Resultados (Apenas Estoque Físico)
    // ----------------------------------------------------
    
    productsToDisplay.forEach(product => {
        const estoque = product.estoqueFisico;
        const statusClass = estoque <= 200 ? 'status-low' : 'status-ok'; // Destaque para estoque baixo (apenas visual)

        const newRow = tbody.insertRow();
        newRow.innerHTML = `
            <td>${product.id}</td>
            <td>${product.nome}</td>
            <td class="${statusClass}">${estoque.toLocaleString()} UN</td>
        `;
        resultsFound++;
    });

    // ----------------------------------------------------
    // Feedback ao Usuário
    // ----------------------------------------------------
    
    const feedbackDiv = document.createElement('div');
    feedbackDiv.className = 'feedback-message';

    if (resultsFound > 0) {
        feedbackDiv.classList.add('success');
        feedbackDiv.textContent = `${resultsFound} produto(s) encontrado(s).`;
    } else {
        feedbackDiv.classList.add('error');
        feedbackDiv.textContent = searchId 
            ? `Nenhum produto encontrado com o ID '${searchId}'.` 
            : `Nenhum produto cadastrado.`;
    }
    resultsCard.prepend(feedbackDiv);
}

// =========================================================
// FUNÇÃO DE VINCULAÇÃO
// =========================================================

document.addEventListener('DOMContentLoaded', () => {
    // Vincula o botão "BUSCAR"
    const btnSearch = document.querySelector('.btn-search');
    if (btnSearch) {
        btnSearch.addEventListener('click', handleSearchStock);
    }
    
    // Simula a busca geral ao carregar a página (lista todos se o campo estiver vazio)
    handleSearchStock(); 
});