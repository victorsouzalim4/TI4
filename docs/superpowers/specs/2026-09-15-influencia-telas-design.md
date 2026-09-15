# InfluencIA — Design das telas com navegação e API mockada (Sprint 2)

**Data:** 2026-09-15 · **Solicitado por:** Débora Luiza (execução direta, sem gate de aprovação)

## Objetivo

Entregar todas as telas do app com navegação funcionando e chamadas de API
mockadas, seguindo o fluxo apresentado na Sprint 1 (Tendências → Análise →
Roteiro), com a paleta escura definida pelo time e a bottom bar do pacote
`animated_bottom_navigation_bar`.

## Decisões

| Decisão | Escolha |
|---|---|
| Abas | Tendências, Roteiros, Perfil (bottom bar `AnimatedBottomNavigationBar.builder`, ícone + rótulo, sem FAB) |
| Navegação | go_router com `StatefulShellRoute.indexedStack` (uma pilha por aba); `/scripts/:scriptId` abre no navigator raiz, cobrindo a bottom bar |
| Tema | Somente escuro; paleta em `AppColors` e `ThemeData` derivado em `AppTheme.dark` |
| Features | `topics` (antiga `home`: ranking + análise), `scripts` (lista, detalhe, geração/regeneração), `profile` |
| Dados | Mesmo padrão feature-first do core: entity → repositório abstrato → model freezed → datasource (contrato + mock com delay) → providers Riverpod |
| Simplificações | `guard()` em `core/utils/result.dart` centraliza exceção → `Failure`; `AsyncView` padroniza loading/erro/dados; usecase só quando há regra (ordenação dos tópicos) |
| Login | Fora do escopo desta etapa |

## Telas

1. **Tendências** (`/trends`): ranking numerado de tópicos, menções e selo de sentimento; toque abre a análise.
2. **Análise** (`/trends/:topicId`): título, barras de sentimento (positivo/neutro/negativo), termos mais citados, comentários representativos e CTA "Gerar roteiro" (com estado de carregamento).
3. **Roteiros** (`/scripts`): lista dos roteiros gerados (título do tópico, gancho, data) com estado vazio.
4. **Roteiro** (`/scripts/:scriptId`): gancho em destaque, desenvolvimento, chamada para ação; ações "Copiar" (clipboard + snackbar) e "Regenerar" (nova versão via mock).
5. **Perfil** (`/profile`): avatar com iniciais, nome, handle, nicho, estatísticas, plataformas conectadas (YouTube/Instagram/TikTok) e estilo do roteiro.

## Mock de API

- `MockTopicDataSource`: 6 tópicos com análise (shares, termos derivados das menções, 2 comentários cada). Tópico inexistente → `ServerException 404`.
- `MockScriptDataSource` (keepAlive): lista em memória com 2 roteiros iniciais; `createScript` gera a partir do título do tópico; `regenerateScript` troca o gancho mantendo o id. Delay de geração maior (`AppConstants.mockGenerationDelay`) para simular a IA.
- `MockProfileDataSource`: perfil fixo.
- Troca para o Vortex: uma linha por provider (`*DataSourceProvider`), como já previsto no core.

## Testes

Unit (mock de roteiros, entidade Profile) + widget (cada página isolada com
fakes em `test/helpers/fakes.dart`) + navegação de ponta a ponta com o `App`
real (abas, fluxo tópico → análise → gerar → roteiro, tela cheia do roteiro).
