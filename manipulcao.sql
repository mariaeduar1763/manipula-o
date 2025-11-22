-- Inserção de dados
INSERT INTO Livros (titulo, autor, ano_publicacao, genero) VALUES 
('1984', 'George Orwell', 1949, 'Ficção Distópica'),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 'Fantasia');

INSERT INTO Usuarios (nome, email, telefone) VALUES 
('João Silva', 'joao@email.com', '11999999999'),
('Maria Santos', 'maria@email.com', '11888888888');

INSERT INTO Emprestimos (id_livro, id_usuario, data_emprestimo) VALUES 
(1, 1, '2023-10-01'),
(2, 2, '2023-10-05');

-- Atualização de dados (exemplo: marcar devolução)
UPDATE Emprestimos SET data_devolucao = '2023-10-15' WHERE id = 1;

-- Remoção de dados (exemplo: remover um empréstimo)
DELETE FROM Emprestimos WHERE id = 2;

-- Consultas
-- Listar todos os livros
SELECT * FROM Livros;

-- Listar empréstimos ativos (sem data de devolução)
SELECT e.id, l.titulo, u.nome, e.data_emprestimo 
FROM Emprestimos e 
JOIN Livros l ON e.id_livro = l.id 
JOIN Usuarios u ON e.id_usuario = u.id 
WHERE e.data_devolucao IS NULL;

-- Contar livros por gênero
SELECT genero, COUNT(*) AS quantidade FROM Livros GROUP BY genero;