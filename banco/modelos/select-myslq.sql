/* 
	Humberto Vieira de Castro
    Mario de Castro
    Paulo Henrique
    
    O outro exercicio do 4, também foi feito por nós, só que esqueci de colocar o nome.
*/
/* UNION 
	- Para usar o union é necessário utilizar o mesmo numero de colunas e o mesmo tipo de dados
    - Precisam estar na mesma ordem 
*/

/* Select serve para unir todos as cidades com id_estado igual a 9 e 10 */
SELECT ID_ESTADO, NOME AS CIDADE1 FROM CIDADE WHERE ID_ESTADO = 9
UNION 
SELECT ID_ESTADO, NOME FROM CIDADE WHERE ID_ESTADO = 10;


/* Select serve para retornar todas as cidades que tem o id_estado = 9 e id_estado = 15 e maior que 8 
	Percebe-se que a principal diferença entre o union e o union all é que o segundo retorna os dados 
		caso eles seja repetidos. Já o primeiro vem com um distinct como default, então não repete linhas 
        iguais.
*/
SELECT ID_ESTADO, NOME AS CIDADE1 FROM CIDADE WHERE ID_ESTADO = 9
UNION ALL
SELECT ID_ESTADO, NOME AS CIDADE1 FROM CIDADE WHERE ID_ESTADO = 15
UNION ALL
SELECT ID_ESTADO, NOME FROM CIDADE WHERE ID_ESTADO > 8;

/* 
	Neste select selecionamos quais cidades tem os mesmos nomes de estados
    - Intersect no mysql não tem esse comando, entretanto é possivel fazer com o IN
    - Lê melhor assim: Seleciona todas as cidades que tem no nome o mesmo que o select2 tem em sua lista
 */
SELECT ID_CIDADE, NOME AS NOMECIDADE FROM CIDADE WHERE NOME 
IN 
(SELECT NOME FROM ESTADO WHERE ID_CIDADE);

/* NOT IN - SELECIONA TODAS AS CIDADES QUE NÃO TEM O MESMO NOME DO ESTADO*/
SELECT ID_CIDADE, NOME AS NOMECIDADE FROM CIDADE WHERE NOME 
NOT IN 
(SELECT NOME FROM ESTADO WHERE ID_CIDADE);

 
/* MINUS
	- Tem como objetivo pegar dois ou mais selects e tirar o primeiro pelo segundo
    SELECT ID_CIDADE, NOME AS NOMECIDADE FROM CIDADE WHERE NOME 
	MINUS
	(SELECT NOME FROM ESTADO WHERE ID_CIDADE);
 */
 
/* OPERADORES +- 
	Tem como objetivo calcular a população e mostrar previsões de crescimento, mortes, imigrantes e
		a metade da populaçao, sem contar o distrito federal
*/
SELECT
		ID_ESTADO AS ID,
		NOME AS ESTADO,
        POPULACAO AS POPULACAO_ATUAL,
        (POPULACAO / 2) AS POP_METADE,
        (POPULACAO + POPULACAO * 0.1) AS POP_CRESCIMENTO,
        (POPULACAO + 1000) AS PREV_IMIGRANTES,
        (POPULACAO - 4000) AS COM_MORTES 
  FROM Estado
 WHERE ID_ESTADO <= 26;
  
/* BETWEEN - Funciona como where com => e <= 
	SELECIONA todos os estados que não estão entre 10.000 e 1.000.000 de habitantes
		e tem o mesmo nome de cidade que o nome de estado
*/
SELECT 
    ID_ESTADO, NOME AS ESTADO, POPULACAO AS POPULACAO_ATUAL
FROM
    Estado AS E
WHERE
    (POPULACAO NOT BETWEEN 10000 AND 1000000) AND 
		EXISTS(SELECT * FROM CIDADE AS C WHERE E.NOME = C.NOME); 


/* ANY/SOME
	- Os dois são sinonimos, eles são como um comando exists
    - retorna TRUE se a comparação for verdadeira para qualquer dos valores na coluna que a subquery retorna.
    - SELECIONA todos os estados com o id_estado diferente que 3 que é o id da cidade selecionada na subquery
*/
SELECT * 
  FROM ESTADO 
 WHERE ID_ESTADO <> ANY (SELECT ID_CIDADE FROM CIDADE WHERE ID_CIDADE = 3);
 
 
 /* OR
	- SELECIONA todos os estados com o id_estado IGUAL A 5 OU igual a 7
*/
SELECT * 
  FROM ESTADO 
 WHERE ID_ESTADO = 5 OR ID_ESTADO = 7;
 
/* LIKE - COMPARADOR DE STRING 
	- Seleciona todos as cidades que tem como terceira letra 'a'
    */
SELECT *
FROM CIDADE
WHERE NOME LIKE '__a%';

/* IS NOT NULL - COMPARADOR DE STRING 
	- Seleciona todos as cidades que não tem populacao como nulos
    */
SELECT *
FROM CIDADE
WHERE POPULACAO IS NOT NULL;

/* Count conta a quatidade de registros a partir de uma coluna
	- Mostra quantos registros tem na tabela estado
    */
SELECT COUNT(*) AS CONT FROM ESTADO;


SELECT MAX(POPULACAO) AS POP_MAXIMA FROM ESTADO;

/* SELECIONA todas as vagas agrupadas pelo titulo, com quantidade
		de vagas pelo mesmo titulo, com a soma do salario das mesmas e 
		a media salarial. Além disso, ele filtra por salario médio
        maior que 1500
	- 
    */
SELECT 
    *,
    COUNT(*) AS QUANTIDADE,
    SUM(SALARIO) AS SOMA_SALARIO,
    AVG(SALARIO) AS MEDIA_SALARIO
FROM
    VAGA
GROUP BY TITULO
HAVING MEDIA_SALARIO > 1500;


/* SELECIONA TODOS AS VAGAS AGRUPADOS PELO TITULO
	 e mostrando seu salario minimo e seu salario maximo
 */
SELECT 
	TITULO AS NOME_VAGA,
    MIN(SALARIO) AS MIN_SALARIO, 
    MAX(SALARIO) AS MAX_SALARIO
FROM 
	VAGA
GROUP BY
	TITULO;
    		



