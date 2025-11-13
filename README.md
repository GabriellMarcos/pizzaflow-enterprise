# 🍕 PizzaFlow Enterprise

![GitHub Actions](https://github.com/GabrielMarcos/pizzaflow-enterprise/workflows/🚀%20PizzaFlow%20Enterprise%20CI/CD/badge.svg)
![Version](https://img.shields.io/github/v/release/GabrielMarcos/pizzaflow-enterprise)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

Sistema completo de gerenciamento de pizzaria com arquitetura moderna, CI/CD automatizado e deploy em AWS.

## 🚀 Funcionalidades

### Backend
- **API RESTful** com Node.js e Express
- **Autenticação JWT** com refresh tokens
- **Banco de dados** MongoDB com Mongoose
- **Upload de imagens** para AWS S3
- **Rate limiting** e segurança com Helmet
- **Documentação automática** com Swagger

### Frontend
- **Interface moderna** com React 18
- **Gerenciamento de estado** com React Query
- **Formulários** com React Hook Form
- **Styling** com Styled Components
- **Testes** com Vitest e Testing Library

### DevOps
- **CI/CD** com GitHub Actions
- **Versionamento automático** e changelog
- **Docker** para containerização
- **Deploy** multi-ambiente
- **Monitoramento** e logs

## 📦 Estrutura do Projeto
pizzaflow-enterprise/
├── src/
│ ├── backend/ # API Node.js/Express
│ ├── frontend/ # App React
│ └── shared/ # Utilitários compartilhados
├── infrastructure/ # AWS e Docker
├── scripts/ # Scripts de automação
├── tests/ # Testes unitários, integração e E2E
└── .github/workflows/ # Pipelines CI/CD

text

## 🛠️ Desenvolvimento

### Pré-requisitos
- Node.js 18+
- Docker e Docker Compose
- MongoDB

### Executar localmente
```bash
# Clone o repositório
git clone https://github.com/GabrielMarcos/pizzaflow-enterprise.git
cd pizzaflow-enterprise

# Instale dependências
npm install

# Execute com Docker
npm run docker:up

# Ou execute localmente
npm run dev
Scripts disponíveis
bash
npm run dev          # Desenvolvimento completo
npm run test         # Executa todos os testes
npm run build        # Build para produção
npm run docker:up    # Sobe containers Docker
📋 Pipeline CI/CD
Code Quality - ESLint e análise estática

Backend Tests - Testes unitários e de integração

Frontend Tests - Testes componentes e build

Security Scan - Auditoria de vulnerabilidades

Auto Versioning - Geração automática de tags

Deploy Preview - Deploy em ambiente de staging

🌐 Deploy
Staging: Automático a cada merge na main

Production: Manual via tags

Infraestrutura: AWS ECS, RDS, S3, CloudFront

🤝 Contribuição
Fork o projeto

Crie uma branch: git checkout -b feature/nova-funcionalidade

Commit: git commit -m ''feat: adiciona nova funcionalidade''

Push: git push origin feature/nova-funcionalidade

Abra um Pull Request

📄 Licença
Este projeto está sob licença MIT. Veja LICENSE para detalhes.

Desenvolvido com ❤️ por Gabriel Marcos
'@ | Out-File -FilePath README.md -Encoding utf8