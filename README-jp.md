auto-export-proxy
========================

OSX上で簡単にproxy設定を行うスクリプトです。

Airportを使って現在のSSIDを読み取り、予め入力しておいたproxy設定をexportします。


### ディレクトリ構造

+ auto-export-proxy
	- build (script生成用)
	- LICENSE
	- defaults
		* public.fnc
		* main.fnc
	- functions
		* function_templete (機能追加用テンプレ)
		* default_proxy.fnc (デフォルト用)
		* titech-pubnet.fnc (titech-pubnet用)
	- resources
		* defaults.resource (共有変数 eg... デフォルトのネット環境名)
		* unique.resource (独自変数 eg... titech-pubnet用)
	- settings
		* settings_templete (プロキシ設定用のテンプレ)
		* default_proxy.settings (デフォルトのプロキシ設定)
		* titech-pubnet.settings (titech-pubnetのプロキシ設定)


### 使い方

1. $ cd /path/to/auto-export-proxy
1. $ $EDITOR resources/unique.resource (東工大生なら設定しておく
1. $ ./build

いつも使ってるシェルの設定ファイルに次の文を追加
	
	[ -f ~/auto-export-proxy.sh ] && source ~/auto-export-proxy.sh

#### 【注意】./buildは設定を変えたら毎回走らせること

### 機能拡張

settings/{SSID}.settingsはテンプレを見ると分かると思いますが、プロキシ設定がリスト化されています

        http_proxy {proxy:port} [RET]
        https_proxy {proxy:port} [RET]
        no_proxy {noproxy} [RET] (ここのRETは必須

functions/{SSID}.fncは各SSID用の機能を記述したもの。これもテンプレを参照

	  例えばログインする為にcurlを使うなど。titech-pubnet.fncにサンプルが有ります。
	  もしも何も処理をしない場合はpost_exportという名前で、bodyが空の関数を用意してください。