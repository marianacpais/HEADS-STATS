# Lesson 04 - Regressão Logística

A principal diferença entre o modelo logístico e o modelo linear é que o desfecho é uma variável binária (dicotómica).

A regressão logística permite estimar a probabilidade associada à ocorrência de um determinado evento, dado um conjunto de covariáveis.

## Conceitos-chave:

- **Variável Binária**: No modelo logístico, a variável dependente assume apenas dois valores (por exemplo, 0 e 1), indicando a ausência ou presença de uma característica ou resultado.
- **Estimativa de Probabilidade**: A regressão logística estima a probabilidade de ocorrência de um evento com base nas variáveis independentes ou covariáveis.

## Funções Utilizadas para Modelar Variáveis Dicotómicas:

Existem várias funções com a forma "S" e limitadas entre 0 e 1. As mais utilizadas para modelar variáveis dicotómicas são:

- **Logit**: A função logit é utilizada na regressão logística e é definida como:

  \[
  \text{Logit: } P(y_i = 1 | x_i) = \frac{\exp(\beta_0 + \beta_1 x_i)}{1 + \exp(\beta_0 + \beta_1 x_i)}
  \]

  A função logit "estica" a forma em "S" para uma linha reta:

  \[
  \log \left( \frac{P(y_i = 1 | x_i)}{1 - P(y_i = 1 | x_i)} \right) = \beta_0 + \beta_1 x_i
  \]

- **Probit**: A função probit é outra abordagem para modelar variáveis dicotómicas e é definida como:

  \[
  \text{Probit: } P(y_i = 1 | x_i) = \Phi^{-1} (\beta_0 + \beta_1 x_i)
  \]

  onde \(\Phi(z)\) é a função de distribuição cumulativa da distribuição normal padrão:

  \[
  \Phi(z) = \int_{-\infty}^{z} \frac{1}{\sqrt{2\pi}} e^{-\frac{t^2}{2}} dt
  \]

## Interpretação do Modelo

> ### 💡 **Interpretação do Modelo:**
> A regressão logística permite calcular a probabilidade do desfecho (evento) para um determinado valor da covariável. Isso significa que, dado um conjunto de covariáveis, podemos estimar a probabilidade de ocorrência de um evento específico.

## Coeficientes

Vamos considerar o caso em que \(X\) é uma variável dicotómica (assume valores 0 e 1). Assumindo o modelo:

\[
P(y_i = 1 | x_i) = \frac{\exp(\beta_0 + \beta_1 x_i)}{1 + \exp(\beta_0 + \beta_1 x_i)}
\]

Designamos *odds* como o quociente entre a probabilidade do desfecho ocorrer e a probabilidade de sua não-ocorrência. Portanto, a transformação logit nada mais é do que o logaritmo de uma *odds*:

\[
\text{odds} = \frac{P(y_i = 1 | x_i)}{1 - P(y_i = 1 | x_i)}
\]

\[
\log(\text{odds}) = \beta_0 + \beta_1 x_i
\]

Os coeficientes de regressão logística (\(\beta\)) podem então ser interpretados como razões de *odds* (log). Ou seja, as *odds* de \(y = 1\) aumentam \(\exp(\beta)\) vezes, quando a variável \(x\) aumenta em uma unidade (isto também é válido para \(x\) contínua).

## Exemplo de Interpretação dos Coeficientes

> ### 💡 **Interpretação dos Coeficientes:**
> Em nosso exemplo, um aumento de uma unidade em \(X\) corresponde a um aumento de \(e^{\beta} = 1.117\) vezes nas *odds* do desfecho ocorrer.
>
> Atenção: um aumento de 10 unidades em \(X\) corresponde a um aumento de \(e^{0.111 \times 10} = e^{1.11} = 3.03\) nas *odds* do desfecho ocorrer, e não \(1.117 \times 10 = 11.17\).

## Inferência

> ### 🔍 **Inferência:**
> Existem várias formas diferentes de fazer inferência em regressão logística, incluindo:
>
> - **Intervalos de Confiança (IC):** Intervalos de confiança para os coeficientes de regressão podem ser obtidos usando a distribuição assintótica dos estimadores de máxima verossimilhança.
>
>   \[
>   IC_{95\%}(\beta_1) = [ \hat{\beta}_1 - 1.96 \times SE; \hat{\beta}_1 + 1.96 \times SE ]
>   \]
>
>   Também podemos obter o IC para \(\exp(\beta)\), ou seja, o IC para a razão de *odds*.
>
> - **Testes de Hipóteses:** Existem vários testes de hipóteses para verificar se os coeficientes de regressão são diferentes de 0:
>
>   - **Teste de Wald:** Baseado na distribuição assintótica do estimador.
>
>     - **H0: \(\beta_1 = 0\)**
>
>   - **Teste de Razão de Verossimilhança:** Compara a verossimilhança de um modelo com a covariável (modelo A) e sem a covariável (modelo B).

## Variação

> ### 📊 **Variação:**
> Existem medidas de "Pseudo" \(R^2\) que avaliam a quantidade de variação explicada pelo modelo. Estas incluem:
>
> - **Pseudo \(R^2\) de Cox & Snell:** Baseado na log-verossimilhança do modelo. Tem um valor máximo teórico (para o modelo "perfeito") inferior a 1.
> - **Pseudo \(R^2\) de Nagelkerke:** Baseado no anterior, mas ajustado para que o valor máximo teórico seja 1.

## Regressão Logística Múltipla

A extensão do modelo de regressão logística para múltiplas covariáveis é imediata:
Os coeficientes são interpretados como razões de *odds* ajustadas para outras covariáveis.

Existem dois pontos-chave neste processo:

1. **Escolha das Variáveis a Integrar no Modelo:**
   - A seleção cuidadosa das variáveis que serão incluídas no modelo é crucial para garantir a validade e a precisão das inferências.

2. **Avaliação da Adequação do Modelo:**
   - **Avaliação Geral:** Verificação da qualidade do ajuste do modelo em relação aos dados observados.
   - **Avaliação das Covariáveis Individuais:** Análise do impacto e significância de cada covariável no modelo.
