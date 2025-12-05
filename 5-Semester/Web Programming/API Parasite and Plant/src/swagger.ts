import swaggerAutogen from "swagger-autogen";

const config = {
  info: {
    version: 'v1.0.0',
    title: 'Plantas e Ecossistema API',
    description: 'Plantas e Ecossistema API documentation'
  },
  host: 'localhost:3000',
  basePath: '/v1',
  schemes: ['http', 'https'],
  tags: [
    {name: "Auth", description: "Authentication endpoints"},
    {name: "User", description: "User endpoints"},
    {name: "Plant", description: "Plant endpoints"},
    {name: "Parasite", description: "Parasite endpoints"},
  ],
  securityDefinitions: {
    // 1. JWT Bearer Token (Para rotas protegidas com login)
    bearerAuth: {
      type: 'apiKey',
      in: 'header',
      name: 'Authorization',
      description: 'JWT Authorization header using the Bearer scheme. Ex: "Bearer {token}"',
      scheme: 'bearer',
      bearerFormat: 'JWT'
    },
    // 2. Basic Auth (Para a rota de login)
    basicAuth: {
      type: 'basic',
      description: 'Basic Authentication for /login. Use nome:senha (nome:senha base64-encoded).'
    },
    // 3. API Key Customizada (Para rotas de leitura/acesso externo)
    apiKeyAuth: {
        type: 'apiKey',
        in: 'header',
        name: 'X-API-Key', 
        description: 'API Key for read-only access. Ex: X-API-Key: sua_chave_secreta'
    }
  },
  definitions: {
    LoginBody: {
      $nome: "nome_do_usuario",
      $senha: "senha_do_usuario"
    },
    PlantData: {
      $nome_comum: "Rosa",
      $nome_cientifico: "Rosa rubiginosa",
      $familia: "Rosaceae",
      $origem: "Europa",
      $tipo: "Arbusto",
      $ambiente: "Externo",
      $rega: "2x por semana",
      $toxico: true, // Boolean
      $imagem_url: "https://exemplo.com/rosa.jpg",
      $descricao: "Uma planta ornamental muito comum."
    },
    PlantDataResponse: {
      $id: "1",
      $nome_comum: "Rosa",
      $nome_cientifico: "Rosa rubiginosa",
      $familia: "Rosaceae",
      $origem: "Europa",
      $tipo: "Arbusto",
      $ambiente: "Externo",
      $rega: "2x por semana",
      $toxico: true, // Boolean
      $imagem_url: "https://exemplo.com/rosa.jpg",
      $descricao: "Descrição aqui...",
      // Formato de Data ISO 8601
      $criado_em: "2025-01-01T12:00:00Z", 
      $atualizado_em: "2025-01-02T13:00:00Z" 
    },
    ParasiteData: {
      $nome_comum: "Pulgão",
      $nome_cientifico: "Aphidoidea",
      $tipo: "Inseto",
      $plantas_afetadas: ["Rosa", "Hibisco"],
      $sintomas: "Folhas enroladas",
      $tratamento: "Sabão inseticida",
      $imagem_url: "https://exemplo.com/pulgao.jpg",
      $descricao: "Um inseto sugador de seiva."
    },
    ParasiteDataResponse: {
      $id: "1",
      $nome_comum: "Pulgão",
      $nome_cientifico: "Aphidoidea",
      $tipo: "Inseto",
      $plantas_afetadas: ["Rosa"],
      $sintomas: "Folhas enroladas",
      $tratamento: "Sabão inseticida",
      $imagem_url: "https://exemplo.com/pulgao.jpg",
      $descricao: "Descrição...",
      // Formato de Data ISO 8601
      $criado_em: "2025-01-01T12:00:00Z",
      $atualizado_em: "2025-01-02T13:00:00Z"
    },
    UserData: {
      $nome: "Lucas",
      $email: "lucas@email.com",
      $senha: "123456",
      $data_criacao: "2025-01-01",
      $nivel_acesso: "admin"
    },
    UserDataResponse: {
      $id: "1",
      $nome: "Lucas",
      $email: "lucas@email.com",
      $senha: "$2b$10$l4c6xsbXpNtOtOUC/nsCYuU7HA/1hY5CS/Z08GiPWfXTBPrHTnrGW",
      $data_criacao: "2025-01-01",
      $nivel_acesso: "admin"
    }
  }
};

const outputFile = './docs/swagger.json';
const endpoints = ['./src/routes/index.ts'];


swaggerAutogen()(outputFile,endpoints,config);