
# Lesson 05 - Regressão Logística - Avaliação dos Modelos

## Goodness of Fit (Ajuste do Modelo)
- **Definição:** É a comparação entre o resultado observado e o previsto pelo modelo.
- **Objetivo:** Avaliar quão bem o modelo está ajustado aos dados observados.
- **Exemplos de Testes:**
  - **Teste de Hosmer-Lemeshow:** Avalia a calibração do modelo comparando os resultados observados e esperados em diferentes grupos de risco.
  - **Deviance:** Mede a diferença entre o modelo ajustado e o modelo perfeito. Um deviance baixo indica um bom ajuste.

## Discriminação
- **Definição:** Avalia a capacidade do modelo em classificar corretamente um indivíduo baseado nas covariáveis do modelo.
- **Objetivo:** Determinar a habilidade do modelo em distinguir entre diferentes categorias de resposta.
- **Medidas de Discriminação:**
  - **Sensibilidade (Sensitivity):** \( P(	ext{subject i rated 1} \,|\, y_i^{obs}=1) \)
    - A capacidade do modelo em identificar corretamente os verdadeiros positivos.
  - **Especificidade (Specificity):** \( P(	ext{subject i rated 0} \,|\, y_i^{obs}=0) \)
    - A capacidade do modelo em identificar corretamente os verdadeiros negativos.
  - **AUC-ROC (Área sob a curva ROC):** Mede a capacidade do modelo em distinguir entre classes. Um valor próximo de 1 indica excelente discriminação.

## Teste de Hosmer-Lemeshow
- **Objetivo:** Comparar os valores previstos com os valores observados.
- **Desafio:** As observações são binárias, mas o modelo prevê probabilidades.
- **Procedimento:**
  - Calcular para cada indivíduo a probabilidade \( P(y=1|x) \) prevista pelo modelo.
  - Considerar os decis (percentis de 10%, 20%, ..., 90%) das probabilidades previstas pelo modelo.
  - Em cada decil, calcular o número de indivíduos com o evento observado e comparar com o esperado.

## Classificação com Probabilidade Prevista
- **Desafio:** Para classificar um sujeito baseado numa probabilidade prevista (variável contínua), é necessário estabelecer uma regra (um ponto de corte).
- **Ponto de Corte (Cut-off):**
  - O ponto de corte é a probabilidade acima da qual classificamos um indivíduo como tendo o evento.
  - A escolha do ponto de corte pode afetar a sensibilidade e a especificidade do modelo.
  - Um ponto de corte comum é 0.5, mas pode ser ajustado dependendo do contexto e das consequências dos erros de classificação.

## Curva ROC (Receiver Operating Characteristic)
- **Definição:** É um gráfico que mostra a performance de um modelo de classificação binária.
- **Eixos da Curva ROC:**
  - Eixo X: 1 - Especificidade (Taxa de Falsos Positivos)
  - Eixo Y: Sensibilidade (Taxa de Verdadeiros Positivos)
- **AUC-ROC (Área sob a Curva ROC):** Mede a capacidade do modelo em distinguir entre classes. Um valor próximo de 1 indica excelente discriminação.
- **Importância da Curva ROC:** Independentemente do critério usado (como um único ponto de corte), a curva ROC fornece uma visão mais completa da capacidade do modelo em discriminar, mostrando a trade-off entre sensibilidade e especificidade para todos os possíveis pontos de corte.
- **Equilíbrio entre Sensibilidade e Especificidade:** Sensibilidade e especificidade são características difíceis de balancear. Aumentar uma geralmente leva à diminuição da outra. A curva ROC representa esta relação antagonista ao longo de um continuum de valores de "cutoff".

## Área sob a Curva (AUC-ROC)
- **Definição:** A área sob a curva ROC (AUC-ROC) é uma métrica que resume a performance do modelo de classificação ao longo de todos os pontos de corte possíveis.
- **Interpretação:**
  - AUC = 1: Perfeita capacidade de discriminação (modelo ideal).
  - AUC = 0.5: Incapacidade de discriminar (equivalente a uma classificação aleatória).
  - AUC < 0.5: Desempenho pior que a classificação aleatória (raramente ocorre em prática e pode indicar um erro no modelo).
- **Como Avaliar:**
  - **Excelente Discriminação:** AUC entre 0.9 e 1.
  - **Boa Discriminação:** AUC entre 0.8 e 0.9.
  - **Moderada Discriminação:** AUC entre 0.7 e 0.8.
  - **Pobre Discriminação:** AUC entre 0.6 e 0.7.
  - **Fraca Discriminação:** AUC entre 0.5 e 0.6.

## Resumo
- **Goodness of Fit** avalia a calibração do modelo, ou seja, como os resultados previstos se alinham com os resultados observados.
- **Discriminação** mede a capacidade do modelo em classificar corretamente os indivíduos com base nas covariáveis fornecidas.
- **Teste de Hosmer-Lemeshow:** Um método específico para avaliar a calibração, comparando os valores observados e previstos em diferentes grupos de risco.
- **Classificação com Probabilidade Prevista:** Necessita de um ponto de corte para converter a probabilidade contínua em uma classificação binária.
- **Curva ROC:** Fornece uma visão abrangente da capacidade de discriminação do modelo, mostrando a relação entre sensibilidade e especificidade para todos os pontos de corte possíveis, destacando a dificuldade de balancear ambas simultaneamente.
- **Área sob a Curva (AUC-ROC):** Uma métrica que resume a performance do modelo de classificação, com valores mais altos indicando melhor discriminação.
