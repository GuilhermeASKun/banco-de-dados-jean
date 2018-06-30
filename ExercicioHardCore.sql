CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `exerciciohardcore` AS
    SELECT 
        `postagem`.`idpostagem` AS `idpostagem`,
        `postagem`.`postagem` AS `postagem`,
        `postagem`.`fkid_pessoa` AS `fkid_pessoa`,
        `quem_curtiu`.`nome` AS `Quem Curtiu`,
        `quem_compartilhou`.`nome` AS `Quem Compartilhou`,
        `quem_comentou`.`nome` AS `Quem Comentou`
    FROM
        (((`postagem`
        LEFT JOIN (SELECT DISTINCT
            `pessoa`.`nome` AS `nome`,
                `curtiu`.`fkid_postagem` AS `fkid_postagem`
        FROM
            (`curtiu`
        JOIN `pessoa` ON ((`pessoa`.`idpessoa` = `curtiu`.`fkid_pessoa`)))) `quem_curtiu` ON ((`quem_curtiu`.`fkid_postagem` = `postagem`.`idpostagem`)))
        LEFT JOIN (SELECT DISTINCT
            `pessoa`.`nome` AS `nome`,
                `compartilhamento`.`fkid_postagem` AS `fkid_postagem`
        FROM
            (`compartilhamento`
        JOIN `pessoa` ON ((`pessoa`.`idpessoa` = `compartilhamento`.`fkid_pessoa`)))) `quem_compartilhou` ON ((`quem_compartilhou`.`fkid_postagem` = `postagem`.`idpostagem`)))
        LEFT JOIN (SELECT DISTINCT
            `pessoa`.`nome` AS `nome`,
                `comentario`.`fkid_postagem` AS `fkid_postagem`
        FROM
            (`comentario`
        JOIN `pessoa` ON ((`pessoa`.`idpessoa` = `comentario`.`fkid_pessoa`)))) `quem_comentou` ON ((`quem_comentou`.`fkid_postagem` = `postagem`.`idpostagem`)))
    ORDER BY `postagem`.`idpostagem`