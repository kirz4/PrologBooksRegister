### 📚 Gerenciador de Livros em Prolog
---

Este projeto é uma aplicação desenvolvida em **Prolog** para gerenciar uma coleção de livros. Com ele, você pode adicionar novos livros, listar por categoria, calcular a média das notas atribuídas e gerenciar a lista de forma dinâmica.

---

## 🛠️ Funcionalidades Principais

### Função para Compilar Arquivo
- Certifique-se de que o GNU Prolog está instalado e configurado no seu sistema. Compile o arquivo principal do projeto:

- '''prolog

['D://Repositorios/Prolog/Booksregister.pl'].

### 📂 Inicializar Lista de Livros
- A lista é automaticamente inicializada com valores padrão ao carregar o programa.
- É possível redefinir a lista com novos livros manualmente.

### ➕ Adicionar Livros
- Permite adicionar um livro informando:
  - **Título**
  - **Autor**
  - **Categoria**
  - **Notas** (lista de notas)
- Os livros são armazenados de forma dinâmica para fácil atualização.

### 📋 Listar Livros
- **Listar todos os livros** cadastrados.
- **Filtrar livros por categoria** para uma busca mais eficiente.

### 📝 Gerenciar Notas
- Calcular a **média das notas** de um livro específico.
- Adicionar novas notas a livros já cadastrados.

### 🔧 Funções Auxiliares
- Calcular a **soma** e o **comprimento de listas** para diversas operações internas.

---

## 🚀 Como Utilizar

Certifique-se de ter um ambiente **Prolog** instalado (recomendado: **SWI-Prolog**). 

### ⚙️ Inicializar a Lista
Ao carregar o código, a lista de livros padrão será automaticamente inicializada:

```prolog
?- inicializar_livros.
```

### ➕ Adicionar um Livro
Para adicionar um livro manualmente, utilize a função `adicionar_livro/4`:

```prolog
?- adicionar_livro('Novo Livro', 'Autor Exemplo', 'Categoria Exemplo', [8, 9, 7]).
```

Ou utilize o modo interativo para uma experiência mais intuitiva:

```prolog
?- criar_livro.
```

### 📋 Listar Livros
- Para listar **todos os livros**:

  ```prolog
  ?- listar_livros.
  ```

- Para listar **livros por categoria**:

  ```prolog
  ?- listar_livros_por_categoria('Ficcao Cientifica').
  ```

### 📝 Calcular a Média das Notas
Calcule a média de um livro específico com:

```prolog
?- media_notas('1984', Media).
```

### ➕ Adicionar Notas a um Livro
Adicione uma nova nota a um livro existente:

```prolog
?- adicionar_nota('1984', 10).
```

---

## 📊 Estrutura dos Dados

Cada livro é representado por um termo:

```prolog
livro(Titulo, Autor, Categoria, Notas).
```

**Exemplo**:

```prolog
livro('1984', 'George Orwell', 'Ficcao Cientifica', [9, 10, 8, 9]).
```

---

## 📦 Requisitos

Certifique-se de ter o **SWI-Prolog** ou outro ambiente compatível instalado:

- **Prolog**: Ambiente de desenvolvimento compatível
- **Versão Recomendável**: SWI-Prolog

### 🔄 Inicialização Automática

A lista de livros é inicializada automaticamente ao carregar o programa:

```prolog
:- initialization(inicializar_livros).
```

---

## 🤝 Contribuições

Contribuições são **bem-vindas**! Sinta-se à vontade para:
- Adicionar novas funcionalidades.
- Melhorar a lógica ou otimizar o código existente.
- Adaptar o projeto para outros casos de uso.

Qualquer feedback é muito bem-vindo! 🚀

---

## 📄 Licença
Este projeto é open-source e está sob a licença **MIT**. Sinta-se à vontade para utilizá-lo e adaptá-lo conforme necessário.
