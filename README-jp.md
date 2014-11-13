auto-export-proxy
========================

OSX上で簡単にproxy設定を行うスクリプトです。

Airportを使って現在のSSIDを読み取り、予め入力しておいたproxy設定をexportします。

### 使い方

東工大生ならネットワーク環境の生成と環境に合わせた設定が必要です

1. titech-pubnet用のネットワーク環境の生成(https://gist.github.com/jmatsu/99ebc9b8707b5277de1e)
1. 変数の設定(resources参照)

いつも使ってるシェルの設定ファイルに次の文を追加

	[ -f /path/to/auto-export-proxy.sh ] && source /path/to/auto-export-proxy.sh

#### 【注意】./buildは設定を変えたら毎回走らせること

### 機能拡張

sample-export.shのフォーマットに沿って編集，other-export.shという名前に変更してください