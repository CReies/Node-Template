# Node-Template

My personal template for being a node project

This is a template to begin any node project with typescript, eslint, prettier and testing with jest

## Installation

The template has a script to install it, it uses pnpm

```bash
sh ./install.sh
```

## Creating a New Directory

The template also contains a script that automatically create a directory inside the `./src` directory

```bash
sh ./add-new-dir.sh $newDirName
```

This script adds absolute paths to the `tsconfig.json` and `jest.config.js` files
