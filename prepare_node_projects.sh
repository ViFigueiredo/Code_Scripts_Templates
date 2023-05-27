#!/bin/bash

# Instalação do Gerenciador Node Yarn
corepack enable

# Instalação do Linter Stack Javascript
npm install --save-dev eslint prettier eslint-plugin-prettier eslint-config-prettier

# Instalação do utilitário e inicializador automático de servidores Stack Javascript
npm install nodemon --save-dev