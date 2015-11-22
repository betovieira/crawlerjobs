/* Altera o nome do pais, a partir dos seus id's */

UPDATE `bancoPI_schema`.`Pais`
    SET `nome` = 'Grã Bretanha'
WHERE `id_pais` = 3;

UPDATE `bancoPI_schema`.`Pais`
    SET `nome` = 'Estados Unidos'
WHERE `id_pais` = 2;

/* Delete - Apaga as vagas com os id_vaga = 4 e 5*/
DELETE FROM `bancoPI_schema`.`Vaga` WHERE id_vaga = 4;
DELETE FROM `bancoPI_schema`.`Vaga` WHERE id_vaga = 5;

/* Inserts - que não podem ser executados */
    /* Restrição de dominio */
    INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
        VALUES (NULL, 'Oi galera', 1);

    /* Chave primária - Valores duplicados*/
    INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
        VALUES (1, 2, 1);

    /* Chave ESTRANGEIRA */
    INSERT INTO `bancoPI_schema`.`cidade_empresa` (`id_cidade_empresa`, `id_cidade`, `id_empresa`)
        VALUES (NULL, 9, 1);

/* Updates - Que não podem ser executados */

    /* Restrição de dominio - Valor inválido 
    UPDATE `bancoPI_schema`.`Pais`
    SET  `nome` = 'RENATURENATURENATURENATURENATURENATURENATURENATURENATU'
    WHERE `id_pais` = 5;

    /* Chave primária - Valores duplicados*/
    UPDATE `bancoPI_schema`.`Pais`
    SET `id_pais` = 1
    WHERE `id_pais` = 5;

    /* Chave ESTRANGEIRA - Não existir chave estrangeira correspondente */
    UPDATE `bancoPI_schema`.`vaga_cidade`
    SET 
    `id_cidade` = 30
    WHERE `id_vaga_cidade` = 5;
    
/* Deletes - Que não podem ser executados */

    /* Restrição de dominio - Valor inválido 
    DELETE FROM `bancoPI_schema`.`Vaga`
    WHERE id_vaga = 'oiASDFASDFASDFASDFASDFASDFA';


    /* Chave ESTRANGEIRA - Não existir chave estrangeira correspondente */
    DELETE FROM `bancoPI_schema`.`Empresa`
    WHERE id_empresa = '1';

