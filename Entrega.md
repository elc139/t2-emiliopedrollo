# Programação Paralela Multithread

Nome: Emílio B. Pedrollo
### Pthreads
1. Explique como se encontram implementadas as 4 etapas de projeto: particionamento, comunicação, aglomeração,
 mapeamento (use trechos de código para ilustrar a explicação).
    
    > TODO

2. Considerando o tempo (em microssegundos) mostrado na saída do programa, qual foi a aceleração (speedup) com o uso de 
 threads?

    > Tendo em mente que rodando de forma sequencial o tempo de execução é de em média 4740000 microssegundos e rodando 
      com 2 threads temos aproximadamente 2374000 microssegundos o cálculo fica o seguinte:
	>
	> ![4740000/2374000 ~= 2][accel]

3. A aceleração se sustenta para outros tamanhos de vetores, números de threads e repetições? Para responder a essa 
 questão, você terá que realizar diversas execuções, variando o tamanho do problema (tamanho dos vetores e número de 
 repetições) e o número de threads (1, 2, 4, 8..., dependendo do número de núcleos). Cada caso deve ser executado várias 
 vezes, para depois calcular-se um tempo de processamento médio para cada caso. Atenção aos fatores que podem interferir
 na confiabilidade da medição: uso compartilhado do computador, tempos muito pequenos, etc.

    > Mantendo o mesmo numero de cálculos usando a fórmula ![1000000 / nthreads][threads_distribution] nota-se uma 
      melhora constante na velocidade de execução do programa chegando até aproximadamente 7,59: 
    >
    > ![4740000/627000 ~= 7,59][accel_12_threads]

4. Elabore um gráfico/tabela de aceleração a partir dos dados obtidos no exercício anterior.

    > ![][accel_graph]

5. Explique as diferenças entre pthreads_dotprod.c e pthreads_dotprod2.c. Com as linhas removidas, o programa está 
 correto?

    > Apesar de na maioria das vezes o resultado estar correto, há uma chance significativa de que removendo o mutex
      occora alguma condição de corrida em que o valor de `dotdata.c` seja atualizado depois de um thread tenha
      coletado o seu valor, mas antes de que ela possa gravar a soma do valor lido com o calculado pela carga de 
      trabalho da thread, ignorando a atualização feita por outra thread.
    >
    > Desta forma o programa `pthreads_dotprod2` não calculará o valor esperado quando a situação acima ocorrer.

[accel]: https://latex.codecogs.com/png.latex?%5Csmall%20%5Cfrac%7B4740000%7D%7B2374000%7D%20%5Ccong%202
[accel_12_threads]: https://latex.codecogs.com/png.latex?%5Csmall%20%5Cfrac%7B4740000%7D%7B627000%7D%20%5Ccong%207%2C59
[threads_distribution]: https://latex.codecogs.com/png.latex?%5Csmall%20%5Cfrac%7B1000000%7D%7Bnthreads%7D
[accel_graph]: https://github.com/elc139/t2-emiliopedrollo/blob/master/www/Acelera%C3%A7%C3%A3o.png?raw=true