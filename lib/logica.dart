int somatorioDivisiveis3ou5(int numero) {
  // Inicializando a variável de somatório
  int somatorio = 0;

  // Iterando sobre os números menores que o número fornecido
  for (int i = 3; i < numero; i++) {
    // Verificando se o número é divisível por 3 ou 5
    if (i % 3 == 0 || i % 5 == 0) {
      // Adicionando o número ao somatório
      somatorio += i;
    }
  }

  return somatorio;
}

void main() {
  // Exemplos de uso:
  print(somatorioDivisiveis3ou5(10)); // Saída esperada: 23
  print(somatorioDivisiveis3ou5(11)); // Saída esperada: 33
}
