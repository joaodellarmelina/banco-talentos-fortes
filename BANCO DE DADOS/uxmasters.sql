/*
Banco de Dados, Projeto Integrado
Grupo: UXMasters
Integrantes: Erick Jun, Gabriel Erlach,
Gustavo Müller, João Vitor Dellarmelina,
Marcos Macedo, Théo Alves
*/

-- Exclui o banco de dados "fortes" caso exista
drop database if exists fortes;

-- Exclui o usuário "uxmasters" caso exista
drop user if exists uxmasters;

-- Cria o usuário "uxmasters" com permissão para criar banco de dados, criar usuário/role e com a senha criptografada
create user uxmasters with createdb createrole encrypted password 'raiz';

-- Cria o banco de dados com nome "fortes" e com o usuário "uxmasters" como dono
create database fortes with 
owner = uxmasters;

-- Se conecta ao banco de dados "fortes", com o usuário "uxmasters", sem precisar de senha quando rodar o script
\c "dbname = fortes user = uxmasters password = raiz"

-- Cria o schema "bancodetalentos" dando autorização para o usuário "uxmasters"
create schema talentos authorization uxmasters;

-- Altera o search_path para o schema "bancodetalentos", tornando esse o schema padrão
ALTER USER uxmasters
SET SEARCH_PATH TO talentos, "$user", public;


CREATE TABLE talentos.cpf_gestor (
                cpf_g NUMERIC(11) NOT NULL,
                nome VARCHAR(32) NOT NULL,
                CONSTRAINT cpf_g PRIMARY KEY (cpf_g)
);
COMMENT ON TABLE talentos.cpf_gestor IS 'Tabela para identificar o CPF do Gestor';
COMMENT ON COLUMN talentos.cpf_gestor.cpf_g IS 'CPF do Gestor';
COMMENT ON COLUMN talentos.cpf_gestor.nome IS 'Nome do Gestor';


CREATE TABLE talentos.hobbies (
                cod_hobbie NUMERIC(10) NOT NULL,
                nome_hobbie VARCHAR(512) NOT NULL,
                CONSTRAINT cod_hobbies PRIMARY KEY (cod_hobbie)
);
COMMENT ON TABLE talentos.hobbies IS 'Tabela para armazenar os hobbies dos func';
COMMENT ON COLUMN talentos.hobbies.cod_hobbie IS 'Codigo de ID dos hobbies dos FUNC';
COMMENT ON COLUMN talentos.hobbies.nome_hobbie IS 'Coluna que contém os nomes de hobbies dos func';


CREATE TABLE talentos.habi_profissionais (
                cod_profissional NUMERIC(10) NOT NULL,
                nome_profissional NUMERIC(10) NOT NULL,
                CONSTRAINT cod_profissional PRIMARY KEY (cod_profissional)
);
COMMENT ON TABLE talentos.habi_profissionais IS 'Tabela para conter as habilidades profissionais dos FUNC.';
COMMENT ON COLUMN talentos.habi_profissionais.cod_profissional IS 'Codigo para ID das habilidades profissionais dos FUNC';
COMMENT ON COLUMN talentos.habi_profissionais.nome_profissional IS 'Nome das habilidades profissional (HARD SKILL)';


CREATE TABLE talentos.habi_pessoais (
                cod_pessoal NUMERIC(10) NOT NULL,
                nome_pessoal VARCHAR(512) NOT NULL,
                CONSTRAINT cod_pessoais PRIMARY KEY (cod_pessoal)
);
COMMENT ON TABLE talentos.habi_pessoais IS 'Tabela para armazenar as habilidades pessoais.';
COMMENT ON COLUMN talentos.habi_pessoais.cod_pessoal IS 'Codigo para identificar as habilidades pessoais dos func';
COMMENT ON COLUMN talentos.habi_pessoais.nome_pessoal IS 'Nome das habilidades pessoais (SOFT SKILLS).';


CREATE TABLE talentos.tabela_cep (
                cep NUMERIC(8) NOT NULL,
                CONSTRAINT cep PRIMARY KEY (cep)
);
COMMENT ON TABLE talentos.tabela_cep IS 'Tabela de validacao de CEP
';
COMMENT ON COLUMN talentos.tabela_cep.cep IS 'CEP para identificar o endereco do func e gestor.';


CREATE TABLE talentos.tabela_uf (
                uf VARCHAR(2) NOT NULL,
                cep NUMERIC(8) NOT NULL,
                CONSTRAINT uf PRIMARY KEY (uf, cep)
);
COMMENT ON TABLE talentos.tabela_uf IS 'Tabela de validacao para o estado dos endereços.
';
COMMENT ON COLUMN talentos.tabela_uf.uf IS 'Coluna com o UF dos CEP';
COMMENT ON COLUMN talentos.tabela_uf.cep IS 'CEP para identificar o endereco do func e gestor.';


CREATE TABLE talentos.tabela_cidades (
                cidades VARCHAR(32) NOT NULL,
                uf VARCHAR(2) NOT NULL,
                cep NUMERIC(8) NOT NULL,
                CONSTRAINT cidades PRIMARY KEY (cidades, uf, cep)
);
COMMENT ON TABLE talentos.tabela_cidades IS 'Tabela de validação que irá conter CIDADES.';
COMMENT ON COLUMN talentos.tabela_cidades.cidades IS 'Cidades para validacao de CEP';
COMMENT ON COLUMN talentos.tabela_cidades.uf IS 'Coluna com o UF dos CEP';
COMMENT ON COLUMN talentos.tabela_cidades.cep IS 'CEP para identificar o endereco do func e gestor.';


CREATE TABLE talentos.tabela_bairros (
                bairros VARCHAR(32) NOT NULL,
                cidades VARCHAR(32) NOT NULL,
                uf VARCHAR(2) NOT NULL,
                cep NUMERIC(8) NOT NULL,
                CONSTRAINT bairros PRIMARY KEY (bairros, cidades, uf, cep)
);
COMMENT ON TABLE talentos.tabela_bairros IS 'Tabela de validação de BAIRROS';
COMMENT ON COLUMN talentos.tabela_bairros.bairros IS 'Coluna para os BAIRROS para o CEP';
COMMENT ON COLUMN talentos.tabela_bairros.cidades IS 'Cidades para validacao de CEP';
COMMENT ON COLUMN talentos.tabela_bairros.uf IS 'Coluna com o UF dos CEP';
COMMENT ON COLUMN talentos.tabela_bairros.cep IS 'CEP para identificar o endereco do func e gestor.';


CREATE TABLE talentos.tabela_logradouro (
                logradouro VARCHAR(512) NOT NULL,
                bairros VARCHAR(32) NOT NULL,
                cidades VARCHAR(32) NOT NULL,
                uf VARCHAR(2) NOT NULL,
                cep NUMERIC(8) NOT NULL,
                CONSTRAINT logradouro PRIMARY KEY (logradouro, bairros, cidades, uf, cep)
);
COMMENT ON TABLE talentos.tabela_logradouro IS 'Tabela de validacao de CEP para passar o logradouro.';
COMMENT ON COLUMN talentos.tabela_logradouro.logradouro IS 'Coluna para conter o LOGRADOURO atraves do CEP.';
COMMENT ON COLUMN talentos.tabela_logradouro.bairros IS 'Coluna para os BAIRROS para o CEP';
COMMENT ON COLUMN talentos.tabela_logradouro.cidades IS 'Cidades para validacao de CEP';
COMMENT ON COLUMN talentos.tabela_logradouro.uf IS 'Coluna com o UF dos CEP';
COMMENT ON COLUMN talentos.tabela_logradouro.cep IS 'CEP para identificar o endereco do func e gestor.';


CREATE TABLE talentos.gestor (
                cod_gestor NUMERIC(10) NOT NULL,
                cpf_g NUMERIC(11) NOT NULL,
                descricao VARCHAR,
                senha VARCHAR(32) NOT NULL,
                data_nascimento DATE NOT NULL,
                departamento VARCHAR(32) NOT NULL,
                foto_perfil BYTEA NOT NULL,
                email VARCHAR(512),
                numero NUMERIC(10) NOT NULL,
                telefone NUMERIC(10) NOT NULL,
                complemento VARCHAR(512),
                cep NUMERIC(8) NOT NULL,
                CONSTRAINT cod_gestor PRIMARY KEY (cod_gestor)
);
COMMENT ON TABLE talentos.gestor IS 'Tabela que ira receber os dados dos gestores.';
COMMENT ON COLUMN talentos.gestor.cod_gestor IS 'Codigo de identificacao que ira diferenciar os gestores.';
COMMENT ON COLUMN talentos.gestor.cpf_g IS 'CPF do Gestor';
COMMENT ON COLUMN talentos.gestor.descricao IS 'Pequena descricao para o perfil do gestor.';
COMMENT ON COLUMN talentos.gestor.senha IS 'Senha de acesso do gestor.';
COMMENT ON COLUMN talentos.gestor.data_nascimento IS 'Data de nascimento do gestor.
';
COMMENT ON COLUMN talentos.gestor.departamento IS 'Departamento no qual o gestor e responsavel.';
COMMENT ON COLUMN talentos.gestor.foto_perfil IS 'Foto de perfil para o Gestor.';
COMMENT ON COLUMN talentos.gestor.email IS 'EMAIL de contato do gestor.';
COMMENT ON COLUMN talentos.gestor.numero IS 'Numero para endereco do gestor.';
COMMENT ON COLUMN talentos.gestor.telefone IS 'Numero de telefone Gestor.';
COMMENT ON COLUMN talentos.gestor.complemento IS 'Complemento para endereco do gestor.';
COMMENT ON COLUMN talentos.gestor.cep IS 'CEP para identificar o endereco do func e gestor.';


CREATE TABLE talentos.funcionarios (
                cpf_func NUMERIC(11) NOT NULL,
                nome VARCHAR(30) NOT NULL,
                senha VARCHAR(32) NOT NULL,
                data_nascimento DATE NOT NULL,
                departamento VARCHAR(10) NOT NULL,
                funcao VARCHAR(64) NOT NULL,
                telefone NUMERIC(10) NOT NULL,
                descricao VARCHAR,
                cep NUMERIC(8) NOT NULL,
                numero NUMERIC(10) NOT NULL,
                complemento VARCHAR(512),
                foto_perfil BYTEA NOT NULL,
                email VARCHAR(512),
                cod_pessoal NUMERIC(10) NOT NULL,
                cod_profissional NUMERIC(10) NOT NULL,
                cod_hobbie NUMERIC(10) NOT NULL,
                CONSTRAINT cpf_func PRIMARY KEY (cpf_func)
);
COMMENT ON TABLE talentos.funcionarios IS 'Tabela que ira armazenar todos dados referentes aos funcionarios que utilizarão o sistema';
COMMENT ON COLUMN talentos.funcionarios.cpf_func IS 'Chave de Identificacao dos funcionarios sera o CPF deles
';
COMMENT ON COLUMN talentos.funcionarios.nome IS 'Nome do funcionario.';
COMMENT ON COLUMN talentos.funcionarios.senha IS 'Coluna para armazenar senha de acesso ao sistema.
';
COMMENT ON COLUMN talentos.funcionarios.data_nascimento IS 'Data referente ao nascimento do func
';
COMMENT ON COLUMN talentos.funcionarios.departamento IS 'Departamento no qual o funcionario está.';
COMMENT ON COLUMN talentos.funcionarios.funcao IS 'Funcao do funcionario.
';
COMMENT ON COLUMN talentos.funcionarios.telefone IS 'Numero de telefone FUNC';
COMMENT ON COLUMN talentos.funcionarios.descricao IS 'Pequena biografia do funcionario para seu perfil.	';
COMMENT ON COLUMN talentos.funcionarios.cep IS 'CEP para identificar o endereço do func e gestor.';
COMMENT ON COLUMN talentos.funcionarios.numero IS 'Numero do endereco do func.';
COMMENT ON COLUMN talentos.funcionarios.complemento IS 'Complemento do endereco do func.';
COMMENT ON COLUMN talentos.funcionarios.foto_perfil IS 'Foto para o perfil do funcionario.';
COMMENT ON COLUMN talentos.funcionarios.email IS 'E-mail do funcionario.';
COMMENT ON COLUMN talentos.funcionarios.cod_pessoal IS 'Codigo para identificar as habilidades pessoais dos func';
COMMENT ON COLUMN talentos.funcionarios.cod_profissional IS 'Codigo para ID das habilidades profissionais dos FUNC';
COMMENT ON COLUMN talentos.funcionarios.cod_hobbie IS 'Codigo de ID dos hobbies dos FUNC';


CREATE TABLE talentos.eventos (
                cod_evento NUMERIC(12) NOT NULL,
                cod_gestor NUMERIC(10) NOT NULL,
                nome_evento VARCHAR(32) NOT NULL,
                descricao_evento VARCHAR NOT NULL,
                data_inicio_insc DATE NOT NULL,
                data_fim_insc DATE NOT NULL,
                data_evento DATE NOT NULL,
                foto_evento BYTEA,
                cpf_func NUMERIC(11) NOT NULL,
                CONSTRAINT cod_evento PRIMARY KEY (cod_evento)
);
COMMENT ON TABLE talentos.eventos IS 'Tabela armazena dados sobre os eventos que a empresa Fortes fornece';
COMMENT ON COLUMN talentos.eventos.cod_evento IS 'Codigo de identificacao para diferenciar eventos.';
COMMENT ON COLUMN talentos.eventos.cod_gestor IS 'Codigo de identificacao que ira diferenciar os gestores.';
COMMENT ON COLUMN talentos.eventos.nome_evento IS 'Coluna do nome do evento.';
COMMENT ON COLUMN talentos.eventos.descricao_evento IS 'Descricao sobre o evento proposto.';
COMMENT ON COLUMN talentos.eventos.data_inicio_insc IS 'Data inicio do periodo de inscricao do evento.';
COMMENT ON COLUMN talentos.eventos.data_fim_insc IS 'Data referente ao fim do periodo de inscrição do evento.';
COMMENT ON COLUMN talentos.eventos.data_evento IS 'Data referente ao dia que o evento acontecera.';
COMMENT ON COLUMN talentos.eventos.foto_evento IS 'Foto do evento.';
COMMENT ON COLUMN talentos.eventos.cpf_func IS 'Chave de Identificacao dos funcionarios sera o CPF deles
';


CREATE TABLE talentos.noticias (
                cod_noticias NUMERIC(10) NOT NULL,
                cod_gestor NUMERIC(10) NOT NULL,
                cpf_func NUMERIC(11) NOT NULL,
                titulo_manchete VARCHAR NOT NULL,
                manchete_noticia VARCHAR NOT NULL,
                data_noticia DATE NOT NULL,
                foto_noticia BYTEA NOT NULL,
                CONSTRAINT cod_noticias PRIMARY KEY (cod_noticias)
);
COMMENT ON TABLE talentos.noticias IS 'Tabela responsavel por armazenar as noticias.';
COMMENT ON COLUMN talentos.noticias.cod_noticias IS 'Codigo de identificacao para diferencias as noticias.';
COMMENT ON COLUMN talentos.noticias.cod_gestor IS 'Codigo de identificacao que ira diferenciar os gestores.';
COMMENT ON COLUMN talentos.noticias.cpf_func IS 'Chave de Identificação dos funcionarios será o CPF deles
';
COMMENT ON COLUMN talentos.noticias.titulo_manchete IS 'Coluna criada para ser o titulo da noticia.';
COMMENT ON COLUMN talentos.noticias.manchete_noticia IS 'Coluna criada para a conter a machete da noticia.';
COMMENT ON COLUMN talentos.noticias.data_noticia IS 'Referente a data da noticia.';
COMMENT ON COLUMN talentos.noticias.foto_noticia IS 'Coluna para armazenas a foto da noticia criada.';


CREATE TABLE talentos.treinamentos (
                cod_treinamentos NUMERIC(10) NOT NULL,
                cod_gestor NUMERIC(10) NOT NULL,
                cpf_func NUMERIC(11) NOT NULL,
                nome_treinamento VARCHAR(32) NOT NULL,
                descri_treinamento VARCHAR NOT NULL,
                data_inicio_insc DATE NOT NULL,
                data_fim_insc DATE NOT NULL,
                data_treinamento DATE NOT NULL,
                foto_treinamento BYTEA NOT NULL,
                CONSTRAINT cod_treinamentos PRIMARY KEY (cod_treinamentos)
);
COMMENT ON TABLE talentos.treinamentos IS 'Tabela que irá armazenas todos os eventos propostos.';
COMMENT ON COLUMN talentos.treinamentos.cod_treinamentos IS 'Codigo de identificacao para diferenciar os treinamentos.';
COMMENT ON COLUMN talentos.treinamentos.cod_gestor IS 'Codigo de identificacao que ira diferenciar os gestores.';
COMMENT ON COLUMN talentos.treinamentos.cpf_func IS 'Chave de Identificacao dos funcionarios sera o CPF deles
';
COMMENT ON COLUMN talentos.treinamentos.nome_treinamento IS 'Nome referente ao treinamento proposto.';
COMMENT ON COLUMN talentos.treinamentos.descri_treinamento IS 'Descricao do treinamento.';
COMMENT ON COLUMN talentos.treinamentos.data_inicio_insc IS 'Data referente a data inicio da inscricao.';
COMMENT ON COLUMN talentos.treinamentos.data_fim_insc IS 'Data referente a data fim das inscricoes.';
COMMENT ON COLUMN talentos.treinamentos.data_treinamento IS 'Data referente ao dia do treinamento.';
COMMENT ON COLUMN talentos.treinamentos.foto_treinamento IS 'Foto referente ao treinamento proposto.';


ALTER TABLE talentos.gestor ADD CONSTRAINT cpf_gestor_gestor_fk
FOREIGN KEY (cpf_g)
REFERENCES talentos.cpf_gestor (cpf_g)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.funcionarios ADD CONSTRAINT hobbies_funcionarios_fk
FOREIGN KEY (cod_hobbie)
REFERENCES talentos.hobbies (cod_hobbie)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.funcionarios ADD CONSTRAINT habi_profissionais_funcionarios_fk
FOREIGN KEY (cod_profissional)
REFERENCES talentos.habi_profissionais (cod_profissional)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.funcionarios ADD CONSTRAINT habi_pessoais_funcionarios_fk
FOREIGN KEY (cod_pessoal)
REFERENCES talentos.habi_pessoais (cod_pessoal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.tabela_uf ADD CONSTRAINT cep_uf_fk
FOREIGN KEY (cep)
REFERENCES talentos.tabela_cep (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.funcionarios ADD CONSTRAINT cep_funcionarios_fk
FOREIGN KEY (cep)
REFERENCES talentos.tabela_cep (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.gestor ADD CONSTRAINT cep_gestor_fk
FOREIGN KEY (cep)
REFERENCES talentos.tabela_cep (cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.tabela_cidades ADD CONSTRAINT uf_cidades_fk
FOREIGN KEY (uf, cep)
REFERENCES talentos.tabela_uf (uf, cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.tabela_bairros ADD CONSTRAINT cidades_bairros_fk
FOREIGN KEY (uf, cidades, cep)
REFERENCES talentos.tabela_cidades (uf, cidades, cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.tabela_logradouro ADD CONSTRAINT bairros_logradouro_fk
FOREIGN KEY (bairros, uf, cidades, cep)
REFERENCES talentos.tabela_bairros (bairros, uf, cidades, cep)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.eventos ADD CONSTRAINT gestor_eventos_fk
FOREIGN KEY (cod_gestor)
REFERENCES talentos.gestor (cod_gestor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.treinamentos ADD CONSTRAINT gestor_treinamentos_fk
FOREIGN KEY (cod_gestor)
REFERENCES talentos.gestor (cod_gestor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.noticias ADD CONSTRAINT gestor_not_cias_fk
FOREIGN KEY (cod_gestor)
REFERENCES talentos.gestor (cod_gestor)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.treinamentos ADD CONSTRAINT funcionarios_treinamentos_fk
FOREIGN KEY (cpf_func)
REFERENCES talentos.funcionarios (cpf_func)
ON DELETE NO ACTION
ON UPDATE NO ACTION
DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE talentos.noticias ADD CONSTRAINT funcionarios_not_cias_fk
FOREIGN KEY (cpf_func)
REFERENCES talentos.funcionarios (cpf_func)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE talentos.eventos ADD CONSTRAINT funcionarios_eventos_fk
FOREIGN KEY (cpf_func)
REFERENCES talentos.funcionarios (cpf_func)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;