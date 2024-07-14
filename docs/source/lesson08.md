
# Lesson 08 - Linear Mixed Models

## Dados Longitudinais
### Medidas Repetidas
- Medições são realizadas várias vezes em cada participante.
- Exemplo: Medir o comprimento dos dois braços de cada participante.

### Dados Longitudinais
- Medições repetidas ao longo do tempo.
- Exemplo: Medir o comprimento do braço direito aos 3, 4, 5 e 6 anos de idade de cada participante.
- Os dados longitudinais apresentam fortes correlações intraindividuais: o valor observado no tempo t depende dos valores observados anteriormente.

## Modelo Linear para a Observação j-ésima do Indivíduo i
- \( Y_{ij} = \alpha + \beta X_{ij} + \epsilon_{ij} \)
  - \( Y_{ij} \) - Desfecho (i.e., a j-ésima medida da habilidade cognitiva da criança i)
  - \( X_{ij} \) - Valor preditivo (i.e., a idade da criança i na j-ésima medição)
  - \( \alpha \) - Intercepto (i.e., média da habilidade cognitiva ao nascimento)
  - \( \beta \) - Coeficiente de regressão definindo quanto o desfecho deve variar para um aumento de uma unidade em X
  - \( \epsilon_{ij} \) - Erro residual (i.e., sorte quando a criança i fez seu j-ésimo teste cognitivo)

## Modelo Linear Misto para a Observação j-ésima do Indivíduo i
- \( Y_{ij} = (\alpha + u_{0i}) + (\beta + u_{1i}) X_{ij} + \epsilon_{ij} \)
  - \( u_{0i} \) - Intercepto aleatório: modela a heterogeneidade individual basal (diferença na habilidade cognitiva ao nascimento)
  - \( u_{1i} \) - Inclinação aleatória: modela a heterogeneidade individual na relação X-Y (diferenças na evolução da habilidade cognitiva relacionada à idade)
