# LFA_Trabalho2

OBJETIVO GERAL:
Desenvolver um autômato finito para controlar um personagem de desenho animado cujas ações são apresentadas na tela do computador. O personagem vai reagir aos comandos introduzidos via teclado, cada comando representado por um símbolo (tecla pressionada). Dessa forma, ao fornecer um string como entrada, o autômato será capaz de executar uma sequência de ações na tela (uma ação para cada símbolo) como um trecho de um desenho animado.

OBJETIVOS ESPECIFICOS:

1. A ideia deste TP é desenvolver familiaridade com os autômatos finitos. De fato, os autômatos finitos podem ser modificados para realizar uma infinidade de tarefas diferentes. Exemplos de modificações importantes são as máquinas de Moore e as máquinas de Mealy (para mais detalhes ver o link em anexo). (*) As máquinas de Moore são AFs que imprimem algo (ou executam uma ação) quando o processamento de uma palavra passa por um estado: existem ações associadas aos estados. (**) As máquinas de Mealy são análogas das máquinas de Moore, com a diferença que as ações são associadas às transições em vez de aos estados (isto é, quando o processamento passa por uma transição então é executada uma ação associada à transição).

2. A "mágica" neste TP vai acontecer associando a alguns estados uma ação de mostrar uma imagem na tela. Assim, controlando bem o tempo das trocas entre os estados para o processamento das palavras fornecidas na entrada, o efeito do processamento da palavra pelo autômato será a exibição de um desenho animado na tela do computador. Resumindo: neste TP você var desenvolver uma máquina de Moore que é um autômato finito com ações associadas aos estados, sendo essas ações a exibição de imagens na tela do computador.
