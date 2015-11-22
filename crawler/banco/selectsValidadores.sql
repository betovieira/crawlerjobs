SELECT id_grau_escolaridade 
FROM Grau_Escolaridade 
WHERE descricao = 'Ensino Médio (2º Grau)';

SELECT id_tipo_contrato
FROM Tipo_Contrato
WHERE descricao = 'Efetivo – CLT';

SELECT id_jornada 
FROM JORNADA
WHERE periodo = "Noturno";

SELECT *
FROM EMPRESA
WHERE nome = '';

SELECT CriaEmpresaRetornaID('ASS') AS id_empresa;
SELECT CriaCidadeRetornaID(1, 'JEaFS') AS id_cidade;
CALL retornaVagaValidada(11);

SELECT *
FROM EMPRESA
WHERE nome = "URANET";
                   
SELECT id_estado FROM Estado
WHERE sigla = 'SP';


SELECT
    (
		SELECT id_tipo_contrato 
        FROM Tipo_Contrato 
        WHERE descricao = 'Efetivo – CLT'
	) AS id_tipo_contrato,
	(
		SELECT id_grau_escolaridade 
		FROM Grau_Escolaridade 
        WHERE descricao = 'Ensino Médio (2º Grau)'
	) AS id_grau_escolaridade,
	(	
		SELECT id_jornada 
        FROM Jornada 
        WHERE periodo = 'Noturno'
	) AS id_jornada,
    (
		SELECT CriaEmpresaRetornaID('JOBSON')
    ) AS id_empresa,
    (
		SELECT id_estado 
        FROM Estado 
        WHERE sigla = 'SP'
    ) AS id_estado, 
    (
		SELECT CriaCidadeRetornaID(1, 'JEaFS') 
    ) AS id_cidade;
    
IN descTipoContrato varchar(100),
										IN descGrauEscolaridade varchar(100),
										IN descPeriodo varchar(100),
										IN nomeEmpresa varchar(100),
										IN siglaEstado char(2),
                                        IN nomeCidade varchar(100)
                                        
CALL retornaVagaValidada('Efetivo – CLT', 'Ensino Médio (2º Grau)', 
						'Parcial tardes', 'Empresa foda','Ouro Fino');

    
select * from cidade where id_estado = 20;
		
CALL retornaVagaValidada("Efetivo – CLT", 
"Ensino Médio (2º Grau)", 
"Parcial tardes", "Empresa com nome confidencial","SP","São Paulo");

select * from vaga;

CALL insereVagaCompleta(1,1,1,1,'PE',28,'cool2', 1);

SELECT * FROM EMPRESA;
SELECT * FROM CIDADE WHERE ID_CIDADE = 3687;

SELECT * FROM TAG;

CALL insereTagCompleta('foda5', 1);

SELECT * from vaga_tag where id_vaga = 78;

select * from vaga;

SELECT * 
FROM VAGA V 
WHERE V.id_vaga = 78;

SELECT * 
FROM TAG T 
	INNER JOIN  VAGA_TAG VT
		ON T.ID_TAG = VT.ID_TAG
WHERE VT.ID_VAGA = 229;


select * from vaga_cidade;
select * from cidade_empresa;


/* limpa o que interessa */
delete from vaga_cidade where id_vaga_cidade > 1;
delete from cidade_empresa where  id_cidade_empresa > 1;
delete from vaga_tag where id_vaga > 1;
delete from tag where id_tag > 1;
delete from vaga where id_vaga > 1;




SELECT MAX(id_tag) + 1 FROM Tag;

SELECT * FROM CIDADE WHERE NOME = 'Luís Eduardo Magalhães'



