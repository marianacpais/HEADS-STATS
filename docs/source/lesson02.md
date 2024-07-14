
# Lesson 02 - Avaliação de Modelos

## Modelos Aninhados (Nested Models)
Um modelo \( M1 \) é aninhado em um modelo \( M2 \) se os parâmetros do modelo \( M1 \) são um subconjunto dos parâmetros do modelo \( M2 \).

### Comparação de Modelos Aninhados

#### ANOVA (Análise de Variância)
- **Requisitos**: O modelo \( M1 \) deve estar aninhado no modelo \( M2 \).
- **Instrução em R**:
  ```R
  anova(m1, m2)
  ```
  onde `m1` e `m2` são os modelos cuja qualidade de ajuste está sendo comparada.

### Comparação de Modelos Não Aninhados

#### Critérios de Informação
- **AIC: Critério de Informação de Akaike**
  \[
  AIC = -2LL + 2p
  \]
- **BIC: Critério de Informação Bayesiano**
  \[
  BIC = -2LL + p \cdot \log(n)
  \]
  onde \( LL \) é o valor da função de log-verossimilhança do modelo, \( p \) é o número de parâmetros de regressão e \( n \) é o número de observações.

  Quanto menor o critério de informação, melhor é o modelo.

- **Instrução em R**:
  ```R
  extractAIC(object, ..., k)
  ```
  onde:
  - `object` é o modelo.
  - `k` é a penalização a ser usada: `k=2` dá o AIC; `k = log(n)` dá o BIC.

#### Comparação de Modelos Lineares Não Aninhados usando \( R^2 \)
- O coeficiente de determinação \( R^2 \) também pode ser utilizado para a comparação de modelos lineares não aninhados.
