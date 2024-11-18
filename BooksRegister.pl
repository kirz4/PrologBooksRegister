:- dynamic(livros/1).

% Inicializa a lista de livros com os valores padrão
livros_iniciais([
    livro('1984', 'George Orwell', 'Ficcao Cientifica', [9, 10, 8, 9]),
    livro('O Senhor dos Aneis', 'J.R.R. Tolkien', 'Fantasia', [10, 10, 9, 10]),
    livro('Dom Casmurro', 'Machado de Assis', 'Romance', [8, 9, 7, 8]),
    livro('Clean Code', 'Robert C. Martin', 'Tecnologia', [9, 8, 10, 9]),
    livro('Duna', 'Frank Herbert', 'Ficcao Cientifica', [10, 9, 9, 8])
]).

% Inicializa a lista dinâmica de livros
inicializar_livros :-
    retractall(livros(_)),
    livros_iniciais(LivrosAtuais),
    assertz(livros(LivrosAtuais)).

% Adicionar novos livros à lista
adicionar_livro(Titulo, Autor, Categoria, Notas) :-
    livros(LivrosAtuais),
    append(LivrosAtuais, [livro(Titulo, Autor, Categoria, Notas)], NovosLivros),
    retractall(livros(_)),
    assertz(livros(NovosLivros)),
    format('Livro ~w registrado com sucesso!~n', [Titulo]).

% Listar todos os livros
listar_livros :-
    livros(LivrosAtuais),
    (LivrosAtuais = [] ->
        write('Nenhum livro encontrado!'), nl;
        listar_livros(LivrosAtuais)
    ).

listar_livros([]).
listar_livros([livro(Titulo, Autor, Categoria, Notas) | Resto]) :-
    format('Titulo: ~w, Autor: ~w, Categoria: ~w, Notas: ~w~n', [Titulo, Autor, Categoria, Notas]),
    listar_livros(Resto).

% Listar livros por categoria
listar_livros_por_categoria(Categoria) :-
    livros(LivrosAtuais),
    incluir_livros_por_categoria(Categoria, LivrosAtuais, Resultado),
    (Resultado = [] ->
        write('Nenhum livro encontrado para esta categoria.'), nl;
        listar_livros(Resultado)
    ).

incluir_livros_por_categoria(_, [], []).
incluir_livros_por_categoria(Categoria, [livro(Titulo, Autor, Categoria, Notas) | Resto], [livro(Titulo, Autor, Categoria, Notas) | Resultado]) :-
    incluir_livros_por_categoria(Categoria, Resto, Resultado).
incluir_livros_por_categoria(Categoria, [_ | Resto], Resultado) :-
    incluir_livros_por_categoria(Categoria, Resto, Resultado).

% Calcular a média das notas de um livro
media_notas(Titulo, Media) :-
    livros(LivrosAtuais),
    media_notas_aux(Titulo, LivrosAtuais, Media).

% Caso em que o livro não é encontrado
media_notas_aux(_, [], _) :-
    write('Livro nao encontrado.'), nl,
    fail.

% Caso em que o livro é encontrado
media_notas_aux(Titulo, [livro(Titulo, _, _, Notas) | _], Media) :-
    soma_lista(Notas, Soma),
    comprimento(Notas, Comprimento),
    Comprimento > 0,
    Media is Soma / Comprimento.

% Continuar procurando se o livro ainda não foi encontrado
media_notas_aux(Titulo, [_ | Resto], Media) :-
    media_notas_aux(Titulo, Resto, Media).

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
criar_livro :-
    write('Por favor, insira as informacoes solicitadas e finalize cada entrada com um ponto final (.)'), nl,
    write('Titulo (entre aspas): '), flush_output, read(Titulo),
    write('Autor (entre aspas): '), flush_output, read(Autor),
    write('Categoria (entre aspas): '), flush_output, read(Categoria),
    write('Notas (ex: [9, 8, 10]): '), flush_output, read(Notas),
    adicionar_livro(Titulo, Autor, Categoria, Notas),
    format('Livro "~w" registrado com sucesso!~n', [Titulo]).

% Adicionar uma nova nota a um livro existente
adicionar_nota(Titulo, NovaNota) :-
    livros(LivrosAtuais),
    atualizar_livros(Titulo, NovaNota, LivrosAtuais, [], NovosLivros),
    (LivrosAtuais == NovosLivros ->
        format('Livro "~w" nao foi encontrado.~n', [Titulo]);
        (retractall(livros(_)),
         assertz(livros(NovosLivros)),
         format('Lista de livros atualizada: ~w~n', [NovosLivros]))
    ).
% Atualizar os livros na lista
atualizar_livros(_, _, [], Atualizados, Atualizados) :- !.
atualizar_livros(Titulo, NovaNota, [livro(Titulo, Autor, Categoria, Notas) | Resto], Atualizados, NovosLivros) :-
    write('Atualizando livro: '), write(Titulo), nl,
    append(Notas, [NovaNota], NovasNotas),
    append(Atualizados, [livro(Titulo, Autor, Categoria, NovasNotas)], LivrosParciais),
    atualizar_livros(Titulo, NovaNota, Resto, LivrosParciais, NovosLivros).
atualizar_livros(Titulo, NovaNota, [Livro | Resto], Atualizados, NovosLivros) :-
    append(Atualizados, [Livro], LivrosParciais),
    atualizar_livros(Titulo, NovaNota, Resto, LivrosParciais, NovosLivros).

% Inicializa a lista ao carregar o código
:- initialization(inicializar_livros).