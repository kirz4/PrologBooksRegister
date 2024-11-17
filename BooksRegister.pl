# Gerenciador de Livros em Prolog

Este projeto é uma aplicação em Prolog para gerenciar uma lista de livros. Ele permite adicionar livros, listar por categoria, calcular a média de notas e gerenciar a lista de forma dinâmica.

---

## Funcionalidades Principais

1. **Inicializar Lista de Livros**
   - A lista de livros é inicializada com valores padrão ao carregar o programa.
   - É possível redefinir a lista com novos livros.

2. **Adicionar Livros**
   - Insira detalhes como título, autor, categoria e notas.
   - Os livros são armazenados dinamicamente.

3. **Listar Livros**
   - Exibe todos os livros cadastrados.
   - Filtre os livros por categoria.

4. **Gerenciar Notas**
   - Calcule a média das notas de um livro específico.
   - Adicione novas notas a um livro existente.

5. **Funções Auxiliares**
   - Calcule a soma e o comprimento de listas para operações diversas.

---

## Como Utilizar

### Inicializar a Lista
Ao carregar o código, a lista de livros padrão será inicializada automaticamente:
```prolog
?- inicializar_livros.

### Adicionar um Livro
Use a função `adicionar_livro/4`:
```prolog
?- adicionar_livro('Novo Livro', 'Autor Exemplo', 'Categoria Exemplo', [8, 9, 7]).

### Listar Livros
- Listar todos os livros:
  ```prolog
  ?- listar_livros.