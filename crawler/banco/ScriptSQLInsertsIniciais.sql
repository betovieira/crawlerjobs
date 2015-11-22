/* Grau de escolaridade  
    - Valores disponíveis:
        - Escolaridade Mínima: Ensino Médio (2º Grau)
        - Escolaridade Mínima: Curso Técnico
        - Escolaridade Mínima: Ensino Fundamental (1º grau)
        - Escolaridade Mínima: Ensino Superior
        - Escolaridade Mínima: Pós-graduação - Mestrado
*/

INSERT INTO `Grau_Escolaridade` VALUES (1, 'Ensino Fundamental (1º grau)');
INSERT INTO `Grau_Escolaridade` VALUES (2, 'Curso extra-curricular / Profissionalizante');
INSERT INTO `Grau_Escolaridade` VALUES (3, 'Ensino Médio (2º Grau)');
INSERT INTO `Grau_Escolaridade` VALUES (4, 'Curso Técnico');
INSERT INTO `Grau_Escolaridade` VALUES (5, 'Ensino Superior');
INSERT INTO `Grau_Escolaridade` VALUES (6, 'Pós-graduação - Especialização/MBA');
INSERT INTO `Grau_Escolaridade` VALUES (7, 'Pós-graduação - Mestrado');
INSERT INTO `Grau_Escolaridade` VALUES (8, 'Pós-graduação - Doutorado');


/* Tipo do Contrato (para id_tipo_contrato) 
    - Valores disponíveis:
        - Estágio
        - Prestador de Serviços (PJ)
        - Efetivo – CLT
        - Autônomo
        - Temporário
        - Outros
*/
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (1,'Autônomo');
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (2,'Cooperado');
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (3,'Efetivo – CLT');
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (4,'Outros');
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (5,'Prestador de Serviços (PJ)');
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (6,'Temporário');
INSERT INTO `bancoPI_schema`.`Tipo_Contrato` (`id_tipo_contrato`,`descricao`) VALUES (7,'Estágio');


/* Pais */
INSERT INTO `bancoPI_schema`.`Pais` (`id_pais`, `nome`) VALUES (1, 'Brasil');
INSERT INTO `bancoPI_schema`.`Pais` (`id_pais`, `nome`) VALUES (2, 'EUA');
INSERT INTO `bancoPI_schema`.`Pais` (`id_pais`, `nome`) VALUES (3, 'Inglaterra');
INSERT INTO `bancoPI_schema`.`Pais` (`id_pais`, `nome`) VALUES (4, 'Mexico');
INSERT INTO `bancoPI_schema`.`Pais` (`id_pais`, `nome`) VALUES (5, 'França');


/* Estado */
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('RO', 1, 'Rondônia', 1768204);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('AC', 1, 'Acre', 803513 );
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('AM', 1, 'Amazonas', 3938336 );
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('RR', 1, 'Roraima', 505665 );
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('PA', 1, 'Pará', 8175113 );
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ( 'AP', 1, 'Amapá', 766679);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('TO', 1, 'Tocantins', 	1515126);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('MA', 1, 'Maranhão', 6904241);
    
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('PI', 1, 'Piauí', 3204028);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('CE', 1, 'Ceará', 8904459);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('RN', 1, 'Rio Grande do Norte', 3442175);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('PB', 1, 'Paraíba', 3972202); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('PE', 1, 'Pernambuco', 9345173); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('AL', 1, 'Alagoas', 3340932); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('SE', 1, 'Sergipe', 2242937 ); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('BA', 1, 'Bahia', 15203934); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('MG', 1, 'Minas Gerais', 20869101); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('ES', 1, 'Espirito Santo', 3929911); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('RJ', 1, 'Rio de Janeiro', 16550024); 
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('SP', 1, 'São Paulo', 44396484);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('PR', 1, 'Paraná', 11163018);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('SC', 1, 'Santa Catarina', 6819190);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('RS', 1, 'Rio Grande do Sul', 11247972);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('MS', 1, 'Mato Grosso do Sul', 2651235);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('MT', 1, 'Mato Grosso', 3265486);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('GO', 1, 'Goiás', 6610681);
INSERT INTO `bancoPI_schema`.`Estado` (`id_estado`, `id_pais`, `nome`, `populacao`)
    VALUES ('DF', 1, 'Distrito Federal', 2914830);
    
    
    

/* http://www.ibge.gov.br/estadosat/perfil.php?sigla=pe */
/* Cidade insertCidades.sql */

    
    
/* Profissão - esta no inserts profissões */

/* Jornada */
INSERT INTO `bancoPI_schema`.`Jornada` (`id_jornada`, `periodo`)
    VALUES (1, 'Noturno'); 
INSERT INTO `bancoPI_schema`.`Jornada` (`id_jornada`, `periodo`)
    VALUES (2, 'Parcial manhãs'); 
INSERT INTO `bancoPI_schema`.`Jornada` (`id_jornada`, `periodo`)
    VALUES (3, 'Parcial noites'); 
INSERT INTO `bancoPI_schema`.`Jornada` (`id_jornada`, `periodo`)
    VALUES (4, 'Parcial tardes'); 
INSERT INTO `bancoPI_schema`.`Jornada` (`id_jornada`, `periodo`)
    VALUES (5, 'Período Integral'); 



/* Empresa */
INSERT INTO `bancoPI_schema`.`Empresa` (`id_empresa`, `nome`)
    VALUES (1, 'Empresa com nome confidencial');
INSERT INTO `bancoPI_schema`.`Empresa` (`id_empresa`, `nome`)
    VALUES (2, 'URANET');
INSERT INTO `bancoPI_schema`.`Empresa` (`id_empresa`, `nome`)
    VALUES (3, 'ADECCO');
INSERT INTO `bancoPI_schema`.`Empresa` (`id_empresa`, `nome`)
    VALUES (4, 'DONA PIMENTA');
INSERT INTO `bancoPI_schema`.`Empresa` (`id_empresa`, `nome`)
    VALUES (5, 'TOPSERV');



/* cidade_empresa  - DAQUI PRA BAIXO APAGAR DO BANCO DEPOIS */
INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
    VALUES (NULL, 1, 1);
INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
    VALUES (NULL, 2, 2);
INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
    VALUES (NULL, 3, 3);
INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
    VALUES (NULL, 4, 4);
INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
    VALUES (NULL, 5, 5);



/* Vaga */
INSERT INTO `bancoPI_schema`.`Vaga`
(`id_vaga`, `id_tipo_contrato`, `id_grau_escolaridade`, `id_jornada`, `id_empresa`, `id_profissao`, `titulo`, `salario`)
    VALUES (1, 1, 1, 1, 1,'311615', 'Técnico têxtil de fiação', 1800);

INSERT INTO `bancoPI_schema`.`Vaga`
(`id_vaga`, `id_tipo_contrato`, `id_grau_escolaridade`, `id_jornada`, `id_empresa`, `id_profissao`, `titulo`, `salario`)
    VALUES (2, 2, 2, 2, 2,'717025', 'Vibradorista', 900);

INSERT INTO `bancoPI_schema`.`Vaga`
(`id_vaga`, `id_tipo_contrato`, `id_grau_escolaridade`, `id_jornada`, `id_empresa`, `id_profissao`, `titulo`, `salario`)
    VALUES (3, 3, 3, 3, 3,'322305', 'Técnico em óptica e optometria', 1100);
    
INSERT INTO `bancoPI_schema`.`Vaga`
(`id_vaga`, `id_tipo_contrato`, `id_grau_escolaridade`, `id_jornada`, `id_empresa`, `id_profissao`, `titulo`, `salario`)
    VALUES (4, 4, 4, 4, 4,'311105', 'Técnico em química', 1300);
    
INSERT INTO `bancoPI_schema`.`Vaga`
(`id_vaga`, `id_tipo_contrato`, `id_grau_escolaridade`, `id_jornada`, `id_empresa`, `id_profissao`, `titulo`, `salario`)
    VALUES (5, 5, 5, 5, 5,'311610', 'Técnico têxtil (tratamentos químicos)', 2300);


/* vaga_cidade */
INSERT INTO `bancoPI_schema`.`vaga_cidade` (`id_vaga_cidade`, `id_vaga`, `id_cidade`)
    VALUES (1, 1, 1);
INSERT INTO `bancoPI_schema`.`vaga_cidade` (`id_vaga_cidade`, `id_vaga`, `id_cidade`)
    VALUES (2, 1, 2);
INSERT INTO `bancoPI_schema`.`vaga_cidade` (`id_vaga_cidade`, `id_vaga`, `id_cidade`)
    VALUES (3, 2, 3);
INSERT INTO `bancoPI_schema`.`vaga_cidade` (`id_vaga_cidade`, `id_vaga`, `id_cidade`)
    VALUES (4, 2, 4);
INSERT INTO `bancoPI_schema`.`vaga_cidade` (`id_vaga_cidade`, `id_vaga`, `id_cidade`)
    VALUES (5, 2, 5);

/* Altera o nome do pais, a partir dos seus id's 

UPDATE `bancoPI_schema`.`Pais`
    SET `nome` = 'Grã Bretanha'
WHERE `id_pais` = 3;

UPDATE `bancoPI_schema`.`Pais`
    SET `nome` = 'Estados Unidos'
WHERE `id_pais` = 2;

/* Delete - Apaga as vagas com os id_vaga = 4 e 5
DELETE FROM `bancoPI_schema`.`Vaga` WHERE id_vaga = 4;
DELETE FROM `bancoPI_schema`.`Vaga` WHERE id_vaga = 5;

/* Inserts - que não podem ser executados 
    /* Restrição de dominio 
    INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
        VALUES (NULL, 'Oi galera', 1);

    /* Chave primária - Valores duplicados
    INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
        VALUES (1, 2, 1);

    /* Chave ESTRANGEIRA 
    INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
        VALUES (NULL, 9, 1);

/* Updates - Que não podem ser executados 

    /* Restrição de dominio - Valor inválido 
    UPDATE `bancoPI_schema`.`Pais`
    SET  `nome` = 'RENATURENATURENATURENATURENATURENATURENATURENATURENATU'
    WHERE `id_pais` = 5;

    /* Chave primária - Valores duplicados
    UPDATE `bancoPI_schema`.`Pais`
    SET `id_pais` = 1
    WHERE `id_pais` = 5;

    /* Chave ESTRANGEIRA - Não existir chave estrangeira correspondente 
    UPDATE `bancoPI_schema`.`vaga_cidade`
    SET 
    `id_cidade` = 30
    WHERE `id_vaga_cidade` = 5;
    
/* Deletes - Que não podem ser executados 

    /* Restrição de dominio - Valor inválido 
    DELETE FROM `bancoPI_schema`.`Vaga`
    WHERE id_vaga = 'oiASDFASDFASDFASDFASDFASDFA';


    /* Chave ESTRANGEIRA - Não existir chave estrangeira correspondente 
    DELETE FROM `bancoPI_schema`.`Empresa`
    WHERE id_empresa = '1';



*/





/* Questionamentos
    - PRECISA MESMO DE ID_PROFISSAO NA VAGA? PORQUE ELE VAI COLOCAR NAS TAGS LA.. 
*/