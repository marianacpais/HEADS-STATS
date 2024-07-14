# Lesson 03 - Multiple Linear regression


A regressão linear múltipla é uma extensão do modelo de regressão linear simples para várias covariáveis.

\[ y_i = eta_0 + eta_1 x_{1i} + \cdots + eta_k x_{ki} + \epsilon_i, \quad \epsilon_i \sim N(0, \sigma^2) \]

\[ \mu_{y_i | x_{1i}, x_{2i}, \ldots, x_{ki}} = eta_0 + eta_1 x_{1i} + \cdots eta_k x_{ki} \]

---

## **INTERPRETAÇÃO:**
> Mantendo as outras variáveis constantes, o desfecho \(y\) aumenta em média \(eta_j\) unidades para cada unidade de aumento da covariável \(x_j\).

---

## Análise de Variância (ANOVA) na Regressão Linear Múltipla

A ANOVA na regressão linear múltipla é usada para determinar quanta variação da variável dependente \(y\) pode ser explicada pelo modelo.

### Componentes da Tabela ANOVA
- **Df (Degrees of Freedom)**: Graus de liberdade para cada componente do modelo.
- **Sum Sq (Soma dos Quadrados)**: Medida da variação total explicada por cada variável e pelos resíduos.
- **Mean Sq (Quadrado Médio)**: Soma dos Quadrados dividida pelos graus de liberdade.
- **F value (Valor F)**: Razão do Quadrado Médio da variável explicativa pelo Quadrado Médio dos resíduos.
- **Pr(>F) (Valor-p)**: Probabilidade associada ao valor F. Valores-p pequenos indicam que a variável explicativa é significativa.

## Cálculo da Variância Explicada pelo Modelo
A proporção da variação total explicada pelo modelo é calculada usando:

\[
rac{	ext{Sum Sq das variáveis explicativas}}{	ext{Sum Sq das variáveis explicativas} + 	ext{Sum Sq dos resíduos}}
\]

### Interpretação
> **A proporção da variância no desfecho \(y\) explicada pelas variáveis independentes no modelo indica a qualidade do ajuste do modelo. Um valor mais alto sugere que o modelo explica melhor a variação no desfecho.**

---

## Verificação de Assunções

Para verificar as assunções do modelo, podemos analisar os resíduos assim como fizemos na regressão linear simples.

### Assunções do Modelo de Regressão Linear Múltipla
1. **Linearidade**: A relação entre as variáveis independentes e a dependente é linear.
2. **Independência**: As observações são independentes.
3. **Homoscedasticidade**: A variância dos erros é constante ao longo de todos os valores das variáveis independentes.
4. **Normalidade dos Erros**: Os resíduos do modelo são normalmente distribuídos.

### Análise dos Resíduos
- **Gráfico de Resíduos vs Ajustados**: Ajuda a verificar a homoscedasticidade e a linearidade.
- **Histograma dos Resíduos**: Ajuda a verificar a normalidade dos erros.
- **Gráfico QQ (Quantil-Quantil)**: Ajuda a verificar a normalidade dos resíduos.
- **Autocorrelação dos Resíduos**: Pode ser verificada usando gráficos de autocorrelação para verificar a independência.

### Instruções em R
```R
# Ajustar o modelo de regressão linear múltipla
modelo <- lm(y ~ x1 + x2, data = dados)

# Plotar os resíduos vs ajustados
plot(modelo$fitted.values, residuals(modelo),
     xlab = "Valores Ajustados", ylab = "Resíduos",
     main = "Resíduos vs Valores Ajustados")

# Histograma dos resíduos
hist(residuals(modelo), main = "Histograma dos Resíduos", xlab = "Resíduos")

# Gráfico QQ dos resíduos
qqnorm(residuals(modelo))
qqline(residuals(modelo), col = "red")
```

---

## Variáveis Categóricas

Se considerarmos o mesmo exemplo, mas com uma covariável categórica:

### Exemplo
- Covariável categórica: Sexo (0=feminino; 1=masculino)

Cada equação corresponde a uma linha com a mesma inclinação, mas com interceptos diferentes.

### Interpretação
> **Mantendo as outras variáveis constantes, a diferença média no desfecho \(y\) entre os grupos da variável categórica (por exemplo, sexo) é constante, mas o efeito de uma covariável contínua (por exemplo, peso) no desfecho é o mesmo para ambos os grupos.**

No entanto, esta igualdade é imposta quando escolhemos este modelo.

### Covariáveis Categóricas com Mais de Duas Categorias
Quando a variável categórica tem mais de duas categorias, existem duas abordagens possíveis:

1. **Linhas Paralelas (Impostas pelo Modelo)**
   - Além das linhas serem paralelas, é imposto que a diferença entre o 3º e o 2º grupo é a mesma que a diferença entre o 1º e o 2º grupo.

2. **Diferenças Diferentes entre Grupos**
   - Podemos permitir diferenças diferentes entre os grupos. Para isso, temos que criar variáveis indicadoras (dummy).

### Exemplo de Criação de Variáveis Dummy em R
```R
# Suponha que temos uma variável categórica com três níveis
dados$dummy1 <- ifelse(dados$categoria == "Nível1", 1, 0)
dados$dummy2 <- ifelse(dados$categoria == "Nível2", 1, 0)
# Nível3 é a categoria de referência
```

Com isso, podemos ajustar um modelo que permite diferentes interceptos para cada grupo da variável categórica.

---

## Interações

### Explicação
Uma interação no modelo indica que o efeito de uma variável sobre o desfecho depende do nível de outra variável. Quando temos uma interação no modelo, os efeitos principais (main effects) perdem parte da sua importância, pois o impacto das variáveis envolvidas na interação deve ser interpretado conjuntamente.

### Exemplo Abstrato
> **O efeito da variável \(x\) no desfecho \(y\) é \(eta_x\) para um grupo (grupo=0) e \(eta_x + eta_{	ext{interação}}\) para outro grupo (grupo=1). No entanto, esta interação não é significativa (p=0.341).**

Isso significa que, apesar de termos incluído a interação no modelo, não há evidência estatística suficiente para afirmar que o efeito de \(x\) no desfecho \(y\) é diferente entre os grupos.

### Instruções em R para Incluir Interações
```R
# Ajustar o modelo de regressão com interação
modelo_interacao <- lm(y ~ x1 * x2, data = dados)
summary(modelo_interacao)
```

---

## Inclusão ou Exclusão de Variáveis

Se o efeito de uma interação ou covariável não é significativo, devemos removê-lo do modelo?

### Depende...
A decisão de incluir ou excluir variáveis do modelo não deve basear-se apenas na significância estatística. É importante considerar o contexto e o conhecimento prático do problema.

### Decidindo Quais Variáveis Incluir ou Excluir
- **Significância Estatística**: Variáveis com valores-p baixos indicam significância estatística.
- **Teoria e Conhecimento Prévio**: O entendimento do problema e a teoria subjacente podem sugerir a inclusão de certas variáveis, mesmo que não sejam estatisticamente significativas.
- **Parcimónia**: Modelos mais simples são geralmente preferíveis, a menos que a inclusão de variáveis adicionais melhore significativamente o ajuste do modelo.
- **Impacto Prático**: Considere se a inclusão da variável faz sentido no contexto prático e se ela melhora a interpretação e a utilidade do modelo.
