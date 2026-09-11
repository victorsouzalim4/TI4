# InfluencIA

App Flutter de inteligência de conteúdo para influenciadores (Trabalho Interdisciplinar IV): analisa comentários da audiência, ranqueia tópicos em alta e, futuramente, gera roteiros via backend próprio **Vortex** (ainda não existe — o app usa datasource mock por enquanto). Este repositório contém `app/` (projeto Flutter `influencia`, Android + Web) e `docs/` (documentação do trabalho).

## Bootstrap no Windows

1. Instale o Task: `winget install Task.Task` (ou `scoop install task`).
2. Verifique o ambiente Flutter: `flutter doctor`.
3. Prepare o projeto: `task setup` (pub get + gen-l10n).
4. Liste/inicie um emulador: `task emu:list` e `task emu:start` (ou abra um AVD pelo Android Studio).
5. Rode o app: `task run`.

Dicas:

- `task` (sem argumentos) lista todas as tasks disponíveis.
- Troque o ambiente com `FLAVOR=staging task run` ou `task run FLAVOR=staging` (idem para `build:apk` / `build:aab`).
- Escolha o device com `DEVICE=<id> task run` (ids em `task devices`).
- O default de `task emu:start` é o AVD `Pixel_9` (Pixel 9, Android 36 · google_apis · x86_64, criado no bootstrap deste repo); use outro com `AVD=<id> task emu:start` (ids em `task emu:list`).

## Arquitetura

```
app/lib/
├── main.dart            # bootstrap (ProviderScope + runApp)
├── app/                 # MaterialApp.router, tema, go_router
├── core/                # config por dart-define, errors, network (dio + interceptors), utils, extensions
├── features/
│   └── <feature>/
│       ├── data/        # models (freezed/json_serializable), datasources, repository impl
│       ├── domain/      # entities, repositórios abstratos, usecases
│       └── presentation/# providers (riverpod) + pages/widgets
└── shared/              # widgets reutilizáveis entre features
```

Regra de dependência: `presentation -> domain <- data` — a camada de domínio não conhece as outras duas. Estado com Riverpod (codegen), modelos imutáveis com freezed/json_serializable, i18n via arquivos `.arb` com pt-BR como idioma default.

## Como adicionar uma feature

1. Crie `features/<nome>/domain/` com a entity, o repositório abstrato e o usecase.
2. Crie `features/<nome>/data/` com o model (freezed), o datasource e a implementação do repositório.
3. Crie `features/<nome>/presentation/` com os providers Riverpod e a page.
4. Registre a rota em `app/router.dart`.
5. Adicione as strings nos arquivos `.arb`.
6. Rode `task gen` (build_runner) e `task l10n` (gen-l10n).
7. Escreva os testes em `test/features/<nome>/`.

## Decisões

- Riverpod com codegen (padrão atual da lib, com lint próprio).
- `FLAVOR` = seleção de `env/*.json` via `--dart-define-from-file`, sem productFlavors no Gradle (simplicidade; um só applicationId).
- Datasource mock até o Vortex existir (troca de 1 linha no provider).
- `env/*.json` são commitados porque não contêm segredos.
- very_good_analysis com `public_member_api_docs` desligado.
- `API_BASE_URL` de dev usa `10.0.2.2` (localhost visto do emulador Android).
- Web habilitado apenas para `task run:web`.

## Tasks

| Task | O que faz |
| --- | --- |
| `default` / `help` | Lista todas as tasks (`task --list`) |
| `setup` | `flutter pub get` + `flutter gen-l10n` |
| `doctor` | `flutter doctor -v` |
| `get` | `flutter pub get` |
| `clean` | `flutter clean` e depois `flutter pub get` |
| `run` | `flutter run` com `--dart-define-from-file=env/<FLAVOR>.json` (e `-d <DEVICE>` se informado) |
| `run:web` | `flutter run -d chrome` com o mesmo dart-define-from-file |
| `devices` | Lista devices conectados |
| `emu:list` | Lista emuladores/AVDs |
| `emu:start` | Inicia o AVD (`AVD=<id>` para trocar) |
| `analyze` | `flutter analyze` |
| `format` | `dart format .` |
| `lint` | `flutter analyze` + `dart format --set-exit-if-changed .` |
| `test` | `flutter test --coverage` |
| `gen` | `dart run build_runner build --delete-conflicting-outputs` |
| `gen:watch` | `dart run build_runner watch --delete-conflicting-outputs` |
| `l10n` | `flutter gen-l10n` |
| `build:apk` | `flutter build apk --release` com o env do FLAVOR |
| `build:aab` | `flutter build appbundle --release` com o env do FLAVOR |
| `upgrade` | `flutter pub upgrade --major-versions` |
