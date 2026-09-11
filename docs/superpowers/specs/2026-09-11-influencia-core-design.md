# InfluencIA — Design do core Flutter (Sprint 3 prep)

**Data:** 2026-09-11 · **Aprovado por:** Victor (em chat, antes da execução)

## Objetivo

Gerar o core do app Flutter do InfluencIA: ambiente configurado, arquitetura
feature-first completa e aplicação abrindo no emulador. Sem foco em telas nesta
etapa (UI mínima). Backend Vortex ainda não existe — dados vêm de um datasource
mock com contrato pronto para a troca.

## Decisões aprovadas

| Decisão | Escolha |
|---|---|
| Localização | Monorepo: `app/` (Flutter), `docs/`, futuro `vortex/` |
| Package Android | `br.com.influencia` (org `br.com`, projeto `influencia`) |
| Estado | Riverpod com codegen (`riverpod_generator` + `riverpod_lint`) |
| Navegação | go_router |
| HTTP | dio com LogInterceptor (debug) e mapeamento central DioException → AppException |
| Dados da home | Mock em memória; `RemoteTopicDataSource` (dio) já pronto, troca de 1 linha no provider quando o Vortex subir |
| Ambientes | `app/env/{dev,staging,prod}.json` via `--dart-define-from-file`; sem productFlavors Gradle; sem segredos nos arquivos (commitados) |
| Lint | very_good_analysis, `public_member_api_docs` desligado |
| Modelos | freezed + json_serializable (justifica `task gen`) |
| i18n | flutter_localizations + arb; template pt-BR, tradução en |
| Terminal | Taskfile v3 na raiz (comandos portáveis, interpretador sh do Task) |
| Testes | Unit (usecase, repository, interceptor dio, model) + widget (HomePage com overrides) |

## Arquitetura

```
app/lib/
  main.dart               bootstrap (ProviderScope)
  app/                    MaterialApp.router, go_router, tema (pinho #0E4D40 / esmeralda #2FBF8F)
  core/                   config (dart-define), constants, errors (Failure/AppException),
                          network (dio), utils (Result<T> sealed), extensions
  features/home/
    domain/               Topic, TopicRepository (abstrato), GetTrendingTopics
    data/                 TopicModel (freezed), datasources (mock + remote dio), repository impl
    presentation/         providers riverpod, HomePage (loading/erro/dados)
  shared/                 widgets reutilizáveis (AppErrorView)
```

Regra de dependência: presentation → domain ← data. Repositórios retornam
`Result<T>` (Ok/Err com Failure sealed) — sem dartz.

## Execução

`flutter create` → dois subagentes em paralelo (código Dart + tooling
Taskfile/env/launch.json/README) → integração: `task lint`, `task test`,
build APK debug e app abrindo no emulador → commit.
