CREATE TABLE `cursos` (
  `id_curso` int PRIMARY KEY,
  `nome_curso` varchar(255),
  `categoria` varchar(255),
  `duracao_curso` int
);

CREATE TABLE `turmas` (
  `id_turma` int PRIMARY KEY,
  `id_professor` int,
  `id_materia` int
);

CREATE TABLE `alunos` (
  `id_matricula` int PRIMARY KEY,
  `id_turma` int,
  `nome_aluno` varchar(255),
  `cpf_aluno` int,
  `endereco_aluno` varchar(255),
  `telefone_aluno` varchar(11),
  `data_nascimento_aluno` datetime
);

CREATE TABLE `materia` (
  `id_materia` int PRIMARY KEY,
  `id_curso` int,
  `nome_materia` varchar(255),
  `conteudo_materia` blob
);

CREATE TABLE `notas` (
  `id_matricula` int PRIMARY KEY,
  `id_materia` int,
  `nota` int
);

CREATE TABLE `professores` (
  `id_professor` int PRIMARY KEY,
  `nome_professor` varchar(255),
  `cpf_professor` int,
  `numero_professor` varchar(11)
);

ALTER TABLE `materia` ADD FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`);

ALTER TABLE `alunos` ADD FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`);

ALTER TABLE `turmas` ADD FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id_professor`);

ALTER TABLE `notas` ADD FOREIGN KEY (`id_matricula`) REFERENCES `alunos` (`id_matricula`);

ALTER TABLE `notas` ADD FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`);

ALTER TABLE `turmas` ADD FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`);
