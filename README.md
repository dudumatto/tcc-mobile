# TCC Mobile

App Flutter mobile para o CollabResearch.

## Estrutura

- `lib/core`: API, auth, configuracao, tema e utilitarios.
- `lib/models`: entidades de dominio.
- `lib/services`: acesso a dados e integracoes.
- `lib/providers`: estado global com `ChangeNotifier`.
- `lib/screens`: telas do aplicativo.
- `lib/widgets`: componentes reutilizaveis.
- `test`: testes de widget iniciais.

## Ambiente

- Copie `.env.example` para `.env`.
- Defina `API_URL`.

## Contratos de API

O mobile usa as rotas reais em portugues do backend como fonte principal. Alguns controllers do backend tambem aceitam aliases em ingles para compatibilidade com o planejamento original.

Rotas principais usadas pelo app:

- Auth: `/api/auth/login`, `/api/auth/register`, `/api/auth/logout`, `/api/auth/senha`.
- Usuario autenticado: `/api/usuarios/me` e `/api/usuarios/me/preferencias`.
- Perfil de usuario: `/api/usuarios/{id}`.
- Dashboard: `/api/dashboard`, com aliases `/api/dashboard/stats` e `/api/dashboard/activity`.
- Projetos: `/api/projetos`, com alias backend `/api/projects`.
- Inscricoes: `/api/inscricoes`, com alias backend `/api/subscriptions`.
- Conversas: `/api/conversas`, com alias backend `/api/chat/conversations`.
- Mensagens: `GET /api/conversas/{id}/mensagens` e `POST /api/conversas/{id}/mensagem`.
- Notificacoes: `/api/notificacoes`, com alias backend `/api/notifications`.

Novas chamadas HTTP devem passar por `ApiClient` e por constantes ou helpers de `ApiEndpoints`.
