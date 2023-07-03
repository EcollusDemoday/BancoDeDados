
CREATE TABLE Usuario (
    id_usuario SMALLINT PRIMARY KEY,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    confirmacao_senha VARCHAR(100),
    telefone CHAR,
    CNPJ CHAR,
    CPF CHAR,
    fk_tipo_usuario_tipo_usuario_PK SMALLINT,
    fk_Login_id_login SMALLINT,
    UNIQUE (email, telefone, CNPJ, CPF, fk_tipo_usuario_tipo_usuario_PK, fk_Login_id_login, id_usuario)
);

CREATE TABLE Login (
    id_login SMALLINT PRIMARY KEY,
    usuario VARCHAR(100),
    email VARCHAR(100),
    senha VARCHAR(100),
    UNIQUE (id_login, usuario, email)
);

CREATE TABLE Produtos (
    nome_produto VARCHAR(100),
    id_produto SMALLINT PRIMARY KEY UNIQUE,
    preco DOUBLE,
    categoria VARCHAR(100),
    descrição TEXT(10000),
    link_site_produto VARCHAR(250),
    fk_Usuario_id_usuario SMALLINT
);

CREATE TABLE EcoBox (
    id_EcoBox SMALLINT PRIMARY KEY,
    plano VARCHAR(100),
    nome_usuario VARCHAR(100),
    CPF CHAR,
    fk_Endereço_Endereço_PK SMALLINT,
    UNIQUE (id_EcoBox, CPF, fk_Endereço_Endereço_PK)
);

CREATE TABLE Blog (
    id_artigo SMALLINT PRIMARY KEY UNIQUE,
    titulo_artigo VARCHAR(100),
    conteudo_artigo TEXT(15000),
    data_publicacao DATE
);

CREATE TABLE Planos_ME (
    id_plano SMALLINT PRIMARY KEY UNIQUE,
    nome_plano VARCHAR(100),
    descricao_plano VARCHAR(250),
    Preco_plano DOUBLE,
    analytics_1 BOOLEAN,
    videoula_e_eventos BOOLEAN
);

CREATE TABLE ME_ecoPlus (
    id_plano SMALLINT UNIQUE,
    2_Consultorias_Marketing BOOLEAN,
    2_consultorias_audiovisual BOOLEAN,
    analytics_2 BOOLEAN,
    fk_Planos_ME_id_plano SMALLINT,
    PRIMARY KEY (id_plano, fk_Planos_ME_id_plano)
);

CREATE TABLE ME_ecoPremium (
    id_plano SMALLINT,
    analytics_3 BOOLEAN,
    impulsionamento_plus BOOLEAN,
    4_consultorias_marketing BOOLEAN,
    3_consultorias_audiovisual BOOLEAN,
    fk_Planos_ME_id_plano SMALLINT,
    PRIMARY KEY (id_plano, fk_Planos_ME_id_plano),
    UNIQUE (fk_Planos_ME_id_plano, id_plano)
);

CREATE TABLE ecobox_Planos (
    id_plano SMALLINT PRIMARY KEY,
    fk_plano_plano_PK SMALLINT,
    UNIQUE (id_plano, fk_plano_plano_PK)
);

CREATE TABLE Perguntas_quiz (
    id_pergunta SMALLINT PRIMARY KEY,
    pergunta VARCHAR(250),
    fk_alternativa_quiz_id_resposta SMALLINT,
    UNIQUE (id_pergunta, fk_alternativa_quiz_id_resposta)
);

CREATE TABLE alternativa_quiz (
    id_resposta SMALLINT PRIMARY KEY,
    resposta VARCHAR(250),
    pontuacao TINYINT,
    fk_Tipos_de_pele_id_tipo SMALLINT,
    UNIQUE (fk_Tipos_de_pele_id_tipo, id_resposta)
);

CREATE TABLE Tipos_de_pele (
    id_tipo SMALLINT PRIMARY KEY UNIQUE,
    tipo_de_pele VARCHAR(250),
    pontuacao_minima TINYINT
);

CREATE TABLE Transacao (
    id_transacao SMALLINT PRIMARY KEY,
    data_hora_transacao DATETIME,
    status_transacao VARCHAR(100),
    valor DOUBLE,
    modalidade VARCHAR(100)
);

CREATE TABLE Cartao_Credito (
    id_cartao SMALLINT,
    numero_cartao CHAR,
    data_validade DATE,
    codigo_segurança SMALLINT,
    titular VARCHAR(250),
    CPF_titular CHAR,
    fk_apelido_cartao_apelido_cartao_PK SMALLINT,
    fk_Transacao_id_transacao SMALLINT,
    PRIMARY KEY (id_cartao, fk_Transacao_id_transacao),
    UNIQUE (id_cartao, fk_Transacao_id_transacao, fk_apelido_cartao_apelido_cartao_PK)
);

CREATE TABLE Pix (
    destinatario VARCHAR(250),
    id_pix SMALLINT,
    chave_pix VARCHAR(250),
    fk_Transacao_id_transacao SMALLINT,
    PRIMARY KEY (id_pix, fk_Transacao_id_transacao),
    UNIQUE (id_pix, fk_Transacao_id_transacao)
);

CREATE TABLE Boleto (
    id_boleto SMALLINT,
    emissor VARCHAR(250),
    data_emissao DATE,
    vencimento DATE,
    instituicao_pagamento VARCHAR(250),
    fk_Transacao_id_transacao SMALLINT,
    codigo_barras SMALLINT,
    PRIMARY KEY (id_boleto, fk_Transacao_id_transacao),
    UNIQUE (id_boleto, fk_Transacao_id_transacao, codigo_barras)
);

CREATE TABLE tipo_usuario (
    tipo_usuario_PK SMALLINT NOT NULL PRIMARY KEY UNIQUE,
    cliente BOOLEAN,
    microempreendedor BOOLEAN
);

CREATE TABLE Endereço (
    Endereço_PK SMALLINT NOT NULL PRIMARY KEY,
    complemento VARCHAR(250),
    número SMALLINT,
    cidade VARCHAR(250),
    Rua VARCHAR(250),
    bairro VARCHAR(250),
    CEP CHAR,
    UNIQUE (CEP, Endereço_PK)
);

CREATE TABLE plano (
    plano_PK SMALLINT NOT NULL PRIMARY KEY UNIQUE,
    valor_mensal DOUBLE,
    valor_anual DOUBLE,
    valor_semestral DOUBLE,
    nome_plano VARCHAR(250)
);

CREATE TABLE apelido_cartao (
    apelido_cartao_PK SMALLINT NOT NULL PRIMARY KEY UNIQUE,
    apelido_cartao VARCHAR(250)
);

CREATE TABLE comprar (
    fk_Usuario_id_usuario SMALLINT,
    fk_EcoBox_id_EcoBox SMALLINT,
    UNIQUE (fk_Usuario_id_usuario, fk_EcoBox_id_EcoBox)
);

CREATE TABLE conter (
    fk_EcoBox_id_EcoBox SMALLINT,
    fk_ecobox_Planos_id_plano SMALLINT,
    UNIQUE (fk_EcoBox_id_EcoBox, fk_ecobox_Planos_id_plano)
);

CREATE TABLE Obter (
    fk_Usuario_id_usuario SMALLINT,
    fk_Planos_ME_id_plano SMALLINT,
    UNIQUE (fk_Usuario_id_usuario, fk_Planos_ME_id_plano)
);

CREATE TABLE efetuar (
    fk_Transacao_id_transacao SMALLINT,
    fk_ecobox_Planos_id_plano SMALLINT,
    UNIQUE (fk_Transacao_id_transacao, fk_ecobox_Planos_id_plano)
);

CREATE TABLE ler (
    fk_Usuario_id_usuario SMALLINT,
    fk_Blog_id_artigo SMALLINT,
    UNIQUE (fk_Blog_id_artigo, fk_Usuario_id_usuario)
);

CREATE TABLE Lista_desejos (
    fk_Usuario_id_usuario SMALLINT,
    fk_Produtos_id_produto SMALLINT,
    UNIQUE (fk_Produtos_id_produto, fk_Usuario_id_usuario)
);

CREATE TABLE Eco_diamond (
    dez_produtos BOOLEAN,
    mimos BOOLEAN,
    frete_gratis BOOLEAN,
    fk_ecobox_Planos_id_plano SMALLINT PRIMARY KEY
);

CREATE TABLE Eco_gold (
    sete_produtos BOOLEAN,
    mimos BOOLEAN,
    fk_ecobox_Planos_id_plano SMALLINT PRIMARY KEY
);

CREATE TABLE Eco_platinum (
    cinco_produtos BOOLEAN,
    fk_ecobox_Planos_id_plano SMALLINT PRIMARY KEY
);

CREATE TABLE tipo_documento (
    tipo_documento_PK SMALLINT NOT NULL PRIMARY KEY,
    CPF CHAR,
    CNPJ CHAR,
    UNIQUE (tipo_documento_PK, CPF, CNPJ)
);
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_2
    FOREIGN KEY (fk_tipo_usuario_tipo_usuario_PK)
    REFERENCES tipo_usuario (tipo_usuario_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Usuario ADD CONSTRAINT FK_Usuario_3
    FOREIGN KEY (fk_Login_id_login)
    REFERENCES Login (id_login)
    ON DELETE CASCADE;
 
ALTER TABLE Produtos ADD CONSTRAINT FK_Produtos_2
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE CASCADE;
 
ALTER TABLE EcoBox ADD CONSTRAINT FK_EcoBox_2
    FOREIGN KEY (fk_Endereço_Endereço_PK)
    REFERENCES Endereço (Endereço_PK)
    ON DELETE SET NULL;
  
ALTER TABLE ME_ecoPlus ADD CONSTRAINT FK_ME_ecoPlus_2
    FOREIGN KEY (fk_Planos_ME_id_plano)
    REFERENCES Planos_ME (id_plano)
    ON DELETE CASCADE;
 
ALTER TABLE ME_ecoPremium ADD CONSTRAINT FK_ME_ecoPremium_2
    FOREIGN KEY (fk_Planos_ME_id_plano)
    REFERENCES Planos_ME (id_plano)
    ON DELETE CASCADE;
 
ALTER TABLE ecobox_Planos ADD CONSTRAINT FK_ecobox_Planos_2
    FOREIGN KEY (fk_plano_plano_PK)
    REFERENCES plano (plano_PK)
    ON DELETE SET NULL;
 
ALTER TABLE Perguntas_quiz ADD CONSTRAINT FK_Perguntas_quiz_2
    FOREIGN KEY (fk_alternativa_quiz_id_resposta)
    REFERENCES alternativa_quiz (id_resposta)
    ON DELETE RESTRICT;
 
ALTER TABLE alternativa_quiz ADD CONSTRAINT FK_alternativa_quiz_2
    FOREIGN KEY (fk_Tipos_de_pele_id_tipo)
    REFERENCES Tipos_de_pele (id_tipo)
    ON DELETE RESTRICT;
 
ALTER TABLE Cartao_Credito ADD CONSTRAINT FK_Cartao_Credito_2
    FOREIGN KEY (fk_apelido_cartao_apelido_cartao_PK)
    REFERENCES apelido_cartao (apelido_cartao_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Cartao_Credito ADD CONSTRAINT FK_Cartao_Credito_3
    FOREIGN KEY (fk_Transacao_id_transacao)
    REFERENCES Transacao (id_transacao)
    ON DELETE CASCADE;
 
ALTER TABLE Pix ADD CONSTRAINT FK_Pix_2
    FOREIGN KEY (fk_Transacao_id_transacao)
    REFERENCES Transacao (id_transacao)
    ON DELETE CASCADE;
 
ALTER TABLE Boleto ADD CONSTRAINT FK_Boleto_2
    FOREIGN KEY (fk_Transacao_id_transacao)
    REFERENCES Transacao (id_transacao)
    ON DELETE CASCADE;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE RESTRICT;
 
ALTER TABLE comprar ADD CONSTRAINT FK_comprar_2
    FOREIGN KEY (fk_EcoBox_id_EcoBox)
    REFERENCES EcoBox (id_EcoBox)
    ON DELETE SET NULL;
 
ALTER TABLE conter ADD CONSTRAINT FK_conter_1
    FOREIGN KEY (fk_EcoBox_id_EcoBox)
    REFERENCES EcoBox (id_EcoBox)
    ON DELETE RESTRICT;
 
ALTER TABLE conter ADD CONSTRAINT FK_conter_2
    FOREIGN KEY (fk_ecobox_Planos_id_plano)
    REFERENCES ecobox_Planos (id_plano)
    ON DELETE RESTRICT;
 
ALTER TABLE Obter ADD CONSTRAINT FK_Obter_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE Obter ADD CONSTRAINT FK_Obter_2
    FOREIGN KEY (fk_Planos_ME_id_plano)
    REFERENCES Planos_ME (id_plano)
    ON DELETE SET NULL;
 
ALTER TABLE efetuar ADD CONSTRAINT FK_efetuar_1
    FOREIGN KEY (fk_Transacao_id_transacao)
    REFERENCES Transacao (id_transacao)
    ON DELETE RESTRICT;
 
ALTER TABLE efetuar ADD CONSTRAINT FK_efetuar_2
    FOREIGN KEY (fk_ecobox_Planos_id_plano)
    REFERENCES ecobox_Planos (id_plano)
    ON DELETE RESTRICT;
 
ALTER TABLE ler ADD CONSTRAINT FK_ler_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario)
    ON DELETE SET NULL;
 
ALTER TABLE ler ADD CONSTRAINT FK_ler_2
    FOREIGN KEY (fk_Blog_id_artigo)
    REFERENCES Blog (id_artigo)
    ON DELETE SET NULL;
 
ALTER TABLE Lista_desejos ADD CONSTRAINT FK_Lista_desejos_1
    FOREIGN KEY (fk_Usuario_id_usuario)
    REFERENCES Usuario (id_usuario);
 
ALTER TABLE Lista_desejos ADD CONSTRAINT FK_Lista_desejos_2
    FOREIGN KEY (fk_Produtos_id_produto)
    REFERENCES Produtos (id_produto);
 
ALTER TABLE Eco_diamond ADD CONSTRAINT FK_Eco_diamond_2
    FOREIGN KEY (fk_ecobox_Planos_id_plano)
    REFERENCES ecobox_Planos (fk_plano_plano_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Eco_gold ADD CONSTRAINT FK_Eco_gold_2
    FOREIGN KEY (fk_ecobox_Planos_id_plano)
    REFERENCES ecobox_Planos (fk_plano_plano_PK)
    ON DELETE CASCADE;
 
ALTER TABLE Eco_platinum ADD CONSTRAINT FK_Eco_platinum_2
    FOREIGN KEY (fk_ecobox_Planos_id_plano)
    REFERENCES ecobox_Planos (fk_plano_plano_PK)
    ON DELETE CASCADE;