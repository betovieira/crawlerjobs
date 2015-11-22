USE `bancoPI_schema`;
DROP function IF EXISTS `CriaEmpresaRetornaID`;

DELIMITER $$
USE `bancoPI_schema`$$
CREATE FUNCTION `CriaEmpresaRetornaID` (nomeEmpresa varchar(200))
RETURNS INTEGER
BEGIN
    /* 
		verifica se há uma empresa com o nome passado
		caso haja retorna o id_empresa dela
        caso não, insere o nome da empresa e retorna o id dela
	*/
    
    DECLARE quantEmpresas INT;
    DECLARE retornoID INT;
    DECLARE maxID INT;
    
    SET quantEmpresas = 0;
	SET retornoID = 0;
	SET maxID = 0;

    
    SELECT COUNT(id_empresa) INTO quantEmpresas 
    FROM EMPRESA 
    WHERE nome = nomeEmpresa;
    
    SELECT id_empresa INTO retornoID
    FROM EMPRESA 
    WHERE nome = nomeEmpresa;
    
    SELECT MAX(id_empresa) + 1 INTO maxID
    FROM EMPRESA;
    
	IF quantEmpresas = 0 THEN 
		INSERT INTO EMPRESA (id_empresa, nome) VALUES(NULL, nomeEmpresa);
        
		RETURN maxID;

    END IF;
    
    RETURN retornoID;
    
END$$

DELIMITER ;
/*______________________________________________________________________________________*/
USE `bancoPI_schema`;
DROP function IF EXISTS `CriaCidadeRetornaID`;

DELIMITER $$
USE `bancoPI_schema`$$
CREATE FUNCTION `CriaCidadeRetornaID` (idEstado CHAR(2), nomeCidade VARCHAR(100))
RETURNS INTEGER
BEGIN

/* VERIFICO SE EXISTE ESTE NOME DE CIDADE NAQUELE ESTADO 
		- SE ESTIVER RETORNA ID DA CIDADE
        - SENAO ADICIONAR A CIDADE COM O ID DO ESTADO E RETORNAR O ID
*/
	DECLARE quantCidade INT;
    DECLARE retornoID INT;
    DECLARE maxID INT;
    
    SELECT COUNT(id_cidade) INTO quantCidade 
    FROM Cidade 
    WHERE nome = nomeCidade;
    
	SELECT id_cidade INTO retornoID
    FROM Cidade 
    WHERE nome = nomeCidade;
    
    SELECT MAX(id_cidade) + 1 INTO maxID
    FROM Cidade;
    
    IF quantCidade = 0 THEN 
		INSERT INTO Cidade (id_cidade, id_estado, nome, populacao) 
			VALUES(NULL, idEstado, nomeCidade, NULL);
        
		RETURN maxID;

    END IF;
	
    RETURN retornoID;


RETURN 1;
END$$

DELIMITER ;

/*_____________________________________________________________________________________*/
USE `bancoPI_schema`;
DROP procedure IF EXISTS `retornaVagaValidada`;

DELIMITER $$
USE `bancoPI_schema`$$
CREATE PROCEDURE `retornaVagaValidada` (IN descTipoContrato varchar(100),
										IN descGrauEscolaridade varchar(100),
										IN descPeriodo varchar(100),
										IN nomeEmpresa varchar(100),
                                        IN nomeCidade varchar(100)
                                        )
BEGIN
	DECLARE tempIdCidade char(2);
	
    SELECT DISTINCTROW id_estado INTO tempIdCidade
        FROM Cidade 
        WHERE nome = nomeCidade;

	SELECT
    (
		SELECT DISTINCTROW id_tipo_contrato 
        FROM Tipo_Contrato 
        WHERE descricao = descTipoContrato
	) AS id_tipo_contrato,
	(
		SELECT DISTINCTROW id_grau_escolaridade 
		FROM Grau_Escolaridade 
        WHERE descricao = descGrauEscolaridade
	) AS id_grau_escolaridade,
	(	
		SELECT DISTINCTROW id_jornada 
        FROM Jornada 
        WHERE periodo = descPeriodo
	) AS id_jornada,
    (
		SELECT  DISTINCTROW CriaEmpresaRetornaID(nomeEmpresa)
    ) AS id_empresa,
    (
		SELECT  DISTINCTROW id_estado
        FROM Cidade 
        WHERE nome = nomeCidade
    ) AS id_estado, 
    (
		SELECT  DISTINCTROW CriaCidadeRetornaID(tempIdCidade, nomeCidade) 
    ) AS id_cidade;
    
END$$

DELIMITER ;

/*___________________________________________________________________________*/
USE `bancoPI_schema`;
DROP procedure IF EXISTS `insereVagaCompleta`;

DELIMITER $$
USE `bancoPI_schema`$$
CREATE PROCEDURE `insereVagaCompleta` (IN idTipoContrato INT,
										IN idGrauEscolaridade INT,
										IN idJornada INT,
										IN idEmpresa INT,
										IN idEstado char(2),
                                        IN idCidade INT,
                                        IN tituloVaga VARCHAR(200),
                                        IN salarioVaga DECIMAL(10,2)
                                        )
BEGIN
	/* 
		insereVagaCompleta
        - Primeiro vou inserir na tabela Vaga
        - Depois inserir na tabela cidade_empresa
        - Depois na vaga_cidade
    */
	DECLARE maxID INT;

    
    INSERT INTO `bancoPI_schema`.`Vaga` 
	(
		`id_vaga`,
		`id_tipo_contrato`,
		`id_grau_escolaridade`,
		`id_jornada`,
		`id_empresa`,
		`titulo`,
		`salario`
	)
	VALUES
	(
		NULL,
		idTipoContrato,
		idGrauEscolaridade,
		idJornada,
		idEmpresa,
		tituloVaga,
		salarioVaga
	);
    
    SELECT MAX(id_vaga) INTO maxID 
    FROM VAGA;
    
    INSERT INTO `bancoPI_schema`.`cidade_empresa`
	(
		`id_cidade_empresa`,
		`id_cidade`,
		`id_empresa`
	)
	VALUES
	(
		NULL,
		idCidade,
        idEmpresa
	);
    
    INSERT INTO `bancoPI_schema`.`vaga_cidade`
	(
		`id_vaga_cidade`,
		`id_vaga`,
		`id_cidade`
    )
	VALUES
	(	
		NULL,
		maxID,
        idCidade
	);
    
    SELECT 
    (
		SELECT MAX(id_vaga)
		FROM VAGA
	)as id_vaga;

    
    

END$$

DELIMITER ;
/*___________________________________________________________________________________________________*/
USE `bancoPI_schema`;
DROP procedure IF EXISTS `insereTagCompleta`;

DELIMITER $$
USE `bancoPI_schema`$$

CREATE PROCEDURE `insereTagCompleta` (IN pTag VARCHAR(100), IN pidVaga INT)
BEGIN

	/* 
	insereTagCompleta
		- Verifico se existe a tag a ser adicionada
			- Se existir eu pego o id dela
            - Se não existir eu adiciono e pego o id dela
		- Depois eu pego o id_tag e adiciono no vaga_tag
    */
	DECLARE quantTag INT;
    DECLARE retornoID INT;
    DECLARE maxID INT;
    
    SET maxID = 1;
    SELECT COUNT(id_tag) INTO quantTag 
    FROM Tag 
    WHERE texto = pTag;
    
	SELECT id_tag INTO maxID
    FROM Tag
    WHERE texto = pTag;
    
    IF quantTag = 0 THEN 
		SELECT MAX(id_tag) + 1 INTO maxID FROM Tag;
    
		INSERT INTO `bancoPI_schema`.`Tag`
		(
			`id_tag`,
			`texto`,
			`quantidadeAcessos`
		)
		VALUES
		(
            NULL,
			pTag,
			0
		);
        
	
    END IF;
    
    INSERT INTO `bancoPI_schema`.`vaga_tag`
	(
		`id_vaga_tag`,
		`id_vaga`,
		`id_tag`
	)
	VALUES
	(
		NULL,
		pidVaga,
		maxID
	);

END$$

DELIMITER ;

