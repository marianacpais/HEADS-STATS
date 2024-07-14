
# Lesson 11 - Análise de Sobrevivência

## O que é a Análise de Sobrevivência?

A análise de sobrevivência inclui métodos estatísticos para analisar dados longitudinais de tempo até um evento. Os eventos podem incluir:
- Morte
- Lesão
- Início de doença
- Recuperação de doença
- Transição acima ou abaixo do limiar clínico de uma variável contínua significativa

## Objetivos da Análise de Sobrevivência

- **Estimar o tempo até o evento para um grupo de indivíduos:** Por exemplo, tempo até a morte para um grupo de pacientes com câncer.
- **Comparar o tempo até o evento entre dois ou mais grupos:** Por exemplo, pacientes tratados vs pacientes placebo em um ensaio clínico randomizado.
- **Avaliar a relação das covariáveis com o tempo até o evento:** Por exemplo, idade, um certo biomarcador ou o tamanho do tumor influenciam o tempo de sobrevivência de pacientes com câncer?

## Censura

- **Pacientes que não tiveram o evento são considerados censurados:**
  - Sabemos que eles sobreviveram por um período específico, mas não sabemos o tempo exato do evento.
  - Acreditamos que o evento teria ocorrido se os observássemos por mais tempo.
  - Esses pacientes fornecem alguma informação, mas não informação completa.

## Como Lidar com a Censura?

- **Ignorar a censura e considerar que o evento ocorreu no momento da censura:**
  - Incorreto, pois quase certamente não é verdade.
- **Remover o paciente da análise:**
  - Pode introduzir viés e perda de poder estatístico.
- **Análise de Sobrevivência:**
  - Nosso objetivo é estimar a distribuição de sobrevivência dos pacientes na presença de censura.
  - A censura é considerada na análise.

## Por Que Usar a Análise de Sobrevivência?

- **Por que não comparar o tempo médio até o evento entre grupos usando um teste t ou regressão linear?**
  - Essas abordagens não levam em consideração a censura, o que pode resultar em estimativas enviesadas do tempo médio até o evento.
- **Por que não comparar a proporção de eventos nos grupos usando razões de risco/odds ou regressão logística?**
  - Estas abordagens ignoram o componente temporal dos dados de sobrevivência. A análise de sobrevivência é projetada para lidar com a censura e para estimar o tempo até o evento de forma mais precisa.

## Dados de Tempo até o Evento

- **Em análise de sobrevivência, o tempo até a ocorrência de um evento bem definido é registrado (dados de tempo até o evento).**
  - **Tempo de Sobrevivência:**
    - Se todos tivessem um evento, alguns dos métodos que já aprendemos poderiam ser aplicados.
    - Frequentemente, nem todos têm o evento - censura.
    - Pode ocorrer devido a:
      - Perda de seguimento
      - Fim do estudo

## Tempo até o Evento

- **Tempo até o evento:** O tempo desde a entrada no estudo até que um sujeito tenha um determinado desfecho.

## Censura

- **Censura:** Sujeitos são considerados censurados se:
  - Eles são perdidos no seguimento ou saem do estudo.
  - Eles morrem de causas não relacionadas.
  - O estudo termina antes que tenham o evento de interesse.
  - Eles são contabilizados como vivos ou livres de doença pelo tempo em que estiveram inscritos no estudo.

## Estrutura de Dados na Análise de Sobrevivência

- **Desfecho de duas variáveis:**
  - **Variável de Tempo (T):** \( t_i \) = tempo na última observação sem evento ou tempo no evento.
  - **Variável de Censura (C):** \( c_i \) = 1 se teve o evento; \( c_i \) = 0 se não teve o evento até o tempo \( t_i \).

## Introdução às Distribuições de Sobrevivência

- **\( T_i \), o tempo do evento para um indivíduo, é uma variável aleatória com uma distribuição de probabilidade.**
  - Diferentes modelos para dados de sobrevivência são distinguidos pela escolha da distribuição para \( T_i \).
  - **A probabilidade (densidade) do tempo do evento ocorrer exatamente no tempo \( t \):**
    \[
    f(t) = \lim_{\Delta t 	o 0} rac{P(t \leq T < t + \Delta t)}{\Delta t}
    \]
  - **A probabilidade cumulativa (densidade) do tempo do evento ocorrer antes do tempo \( t \):**
    \[
    F(t) = P(T \leq t) = \int_{-\infty}^{t} f(t) \, dt
    \]

## Função de Sobrevivência

- **Função de sobrevivência:** \( S(t) = 1 - F(t) \)
  - O objetivo da análise de sobrevivência é estimar e comparar as experiências de sobrevivência de diferentes grupos.
  - A experiência de sobrevivência é descrita pela função de sobrevivência cumulativa:
    \[
    S(t) = 1 - P(T \leq t) = 1 - F(t)
    \]
  - **Exemplo:** Se \( t = 100 \) anos, \( S(t = 100) \) é a probabilidade de sobreviver além dos 100 anos.

## Função de Risco (Hazard Function)

- **Função de Risco:**
  - A probabilidade de que, se você sobreviver até \( t \), você sucumbirá ao evento no instante seguinte:
    \[
    h(t) = \lim_{\Delta t 	o 0} rac{P(t \leq T < t + \Delta t \mid T \geq t)}{\Delta t}
    \]
  - Onde:
    \[
    h(t) \Delta t = P(t \leq T < t + \Delta t \mid T \geq t) = rac{P(t \leq T < t + \Delta t \cap T \geq t)}{P(T \geq t)} = rac{P(t \leq T < t + \Delta t)}{P(T \geq t)} = rac{f(t) \Delta t}{S(t)} = rac{-S'(t) \Delta t}{S(t)}
    \]
  - Portanto, a função de risco é:
    \[
    h(t) = rac{-S'(t)}{S(t)}
    \]

## Função de Risco vs. Densidade de Probabilidade

- **Densidade de Probabilidade:**
  - Quando você nasce, você tem uma certa probabilidade de morrer em qualquer idade; essa é a densidade de probabilidade.
  - **Exemplo:** Uma mulher nascida hoje tem, digamos, 1% de chance de morrer aos 80 anos.

- **Função de Risco:**
  - No entanto, à medida que você sobrevive por algum tempo, suas probabilidades continuam mudando; essa é a taxa de risco (pense: probabilidade condicional).
  - **Exemplo:** Uma mulher que tem 79 anos hoje tem, digamos, 5% de chance de morrer aos 80 anos.

## Análise de Kaplan-Meier

- **A Análise de Kaplan-Meier** é uma técnica não paramétrica usada para estimar a função de sobrevivência a partir de dados de tempo até o evento.
- **Função de Sobrevivência Estimada:**
  - A função de sobrevivência Kaplan-Meier é uma estimativa em degraus da probabilidade de sobrevivência a partir do tempo inicial até vários pontos no tempo.
  - A probabilidade de sobrevivência é recalculada sempre que ocorre um evento.
  - A estimativa é ajustada para censura, onde os dados são censurados (por exemplo, um paciente é perdido para o seguimento).
- **Curva de Kaplan-Meier:**
  - A curva de Kaplan-Meier é um gráfico da função de sobrevivência estimada versus o tempo.
  - Cada queda na curva representa a ocorrência de um evento.
  - Os pontos de censura são geralmente indicados por marcas (por exemplo, cruzes) na curva.
- **Comparação entre Grupos:**
  - O teste de log-rank é comumente usado para comparar curvas de sobrevivência entre dois ou mais grupos.
  - Este teste verifica a hipótese nula de que não há diferença nas curvas de sobrevivência entre os grupos.

**Exemplo de Aplicação:**
- Estimar a probabilidade de sobrevivência de pacientes com câncer ao longo do tempo e comparar a sobrevivência entre diferentes grupos de tratamento.

Este método é amplamente utilizado em estudos clínicos para avaliar a eficácia de tratamentos e entender melhor os padrões de sobrevivência em diversas condições médicas.
