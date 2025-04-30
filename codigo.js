// Gerar um n aleatório de 1 a 100
const randomNumber = Math.floor(Math.random() * 100) + 1;

function checkGuess() {
  // Obter valor digitado pelo jogador
  const guess = parseInt(document.getElementById('guessInput').value);
  // Verificar se o palpite está correto
  if (guess === randomNumber) {
    showMessage('Parabéns! Você acertou!');
  } else if (guess < randomNumber)
  {
    showMessage('Tente um n maior.');
  }else{
    showMessage('Tente um n menor.');
  }
}

function showMessage(message) {
  // Exibir uma mensagem na tela
  document.getElementById('message').textContent = message;
}
