atproxy
========================

MacOSX上で簡単にproxy設定を行うスクリプト

予めproxyの値等を設定しておくことで動的に設定値を読み込む．

### 使い方

sample-export.shのフォーマットに沿って編集したのち，other-export.shという名前に変更する

### 使い方

東工大生ならネットワーク環境の生成と環境に合わせた設定が必要です

1. titech-pubnet用のネットワーク環境の生成(https://gist.github.com/jmatsu/99ebc9b8707b5277de1e)
1. 変数の設定(resources参照)

いつも使ってるシェルの設定ファイルに次の文を追加

	[ -f /path/to/auto-export-proxy.sh ] && source /path/to/auto-export-proxy.sh