const createTable = '''
CREATE TABLE grades (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  nome VARCHAR(200) NOT NULL,
  professor VARCHAR(200) NOT NULL,
  nota REAL NOT NULL,
  url_avatar TEXT
);
''';

const insertGrades = '''
INSERT INTO grades (nome, professor, nota, url_avatar)
VALUES ('Matemática', 'XPTO', 10.0, 'https://img.icons8.com/?size=100&id=55206&format=png&color=000000'),
       ('Programação Orientada a Objetos', 'XPTO2', 7.0, 'https://img.icons8.com/?size=100&id=SBEjRDmczSCC&format=png&color=000000'),
       ('Banco de Dados I', 'XPTO3', 8.5, 'https://img.icons8.com/?size=100&id=KZHjwwenS7oK&format=png&color=000000');
''';
