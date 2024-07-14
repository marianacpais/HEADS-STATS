# Lesson 07 - Regressão Linear - Transformação Logarítmica

A transformação logarítmica é um meio conveniente de transformar uma variável altamente assimétrica em um conjunto de dados mais normalizado.

## Interpretação dos Coeficientes

Embora a interpretação dos coeficientes não seja muito intuitiva, vamos explicar como deve ser feita:

1. **Log-Log Transformation** (Ambas as variáveis são transformadas em logaritmos)
   $$
   \log(Y) = \beta_0 + \beta_1 \log(X) + \epsilon
   $$
   - **Interpretação**: Um aumento de 1% em \(X\) está associado a uma variação de \(\beta_1\%\) em \(Y\). Em outras palavras, a elasticidade de \(Y\) em relação a \(X\) é \(\beta_1\).

2. **Log-Lin Transformation** (A variável dependente é transformada em logaritmo)
   $$
   \log(Y) = \beta_0 + \beta_1 X + \epsilon
   $$
   - **Interpretação**: Um aumento unitário em \(X\) está associado a uma variação de \(100 \cdot \beta_1\%\) em \(Y\).

3. **Lin-Log Transformation** (A variável independente é transformada em logaritmo)
   $$
   Y = \beta_0 + \beta_1 \log(X) + \epsilon
   $$
   - **Interpretação**: Um aumento de 1% em \(X\) está associado a uma variação de \(\frac{\beta_1}{100}\) unidades em \(Y\).

## Interpretação da Transformação Log-Lin com \(\log(\theta x)\)

A partir da nossa interpretação padrão dos parâmetros de inclinação da regressão, sabemos que cada diferença unitária em \(X\) está associada a uma diferença de \(\beta_1\) unidade em \(\log(\theta x)\):
$$
\log(\theta (a+1)) - \log(\theta a) = (\beta_0 + \beta_1 \times (a + 1)) - (\beta_0 + \beta_1 \times a) = \beta_1
$$

Não achamos muito conveniente falar sobre \(\log(\theta)\). Portanto, fazemos a transformação inversa para obter afirmações sobre a razão de \(\theta\) entre grupos:
$$
e^{(\log(\theta (a+1)) - \log(\theta a))} = e^{\log\left(\frac{\theta (a+1)}{\theta a}\right)} = \frac{\theta (a+1)}{\theta a} = e^{\beta_1}
$$
Essa razão é conhecida como a **razão geométrica média**.

A interpretação é semelhante à razão de chances.

Portanto, concluímos que cada diferença de 1 unidade em \(X\) está associada a uma mudança de \(e^{\beta_1}\) vezes em \(\theta\).
