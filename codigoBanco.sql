CREATE TABLE Paciente (
  codpac         SERIAL NOT NULL, 
  nomepac        varchar(255) NOT NULL, 
  cpfpac         varchar(11) NOT NULL UNIQUE, 
  sexpac         varchar(1) NOT NULL, 
  telpac         varchar(255) NOT NULL, 
  datanasc       date NOT NULL, 
  peso           int4 NOT NULL, 
  suspeito       varchar(255) NOT NULL, 
  positivado     varchar(1) NOT NULL, 
  Hospitalcodhos int4 NOT NULL)
  Empresacodemp int4 NOT NULL)
ALTER TABLE Paciente ADD CONSTRAINT codpac PRIMARY KEY (codpac)

CREATE TABLE Sintomas (
  codsint  SERIAL NOT NULL, 
  nomesint varchar(255) NOT NULL)
ALTER TABLE Sintomas ADD PRIMARY KEY (codsint)

CREATE TABLE Paciente_Sintomas (
  Pacientecodpac  int4 NOT NULL, 
  Sintomascodsint int4 NOT NULL)
  
ALTER TABLE Paciente_Sintomas ADD PRIMARY KEY (Pacientecodpac, Sintomascodsint)

CREATE TABLE Hospital (
  codhos  SERIAL NOT NULL, 
  nomhosp varchar(255) NOT NULL, 
  telef   varchar(12) NOT NULL, 
  esthos  varchar(2) NOT NULL, 
  cidhos  varchar(255) NOT NULL, 
  ruahos  varchar(255) NOT NULL)
ALTER TABLE Hospital ADD PRIMARY KEY (codhos)

CREATE TABLE Endereco (
  rua            varchar(255) NOT NULL, 
  bairro         varchar(255) NOT NULL, 
  comp           int4, 
  num            int4, 
  Pacientecodpac int4 NOT NULL, 
  Cidadecodcid   int4 NOT NULL)
  
CREATE TABLE Questionario (
  Pacientecodpac int4 NOT NULL, 
  pesopac        numeric(5, 2) NOT NULL, 
  altpac         numeric(3, 2) NOT NULL, 
  bebe           varchar(255) NOT NULL, 
  fuma           varchar(1) NOT NULL, 
  relacsex       varchar(1) NOT NULL, 
  tipsang        varchar(3) NOT NULL)
  
CREATE TABLE Cidade (
  codcid  SERIAL NOT NULL, 
  nomecid varchar(80) NOT NULL, 
  est     varchar(80) NOT NULL)
ALTER TABLE Cidade ADD PRIMARY KEY (codcid)

CREATE TABLE Empresa (
  codemp       SERIAL NOT NULL, 
  nomeemp      varchar(255) NOT NULL, 
  cnpj         numeric(13, 0) NOT NULL, 
  ruaemp       varchar(255) NOT NULL, 
  bairroemp    varchar(255) NOT NULL, 
  Cidadecodcid int4 NOT NULL)
ALTER TABLE Empresa ADD PRIMARY KEY (codemp)


insert into Empresa values(
	1, 'Eletrobras', 01202212121112, 'Avenida do Abreu', 'Centro', 1
);

ALTER TABLE Paciente_Sintomas ADD CONSTRAINT FKPaciente_S516710 FOREIGN KEY (Pacientecodpac) REFERENCES Paciente (codpac)
ALTER TABLE Paciente_Sintomas ADD CONSTRAINT FKPaciente_S824946 FOREIGN KEY (Sintomascodsint) REFERENCES Sintomas (codsint)
ALTER TABLE Paciente ADD CONSTRAINT FKPaciente300502 FOREIGN KEY (Hospitalcodhos) REFERENCES Hospital (codhos)
ALTER TABLE Questionario ADD CONSTRAINT FKQuestionar555707 FOREIGN KEY (Pacientecodpac) REFERENCES Paciente (codpac)
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco525211 FOREIGN KEY (Pacientecodpac) REFERENCES Paciente (codpac)
ALTER TABLE Endereco ADD CONSTRAINT FKEndereco958290 FOREIGN KEY (Cidadecodcid) REFERENCES Cidade (codcid)
ALTER TABLE Empresa ADD CONSTRAINT FKEmpresa963271 FOREIGN KEY (Cidadecodcid) REFERENCES Cidade (codcid)
