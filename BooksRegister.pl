% Fatos: livro(Título, Autor, Categoria, Notas).
livro('1984', 'George Orwell', 'Ficcao Cientifica', [9, 10, 8, 9]).
livro('O Senhor dos Anéis', 'J.R.R. Tolkien', 'Fantasia', [10, 10, 9, 10]).
livro('Dom Casmurro', 'Machado de Assis', 'Romance', [8, 9, 7, 8]).
livro('Clean Code', 'Robert C. Martin', 'Tecnologia', [9, 8, 10, 9]).
livro('Duna', 'Frank Herbert', 'Ficcao Cientifica', [10, 9, 9, 8]).

% Regra para listar livros de uma categoria específica
listar_livros_categoria(Categoria, Titulo, Autor, Notas) :-
    livro(Titulo, Autor, Categoria, Notas).

% Regra para calcular a média das notas de um livro
media_notas(Titulo, Media) :-
    livro(Titulo, _, _, Notas),
    soma_lista(Notas, Soma),
    comprimento(Notas, Comprimento),
    Comprimento > 0,
    Media is Soma / Comprimento.

% Função auxiliar para somar os elementos de uma lista
soma_lista([], 0).
soma_lista([H|T], Soma) :-
    soma_lista(T, SomaT),
    Soma is H + SomaT.

% Função auxiliar para calcular o comprimento da lista
comprimento([], 0).
comprimento([_|T], Comprimento) :-
    comprimento(T, ComprimentoT),
    Comprimento is ComprimentoT + 1.
