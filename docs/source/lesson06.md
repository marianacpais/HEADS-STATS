# Lesson 06 - Regressão Linear - Transformação Logarítmica

A transformação logarítmica é um meio conveniente de transformar uma variável altamente assimétrica em um conjunto de dados mais normalizado.

## Equação da Regressão Linear com Transformação Logarítmica

A equação da regressão linear, após aplicar a transformação logarítmica na variável dependente \(Y\), pode ser escrita como:

\[ \log(Y) = \beta_0 + \beta_1X + \epsilon \]

Onde:
- \( \log(Y) \) é a transformação logarítmica da variável dependente \(Y\)
- \( \beta_0 \) é o intercepto da regressão
- \( \beta_1 \) é o coeficiente de regressão para a variável independente \(X\)
- \( \epsilon \) é o termo de erro

## Interpretação dos Coeficientes

> 📦 **Interpretação dos Coeficientes em Modelos Log-Transformados**
>
> Quando a variável dependente \(Y\) é transformada usando o logaritmo, o coeficiente \(\beta_1\) representa a mudança percentual esperada no logaritmo de \(Y\) para uma unidade de mudança em \(X\). Especificamente, um aumento de uma unidade em \(X\) resulta em um aumento médio de \(\beta_1\) unidades no logaritmo do resultado. Em termos práticos, se \(\beta_1\) for 0.05, isso significa que para cada aumento de uma unidade em \(X\), espera-se que o logaritmo de \(Y\) aumente em 0.05 unidades.

## Razão Geométrica Média

A partir da interpretação padrão dos parâmetros de inclinação da regressão, sabemos que cada diferença de 1 unidade em \(X\) está associada a uma diferença de \(\beta_1\) unidade no log de \(\theta\):

\[ \log(\theta_{a+1}) - \log(\theta_a) = (\beta_0 + \beta_1 \times (a + 1)) - (\beta_0 + \beta_1 \times a) = \beta_1. \]

No entanto, não achamos muito conveniente falar sobre \(\log(\theta)\). Portanto, fazemos a transformação inversa para obter declarações sobre a razão de \(\theta\) entre os grupos.

\[ e^{(\log(\theta_{a+1}) - \log(\theta_a))} = e^{\log(\frac{\theta_{a+1}}{\theta_a})} = \frac{\theta_{a+1}}{\theta_a} = e^{\beta_1}. \]

Este valor, \( e^{\beta_1} \), é chamado de **razão geométrica média** e a interpretação é semelhante à razão de chances (odds ratio).
