# veev_utils

Pacote de utilitarios VeeV.

## Começando

Funções:

    Cep.buscar(String cep);
        Retorna os dados do Cep informado para busca.

    Cpf.validar(String cpf);
        Retorna true(válido) ou false(inválido) para o cpf digitado.

    Extrair().numeros(String texto);
        Retorna String com os numeros que estao no texto informado.
    
    Extrair().lapd(String texto, int qtd);
        Retorna zeros a esquerda de String de acordo com a quantidade de caracteres informada em "qtd";

    Extrair().dataParaTexto(DateTime data);
        Retorna String formatada ('01/01/2020') de acordo com a data informada;
    
    Extrair().textoParaData(String data);
        Retorna DateTime de acordo com a String informada ('01/01/2020');
    
