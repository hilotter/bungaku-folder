# 文学フォルダのつくりかた

### インストール

```
bundle install --path vendor/bundler
```

### 文学フォルダ作成

* 青空文庫の読みたい作品のURLを確認（html版）
* bundle exec ruby ./aozora_directry.rb create コマンドを実行
* dオプションに作成ディレクトリ名、uオプションにURLを指定

```
bundle exec ruby ./aozora_directry.rb create -d ame -u http://www.aozora.gr.jp/cards/000081/files/45630_23908.html
```

### 参考
* [http://blog.hello-world.jp.net/?p=1800](http://blog.hello-world.jp.net/?p=1800)
