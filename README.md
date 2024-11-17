Gerenciador de Livros em Prolog
===============================

Este projeto é uma aplicação em Prolog para gerenciar uma lista de livros. Ele permite adicionar livros, listar por categoria, calcular a média de notas e gerenciar a lista de forma dinâmica.

Funcionalidades Principais

Inicializar Lista de Livros

*   A lista de livros é inicializada com valores padrão ao carregar o programa.
    
*   É possível redefinir a lista com novos livros.
    

Adicionar Livros

*   Insira detalhes como título, autor, categoria e notas.
    
*   Os livros são armazenados dinamicamente.
    

Listar Livros

*   Exibe todos os livros cadastrados.
    
*   Filtre os livros por categoria.
    

Gerenciar Notas

*   Calcule a média das notas de um livro específico.
    
*   Adicione novas notas a um livro existente.
    

Funções Auxiliares

*   Calcule a soma e o comprimento de listas para operações diversas.
    

Como Utilizar

Inicializar a ListaAo carregar o código, a lista de livros padrão será inicializada automaticamente:

prolog?- inicializar\_livros.

Adicionar um LivroUse a função adicionar\_livro/4:

prolog?- adicionar\_livro('Novo Livro', 'Autor Exemplo', 'Categoria Exemplo', \[8, 9, 7\]).

Ou utilize o modo interativo:

prolog?- criar\_livro.

Listar LivrosListar todos os livros:

prolog?- listar\_livros.

Listar por categoria:

prolog?- listar\_livros\_por\_categoria('Ficcao Cientifica').

Calcular a Média das NotasCalcule a média de um livro específico:

prolog?- media\_notas('1984', Media).

Adicionar NotasAdicione uma nova nota a um livro:

prolog?- adicionar\_nota('1984', 10).

Estrutura dos DadosCada livro é representado por um termo:

prologlivro(Titulo, Autor, Categoria, Notas).

Exemplo:

prologlivro('1984', 'George Orwell', 'Ficcao Cientifica', \[9, 10, 8, 9\]).

Requisitos

*   Prolog: Ambiente compatível com o SWI-Prolog ou outra implementação.
    

InicializaçãoA lista de livros é inicializada automaticamente ao carregar o programa:

prolog:- initialization(inicializar\_livros).

ContribuiçõesSinta-se à vontade para adicionar novas funcionalidades, melhorar a lógica ou adaptar o código para novos casos de uso. Feedbacks são bem-vindos! 🚀