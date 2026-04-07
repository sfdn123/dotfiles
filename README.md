# dotfiles

## SetUp

- MacOS
```bash
brew install chezmoi
```

- Ubuntu/Debian

```bash
sudo apt update && sudo apt install -y chezmoi
```

## 新しい環境への導入

```bash
chezmoi init --apply git@github.com:sfdn123/dotfiles.git
```

Homebrew を使う環境では、`chezmoi apply` 後に以下でツール群を入れる。

```bash
brew bundle --global
```

Homebrew を使わない Ubuntu では、この手順は不要。

## 既存環境の更新

Remote の変更を取り込んで、そのまま反映する。

```bash
chezmoi update
```

target 側に手元変更がある場合は、先に `chezmoi diff` で確認し、残したい変更は `chezmoi re-add <path>` で source に取り込む。

## 運用コマンド

- 差分確認:
```bash
chezmoi diff
```
- source の内容を target に反映:
```bash
chezmoi apply
```
- アプリが target 側を書き換えた内容を source に取り込む:
```bash
chezmoi re-add <path>
```
- Remote の更新を取り込んで反映:
```bash
chezmoi update
```

## 管理方針

- 基本はターミナル系の設定だけを管理する:
  - `zsh`
  - `nvim`
  - `zellij`
  - `ghostty`
  - `Brewfile`

`.tmpl` はテンプレートファイルで、`chezmoi` は中の `{{ ... }}` を評価してから使う。

## このリポジトリだけ、個人アカウントで管理したい場合

```bash
# アカウント名をこのリポジトリだけに追加
git config user.name "（表示名：個人）"
git config user.email "（個人メール）"
# このリポジトリだけ鍵をしてい、かつ中継サーバーも繋がない場合
git config core.sshCommand 'ssh -i ~/.ssh/（個人鍵ファイル） -o IdentitiesOnly=yes -o ProxyCommand=none -o ProxyJump=none'
```
