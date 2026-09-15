# InfluencIA

App Flutter de inteligência de conteúdo para influenciadores (Trabalho Interdisciplinar IV): a ideia é analisar comentários da audiência, ranquear tópicos em alta e gerar roteiros via backend próprio **Vortex**. Este repositório contém `app/` (projeto Flutter `influencia`, Android + Web) e `docs/` (documentação do trabalho).

## Estado atual (MVP do ponto de controle)

Esta branch (`feature/sprint-4`) traz a versão mínima do app para apresentar no ponto de controle:

- Bottom bar com três abas (Tendências, Roteiros e Perfil).
- Aba **Perfil** com nome, arroba, nicho e plataforma principal, vindos de uma constante (`demoProfile`).
- Abas **Tendências** e **Roteiros** mostram uma tela de "Em breve".

Não há backend, login nem chamadas de rede. As telas completas de tendências, análise de tópico e roteiros continuam na branch `feature/front-telas` e voltam quando o Vortex existir.

## Bootstrap no Windows

1. Instale o Task: `winget install Task.Task` (ou `scoop install task`).
2. Verifique o ambiente Flutter: `flutter doctor`.
3. Prepare o projeto: `task setup` (pub get + gen-l10n).
4. Liste/inicie um emulador: `task emu:list` e `task emu:start` (ou abra um AVD pelo Android Studio).
5. Rode o app: `task run` (ou `task run:web` para abrir no Chrome).

Dicas:

- `task` (sem argumentos) lista todas as tasks disponíveis.
- Escolha o device com `DEVICE=<id> task run` (ids em `task devices`).
- O default de `task emu:start` é o AVD `Pixel_9`; use outro com `AVD=<id> task emu:start` (ids em `task emu:list`).

## Telas e navegação

Três abas na bottom bar (`animated_bottom_navigation_bar`), cada uma com sua própria pilha (`StatefulShellRoute` do go_router). O app abre na aba Perfil.

| Rota | Tela | O que faz |
| --- | --- | --- |
| `/trends` | Tendências | Tela de espera ("Em breve") |
| `/scripts` | Roteiros | Tela de espera ("Em breve") |
| `/profile` | Perfil | Nome, arroba, nicho e plataforma principal |

A paleta (tema escuro único) fica em `app/theme.dart` (`AppColors`).

## Estrutura

```
app/lib/
├── main.dart            # runApp(App())
├── app/                 # MaterialApp.router, tema (AppColors/AppTheme), go_router, AppShell (bottom bar)
├── core/                # constants e extensions (l10n, theme, snackbar)
├── features/
│   └── profile/         # perfil
│       ├── data/        # demo_profile.dart (perfil fixo)
│       ├── domain/      # entity Profile
│       └── presentation/# ProfilePage
└── shared/              # ComingSoonPage, SectionTitle
```

Textos em arquivos `.arb` (`lib/l10n`), com pt-BR como idioma default; rode `task l10n` depois de mexer neles.

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
| `l10n` | `flutter gen-l10n` |
| `build:apk` | `flutter build apk --release` com o env do FLAVOR |
| `build:aab` | `flutter build appbundle --release` com o env do FLAVOR |
| `upgrade` | `flutter pub upgrade --major-versions` |
