// =========================================================
// MOCK DATA SIMPLIFICADO: Produtos e Estoque/ATP
// =========================================================

const mockProductData = {
    // Produto 1: Com Promoção e Estoque MUITO BAIXO (para testar BLOQUEIO)
    '01': {
        idDisplay: '01',
        nome: 'Refrigerante Coca-Cola 1L PET',
        precoPadrao: 7.50,
        precoPromocional: 5.99, 
        nomePromocao: 'Campanha de Verão',
        estoqueATP: 5 // Estoque baixo
    },
    // Produto 2: Sem Promoção e Estoque Saudável (teste PREÇO PADRÃO)
    '02': {
        idDisplay: '02',
        nome: 'Água Mineral 500ml',
        precoPadrao: 2.00,
        precoPromocional: null, 
        nomePromocao: 'Não Possui',
        estoqueATP: 1200
    },
    // Produto 3: Com Promoção e Estoque Suficiente
    '03': {
        idDisplay: '03',
        nome: 'Refrigerante Coca-Cola 350ML Vidro',
        precoPadrao: 6.50,
        precoPromocional: 5.80, 
        nomePromocao: 'Natal 2025',
        estoqueATP: 500
    }
};

// =========================================================
// FUNÇÃO 1: Adicionar Produto ao Pedido
// =========================================================

function handleAddProductToOrder(event) {
    // ESSENCIAL: Impede o recarregamento da página (comportamento padrão do form submit)
    event.preventDefault();

    const idCliente = document.getElementById('idCliente').value.trim(); 
    const idProduto = document.getElementById('idProduto').value.toUpperCase().trim();
    const quantidade = parseInt(document.getElementById('quantidade').value);
    const tbody = document.getElementById('product-details');
    const feedbackDiv = document.getElementById('pedido-feedback');

    // Limpeza de feedback
    feedbackDiv.textContent = '';
    feedbackDiv.className = 'feedback-message';

    const productData = mockProductData[idProduto];
    
    if (!productData) {
        displayFeedback(feedbackDiv, 'ERRO: Produto não encontrado.', 'error');
        return;
    }
    if (isNaN(quantidade) || quantidade <= 0) {
        displayFeedback(feedbackDiv, 'ERRO: Quantidade deve ser um número inteiro positivo.', 'error');
        return;
    }

    // ----------------------------------------------------
    // 2. Lógica MGE: Validação de Estoque (BLOQUEIO)
    // ----------------------------------------------------
    const atpDisponivel = productData.estoqueATP;
    
    if (atpDisponivel < quantidade) {
        displayFeedback(feedbackDiv, `BLOQUEADO: Estoque insuficiente! Disponível: ${atpDisponivel} UN. Necessário: ${quantidade} UN.`, 'error');
        return; // Impede que o produto seja adicionado
    }
    
    // ----------------------------------------------------
    // 3. Lógica MCP: Precificação (RF-002)
    // ----------------------------------------------------
    const precoPadraoFormatado = `R$ ${productData.precoPadrao.toFixed(2)}`;
    let precoFinalCell;
    let precoFinal;

    if (productData.precoPromocional) {
        precoFinal = productData.precoPromocional;
        precoFinalCell = `<td class="promo-price">R$ ${precoFinal.toFixed(2)} (${productData.nomePromocao})</td>`;
    } else {
        precoFinal = productData.precoPadrao;
        precoFinalCell = `<td class="no-promo">Não Possui</td>`;
    }
    
    const subtotal = quantidade * precoFinal;

    // ----------------------------------------------------
    // 4. Adição à Tabela (Simulação de Carrinho)
    // ----------------------------------------------------

    const newRow = tbody.insertRow();
    newRow.innerHTML = `
        <td>${idCliente}</td>
        <td>${productData.idDisplay}</td>
        <td>${productData.nome}</td>
        <td>${precoPadraoFormatado}</td>
        ${precoFinalCell}
        <td>${quantidade}</td>
        <td>R$ ${subtotal.toFixed(2)}</td>
        <td><button type="button" class="btn-remove" onclick="removeRow(this)">X</button></td>
    `;
    
    // Limpa campos para nova entrada
    document.getElementById('idProduto').value = '';
    document.getElementById('quantidade').value = '10';
    
    displayFeedback(feedbackDiv, `Produto adicionado com sucesso. Subtotal: R$ ${subtotal.toFixed(2)}.`, 'success');
}

// =========================================================
// FUNÇÕES DE UTILIDADE E VINCULAÇÃO
// =========================================================

function removeRow(button) {
    button.closest('tr').remove();
}

function displayFeedback(div, message, type) {
    div.textContent = message;
    div.className = 'feedback-message ' + type;
}

document.addEventListener('DOMContentLoaded', () => {
    // CORREÇÃO: Busca o formulário pelo ID adicionado
    const pedidoForm = document.getElementById('pedidoForm'); 
    
    if (pedidoForm) {
        // Vincula a adição do produto ao SUBMIT do formulário
        pedidoForm.addEventListener('submit', handleAddProductToOrder);
    } else {
        console.error("ERRO: Formulário 'pedidoForm' não encontrado. Verifique o HTML.");
    }
    
    const btnFinalizar = document.querySelector('.btn-secondary');
    if (btnFinalizar) {
        btnFinalizar.addEventListener('click', () => {
            alert('PEDIDO FINALIZADO (Simulação de envio ao backend).');
        });
    }
});