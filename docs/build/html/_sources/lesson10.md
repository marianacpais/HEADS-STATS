# Lesson 10 - Regressão Logística Condicional

A **análise de regressão logística** estuda a associação entre uma variável dependente binária e um conjunto de variáveis (explicativas) utilizando um modelo logit.

A **regressão logística condicional** é um tipo de regressão logística geralmente empregada quando as observações estão emparelhadas.

## Regressão Logística:

- Utiliza-se para modelar a probabilidade de um resultado binário com base em uma ou mais variáveis explicativas.
- O modelo logit é dado por:
  \[
  \text{logit}(P) = \log \left( \frac{P}{1-P} \right) = \beta_0 + \beta_1X_1 + \beta_2X_2 + \ldots + \beta_kX_k
  \]
  onde \(P\) é a probabilidade do evento de interesse ocorrer, e \(X_1, X_2, \ldots, X_k\) são as variáveis explicativas.

## Regressão Logística Condicional:

- Utilizada quando as observações são emparelhadas.
- Isso significa que as observações são agrupadas de forma que cada par (ou grupo) tem uma correspondência natural ou uma similaridade específica.
- Por exemplo, em estudos caso-controle, os casos podem ser emparelhados com controles que têm características semelhantes (como idade, gênero, etc.).

## Exemplos de Aplicação:

- Estudos de casos-controle em epidemiologia.
- Análise de correspondência em pesquisas de mercado.
