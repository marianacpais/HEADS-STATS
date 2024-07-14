
# Lesson 12 - Regressão de Cox

## Definição
- Modela dados de tempo até o evento na presença de casos censurados.
- Também conhecido como modelo de riscos proporcionais de Cox ou modelo de Cox.

## Características
- Permite a inclusão de variáveis preditoras (covariáveis). Estas podem ser categóricas ou contínuas.

## Fórmula
- ℎ(𝑡, 𝑋) = ℎ₀(𝑡)𝑒∑(𝛽𝑖𝑋𝑖)
- Onde \( X = (X_1, X_2, ..., X_p) \) são variáveis explicativas/preditoras.
- ℎ₀(𝑡) é chamada de função de risco base.

## Assunção de Riscos Proporcionais (PH)
- A função de risco base é uma função de \( t \), mas não envolve os \( X \)'s.
- A expressão exponencial envolve os \( X \)'s, mas não envolve \( t \).
- Os \( X \)'s são chamados de preditores independentes do tempo (variáveis cujo valor para um dado indivíduo não muda ao longo do tempo).

## Modelo Estendido
- É possível considerar variáveis dependentes do tempo e então um modelo de Cox estendido deve ser considerado.

## Modelo Semiparamétrico
- Como ℎ₀(𝑡) é uma função não especificada, o modelo de Cox é um modelo semiparamétrico.

## Taxas e Razões de Risco

### Taxa de Risco
- A taxa de risco é a probabilidade de que, se o evento em questão ainda não ocorreu, ele ocorrerá no próximo intervalo de tempo, dividida pela duração desse intervalo. Esse intervalo de tempo é feito muito curto, de modo que, na prática, a taxa de risco representa uma taxa instantânea.

### Razão de Risco (HR)
- A razão de risco é definida como a razão entre a taxa de risco para um indivíduo e a taxa de risco para outro indivíduo. Os dois indivíduos sendo comparados podem ser distinguidos pelos seus valores para o conjunto de preditores, \( X \)'s.
- Fórmula: \( \widehat{HR} = rac{\widehat{h}(t, X^*)}{\widehat{h}(t, X)} \)
- Onde \( X^* = (X_1^*, X_2^*, ..., X_p^*) \) e \( X = (X_1, X_2, ..., X_p) \) denotam o conjunto de \( X \)'s para dois indivíduos.

### Interpretação da Razão de Risco (HR)
- **HR = 1**: Não há relação entre os preditores e a taxa de risco.
- **HR > 1**: Os "expostos" têm um risco maior em comparação com os "não expostos".
- **HR < 1**: Os "expostos" têm um risco menor em comparação com os "não expostos".

## Assunções da Regressão de Cox

### Assunção de Riscos Proporcionais (PH)
- Os riscos são consistentes e não variam de forma diferente ao longo do tempo.
- Pode-se examinar os resíduos (resíduos de Schoenfeld): Se a assunção de PH for verdadeira, o gráfico dos resíduos deve ser horizontal e próximo de 0.
  - Não deve mostrar uma tendência clara ao longo do tempo (ou seja, não deve estar aumentando ou diminuindo drasticamente).
  - Deve também estar centrado próximo de 0.

### Teste da Assunção PH
- Para cada covariável, a função `cox.zph()` correlaciona o conjunto correspondente de resíduos de Schoenfeld escalados com o tempo, para testar a independência entre resíduos e tempo.
- Além disso, realiza um teste global para o modelo como um todo.
- A assunção de risco proporcional é apoiada por uma relação não significativa entre resíduos e tempo e refutada por uma relação significativa.
