# Lesson 01 - Regressão Linear

## Coeficiente de Correlação de Pearson

O **coeficiente de correlação de Pearson** é uma medida da 'qualidade' da aproximação da relação entre duas variáveis por uma linha reta, isto é, mede a associação linear entre duas variáveis.

### Fórmula:

\[
r = \frac{cov(x, y)}{\sqrt{var(x) var(y)}} = \frac{\sum(x_i - \bar{x})(y_i - \bar{y})}{\sqrt{\sum(x_i - \bar{x})^2 \sum(y_i - \bar{y})^2}}
\]

### Intervalo de Valores:

O coeficiente de correlação de Pearson varia entre **-1 e 1**.

- **r = 1**: Correlação positiva perfeita.
- **r = -1**: Correlação negativa perfeita.
- **r = 0**: Nenhuma correlação linear.

### Teste de Hipótese

O teste de hipótese associado à correlação não é muito informativo. Normalmente, estamos mais interessados na **força da associação linear** e não em saber se ela é significativamente diferente de zero.

## Coeficiente de Determinação (r²)

O **coeficiente de determinação (r²)** é interpretado como a quantidade de variação de uma variável que pode ser explicada pela outra.

### Fórmula:

\[ r² = (-0.814) \times (-0.814) = 0.66 \]

> **Interpretação**: A covariável A explica 66% do resultado B.

## Coeficiente de Correlação de Spearman

O **coeficiente de correlação de Spearman** é o coeficiente de correlação de Pearson aplicado às ordens dos valores em vez dos valores absolutos. É uma alternativa ao coeficiente de correlação de Pearson quando uma das variáveis tem uma distribuição assimétrica ou possui outliers.

## Modelação

Podemos usar a modelação para:

- Descrever a força da associação entre variáveis de resultado e fatores de interesse
- Ajustar para variáveis de confusão
- Identificar os fatores de risco que afetam a variável de resultado
- Fazer previsões

## Coeficientes em Regressão Linear

Os coeficientes são calculados de forma a minimizar a soma das distâncias à linha reta. Este é o **método dos mínimos quadrados**.

![Coeficientes em Regressão Linear](attachment://image.png)

## Interpretação dos Coeficientes

**Exemplo de Modelo:**

\[ \text{Mortalidade por Câncer de Estômago} = 54.503 - 0.102 \times \text{Consumo de Vegetais} \]

- \( b_0 = 54.503 \): Taxa de mortalidade prevista com consumo zero de vegetais.
- \( b_1 = -0.102 \): Diminuição prevista (porque o coeficiente é negativo) na taxa de mortalidade para um aumento de uma unidade no consumo de vegetais.

> **Interpretação Abstrata**: A covariável A representa a taxa inicial do resultado B. Um aumento de uma unidade na covariável A resulta numa alteração de \( b_1 \) unidades no resultado B.

## Tabela ANOVA

A Tabela ANOVA é utilizada para analisar a variação explicada pelo modelo.

**Tabela ANOVA:**

|             | Df  | Sum Sq   | Mean Sq  | F value |
|-------------|-----|----------|----------|---------|
| Vegetables  | 1   | 685.986  | 685.986  | 31.348  |
| Residuals   | 16  | 350.132  | 21.883   |         |

- **Variação Total**: No caso da taxa de mortalidade masculina, a variação total é de 1036.118 (685.986 + 350.132).
- **Variação Explicada**: Considerando o consumo de vegetais, a variação explicada na mortalidade é de 685.986.
- **Resíduo**: O resíduo (350.132) é simplesmente a variação que permanece inexplicada, ou seja, a diferença entre a variação total e a variação explicada.

O quociente da variação explicada pela variação total é a porcentagem de variação explicada:

\[
\frac{685.986}{1036.118} = 0.66 \text{ (66%)}
\]

Como esperado, este valor é igual ao quadrado do coeficiente de correlação (porcentagem de variação explicada):

\[
r^2 = 0.814^2 = 0.66 \text{ (66%)}
\]

> **Interpretação Abstrata**: A covariável A explica X% da variação no resultado B.

## Suposições da Regressão Linear

Para que os resultados da regressão linear sejam válidos, é necessário que algumas suposições sejam atendidas:

- **Relação Linear**: Existe uma relação linear entre a variável independente \( x \) e a variável dependente \( y \).
- **Observações Independentes**: As observações são independentes entre si.
- **Distribuição Normal**: Para cada valor fixo da variável independente, a variável dependente segue uma distribuição normal, e todas essas distribuições normais têm um desvio padrão igual.

### Como Verificar: Resíduos

Os resíduos podem ser analisados para verificar se as suposições da regressão linear são atendidas. Analisar os resíduos envolve verificar se:

- Eles possuem uma distribuição aproximadamente normal.
- Eles são independentes.
- Eles têm variância constante (homocedasticidade).
