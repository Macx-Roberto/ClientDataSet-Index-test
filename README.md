Projeto para validar a diferença de utilizar as rotinas indexadas do componente ClientDataSet em comparação com as que não utlizam.
Ao iniciar o programa gera 1 milhao de registros na clientdataset.

1) SetRange x Filter
- SetRange(index) = 1ms
- Filter          = +100ms

2) Locate x FindKey
- FindKey(index)  = 1ms
- Locate          = +50ms
  
3) Filter com  e sem index
- Alterar o filtro com index ativado demora mais tempo do que sem ele onde de 100ms vai para mais de 400ms.
 
Observação:
- Codigo comentado era um teste com index em campo string.
- Nem tudo que se faz com o filter é possivel com o SetRange.
- Sobre os campos do Index:
-- Ex: dado um index de 2 campos
```
ClientDataSet1.SetRange([89], [89]); // isso funciona (utilziar somente um). 
                                    // Somente o primeiro campo presente no index é utilziado

ClientDataSet1.SetRange([nil, 89], [nil, 89]); ou ...SetRange([NULL, 89], [NULL, 89]);
// isso não vai trazer os que respeitam somente o segundo campo.

// teria como fazer?
// SIM 
// Ex:
ClientDataSet1.SetRange([<fistValue>, 89], [<lastValue>, 89]); 
// o primeiro campo abrangendo todos os registros e o segundo somente os com valor 89
```
  
