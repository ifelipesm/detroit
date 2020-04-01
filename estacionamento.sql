
/* SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0; */
/* SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0; */
/* SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'; */


-- -----------------------------------------------------
-- Table `estacionamento`.`vaga_tipo`
-- -----------------------------------------------------

CREATE TABLE vaga_tipo (
  [id] INT NOT NULL IDENTITY,
  [descricao] VARCHAR(45) NOT NULL,
  PRIMARY KEY ([id]))
;

-- -----------------------------------------------------
-- Table `estacionamento`.`vaga`
-- -----------------------------------------------------
CREATE TABLE vaga (
  [id] INT NOT NULL IDENTITY,
  [andar] INT NOT NULL,
  [numero] INT CHECK ([numero] > 0) NOT NULL,
  [largura] INT NULL ,
  [altura] INT NULL ,
  [ocupada] SMALLINT NULL ,
  [vaga_tipo_id] INT NOT NULL,
  PRIMARY KEY ([id]),
  CONSTRAINT [fk_vaga_vaga_tipo]
    FOREIGN KEY ([vaga_tipo_id])
    REFERENCES vaga_tipo ([id])
)
;


-- -----------------------------------------------------
-- Table `estacionamento`.`cliente`
-- -----------------------------------------------------
CREATE TABLE cliente (
  [id] INT NOT NULL IDENTITY,
  [nome] VARCHAR(100) NOT NULL,
  [cpf] VARCHAR(11) NOT NULL,
  PRIMARY KEY ([id]))
;


-- -----------------------------------------------------
-- Table `estacionamento`.`carro`
-- -----------------------------------------------------
CREATE TABLE carro (
  [id] INT NOT NULL IDENTITY,
  [modelo] VARCHAR(45) NOT NULL,
  [cor] VARCHAR(45) NOT NULL,
  [placa] VARCHAR(45) NOT NULL,
  [status]  SMALLINT  NULL,
  [cliente_id] INT NOT NULL,
  PRIMARY KEY ([id]),
  CONSTRAINT [fk_carro_cliente1]
    FOREIGN KEY ([cliente_id])
    REFERENCES cliente ([id])
)

-- -----------------------------------------------------
-- Table `estacionamento`.`vaga_historico`
-- -----------------------------------------------------
CREATE TABLE vaga_historico (
  [id] INT NOT NULL IDENTITY,
  [vaga_id] INT NOT NULL,
  [carro_id] INT NOT NULL,
  [entrada] VARCHAR(20) NOT NULL,
  [saida] VARCHAR(20) NULL,
  PRIMARY KEY ([id]),
  CONSTRAINT [fk_vaga_historico_vaga1]
    FOREIGN KEY ([vaga_id])
    REFERENCES vaga ([id]),
  CONSTRAINT [fk_vaga_historico_carro1]
    FOREIGN KEY ([carro_id])
    REFERENCES carro ([id])
)
;

-- -----------------------------------------------------
-- Table `estacionamento`.`forma_pagamento`
-- -----------------------------------------------------
CREATE TABLE forma_pagamento (
  [id] INT NOT NULL IDENTITY,
  [descricao] VARCHAR(45) NULL,
  PRIMARY KEY ([id]))
;

-- -----------------------------------------------------
-- Table `estacionamento`.`cliente_historico`
-- -----------------------------------------------------
CREATE TABLE cliente_historico (
  [id] INT NOT NULL IDENTITY,
  [vaga_historico_id] INT NOT NULL,
  [valor] DECIMAL(10,2) NULL,
  [forma_pagamento_id] INT NOT NULL,
  PRIMARY KEY ([id]),
  CONSTRAINT [fk_cliente_historico_vaga_historico1]
    FOREIGN KEY ([vaga_historico_id])
    REFERENCES vaga_historico ([id]),
  CONSTRAINT [fk_cliente_historico_forma_pagamento1]
    FOREIGN KEY ([forma_pagamento_id])
    REFERENCES forma_pagamento ([id])
)
;

CREATE TABLE [tipo_login] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [nome] VARCHAR (30) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [login] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [tipo_login] INT          NOT NULL,
    [login]      VARCHAR (45) NULL,
    [senha]      VARCHAR (45) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [fk_tipo_login_login] FOREIGN KEY ([tipo_login]) REFERENCES [dbo].[tipo_login] ([Id])
);



-- -----------------------------------------------------
-- AMOSTRA DE DADOS CRIADA PARA TESTES INICIAIS
-- -----------------------------------------------------

SET IDENTITY_INSERT [dbo].[vaga_tipo] ON
INSERT INTO [dbo].[vaga_tipo] ([id], [descricao]) VALUES (1, N'COMUM')
INSERT INTO [dbo].[vaga_tipo] ([id], [descricao]) VALUES (2, N'DEFICIENTE')
INSERT INTO [dbo].[vaga_tipo] ([id], [descricao]) VALUES (3, N'OUTRO')
SET IDENTITY_INSERT [dbo].[vaga_tipo] OFF


SET IDENTITY_INSERT [dbo].[vaga] ON
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (1, 1, 1, 500, 500, 0, 1)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (2, 1, 2, 500, 500, 0, 1)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (3, 1, 3, 500, 500, 0, 1)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (4, 1, 4, 400, 600, 0, 2)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (7, 1, 5, 500, 500, 0, 2)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (8, 1, 6, 500, 500, 0, 1)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (9, 1, 7, 500, 500, 0, 1)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (10, 2, 1, 500, 500, 0, 3)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (11, 2, 2, 500, 500, 0, 3)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (12, 2, 3, 500, 500, 0, 3)
INSERT INTO [dbo].[vaga] ([id], [andar], [numero], [largura], [altura], [ocupada], [vaga_tipo_id]) VALUES (13, 2, 4, 500, 500, 0, 1)
SET IDENTITY_INSERT [dbo].[vaga] OFF


SET IDENTITY_INSERT [dbo].[tipo_login] ON
INSERT INTO [dbo].[tipo_login] ([Id], [nome]) VALUES (1, N'administrador')
INSERT INTO [dbo].[tipo_login] ([Id], [nome]) VALUES (2, N'operador')
SET IDENTITY_INSERT [dbo].[tipo_login] OFF

SET IDENTITY_INSERT [dbo].[login] ON
INSERT INTO [dbo].[login] ([Id], [tipo_login], [login], [senha]) VALUES (1, 1, N'adm', '42ef63e7836ef622d9185c1a456051edf16095cc')
INSERT INTO [dbo].[login] ([Id], [tipo_login], [login], [senha]) VALUES (2, 2, N'operador','9d24de3ac7b5fbbe776a6d90fe25a7e3c74a29cc')
SET IDENTITY_INSERT [dbo].[login] OFF

SET IDENTITY_INSERT [dbo].[forma_pagamento] ON
INSERT INTO [dbo].[forma_pagamento] ([id], [descricao]) VALUES (1, N'DINHEIRO')
INSERT INTO [dbo].[forma_pagamento] ([id], [descricao]) VALUES (2, N'DÉBITO')
INSERT INTO [dbo].[forma_pagamento] ([id], [descricao]) VALUES (3, N'CRÉDITO')
SET IDENTITY_INSERT [dbo].[forma_pagamento] OFF

SET IDENTITY_INSERT [dbo].[cliente] ON
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (1, N'ROGER', N'12345678911')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (2, N'JOAO', N'11987654321')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (3, N'MARCIA', N'13146479711')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (4, N'ROBERTO', N'15648678921')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (6, N'FERNANDO', N'78945612354')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (7, N'MARCELO', N'55466577813')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (8, N'JOANA', N'15795432499')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (9, N'PAULO', N'02487512677')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (10, N'JESSICA', N'03578545244')
INSERT INTO [dbo].[cliente] ([id], [nome], [cpf]) VALUES (11, N'ERICA', N'99454835421')
SET IDENTITY_INSERT [dbo].[cliente] OFF

SET IDENTITY_INSERT [dbo].[carro] ON
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (1, N'HONDA CIVIC', N'PRATA', N'HGX8732', 1)
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (2, N'GOL', N'VERMELHO', N'SUR3812', 2)
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (4, N'BMW', N'BRANCO', N'BMW0030', 3)
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (5, N'HYUNDAI', N'AZUL', N'HSU5443', 4)
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (6, N'AUDI TT', N'BRANCO', N'HBO4235', 6)
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (7, N'UNO', N'OLIVA', N'HTX9952', 8)
INSERT INTO [dbo].[carro] ([id], [modelo], [cor], [placa], [cliente_id]) VALUES (8, N'SIENA', N'PRETO', N'TSF1341', 9)
SET IDENTITY_INSERT [dbo].[carro] OFF

SET IDENTITY_INSERT  [dbo].[vaga_historico] ON
INSERT INTO [dbo].[vaga_historico] ([id], [vaga_id], [carro_id], [entrada], [saida]) VALUES (1, 1, 1, N'2019-12-31 09:01:01', N'2019-12-31 12:01:01')
INSERT INTO [dbo].[vaga_historico] ([id], [vaga_id], [carro_id], [entrada], [saida]) VALUES (2, 2, 2, N'2019-12-31 09:01:01', N'2019-12-31 12:01:01')
INSERT INTO [dbo].[vaga_historico] ([id], [vaga_id], [carro_id], [entrada], [saida]) VALUES (3, 3, 4, N'2019-12-31 12:01:01', N'2019-12-31 15:01:01')
SET IDENTITY_INSERT [dbo].[vaga_historico] OFF

SET IDENTITY_INSERT [dbo].[cliente_historico] ON
INSERT INTO [dbo].[cliente_historico] ([id], [vaga_historico_id], [valor], [forma_pagamento_id]) VALUES (1, 1, CAST(10.00 AS Decimal(10, 2)), 1)
INSERT INTO [dbo].[cliente_historico] ([id], [vaga_historico_id], [valor], [forma_pagamento_id]) VALUES (2, 2, CAST(10.00 AS Decimal(10, 2)), 2)
INSERT INTO [dbo].[cliente_historico] ([id], [vaga_historico_id], [valor], [forma_pagamento_id]) VALUES (3, 3, CAST(10.00 AS Decimal(10, 2)), 3)
SET IDENTITY_INSERT [dbo].[cliente_historico] OFF

/* SET SQL_MODE=@OLD_SQL_MODE; */
/* SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS; */
/* SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS; */
