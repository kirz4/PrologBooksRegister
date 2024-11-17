% Inicializa a lista de livros
livros_iniciais([
    livro('1984', 'George Orwell', 'Ficcao Cientifica', [9, 10, 8, 9]),
    livro('O Senhor dos Aneis', 'J.R.R. Tolkien', 'Fantasia', [10, 10, 9, 10]),
    livro('Dom Casmurro', 'Machado de Assis', 'Romance', [8, 9, 7, 8]),
    livro('Clean Code', 'Robert C. Martin', 'Tecnologia', [9, 8, 10, 9]),
    livro('Duna', 'Frank Herbert', 'Ficcao Cientifica', [10, 9, 9, 8])
]).


% Recupera a lista inicial de livros
livros(LivrosAtuais) :-
    livros_iniciais(LivrosAtuais).

% Adicionar novos livros à lista
adicionar_livro(Titulo, Autor, Categoria, Notas, LivrosAtuais, NovosLivros) :-
    append(LivrosAtuais, [livro(Titulo, Autor, Categoria, Notas)], NovosLivros).

% Listar todos os livros
listar_livros([]) :-
    write('Nenhum livro encontrado!'), nl.
listar_livros([livro(Titulo, Autor, Categoria, Notas) | Resto]) :-
    format('Titulo: ~w, Autor: ~w, Categoria: ~w, Notas: ~w~n', [Titulo, Autor, Categoria, Notas]),
    listar_livros(Resto).

% Listar livros por categoria
listar_livros_por_categoria(_, []) :-
    writeln('Nenhum livro encontrado para esta categoria.').
listar_livros_por_categoria(Categoria, [livro(Titulo, Autor, Categoria, Notas) | Resto]) :-
    format('Titulo: ~w, Autor: ~w, Notas: ~w~n', [Titulo, Autor, Notas]),
    listar_livros_por_categoria(Categoria, Resto).
listar_livros_por_categoria(Categoria, [_ | Resto]) :-
    listar_livros_por_categoria(Categoria, Resto).

% Calcular a média das notas de um livro
media_notas(_, [], _) :-
    writeln('Livro não encontrado.').
media_notas(Titulo, [livro(Titulo, _, _, Notas) | _], Media) :-
    soma_lista(Notas, Soma),
    comprimento(Notas, Comprimento),
    Comprimento > 0,
    Media is Soma / Comprimento.
media_notas(Titulo, [_ | Resto], Media) :-
    media_notas(Titulo, Resto, Media).

% Função auxiliar para somar os elementos de uma lista
soma_lista([], 0).
soma_lista([H | T], Soma) :-
    soma_lista(T, SomaT),
    Soma is H + SomaT.

% Função auxiliar para calcular o comprimento da lista
comprimento([], 0).
comprimento([_ | T], Comprimento) :-
    comprimento(T, ComprimentoT),
    Comprimento is ComprimentoT + 1.

% Criar um novo livro
criar_livro(LivrosAtuais, NovosLivros) :-
    write('Titulo: '), read_line_to_string(user_input, Titulo),
    write('Autor: '), read_line_to_string(user_input, Autor),
    write('Categoria: '), read_line_to_string(user_input, Categoria),
    write('Notas (ex: [9, 8, 10]): '), read(Notas),
    adicionar_livro(Titulo, Autor, Categoria, Notas, LivrosAtuais, NovosLivros),
    format('Livro ~w registrado com sucesso!~n', [Titulo]).

% Adicionar uma nova nota a um livro existente
adicionar_nota(Titulo, NovaNota, NovosLivros) :-
    livros(LivrosAtuais),  % Recupera os livros atuais
    atualizar_livros(Titulo, NovaNota, LivrosAtuais, [], NovosLivros),  % Atualiza a lista de livros
    format('Lista de livros atualizada: ~w~n', [NovosLivros]).  % Exibe a lista atualizada

% Atualizar os livros na lista
atualizar_livros(_, _, [], Atualizados, Atualizados) :-
    write('Livro nao encontrado! Lista Atual: '), write(Atualizados), nl.
atualizar_livros(Titulo, NovaNota, [livro(Titulo, Autor, Categoria, Notas) | Resto], Atualizados, NovosLivros) :-
    write('Atualizando livro: '), write(Titulo), nl,
    append(Notas, [NovaNota], NovasNotas),  % Adiciona a nova nota
    append(Atualizados, [livro(Titulo, Autor, Categoria, NovasNotas)], LivrosParciais),  % Atualiza a lista parcial
    atualizar_livros(Titulo, NovaNota, Resto, LivrosParciais, NovosLivros).
atualizar_livros(Titulo, NovaNota, [Livro | Resto], Atualizados, NovosLivros) :-
    append(Atualizados, [Livro], LivrosParciais),
    atualizar_livros(Titulo, NovaNota, Resto, LivrosParciais, NovosLivros).

