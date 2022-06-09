# docker-ssh-internal

Dockerの内側からsshで他のホストにつなげるようにする**練習**。

- Dockerを起動したユーザの~/.sshを引き継ぐ
- 起動したユーザがssh-agentやForwardAgentを使っていたら、それも使う

## テストの実行

```sh
./build.sh
```

Debian (bullseye)にsshクライアントをインストールした
test0 というイメージを作成する。

```sh
./test0.sh
```
でコンテナがttyつきで起動するので、
sshコマンドを実行する。

コンテナから抜けるには
ctrl-pqでデタッチするか、
exitで終わらしてください。


## いまのところの問題点

127.0.0.1はコンテナ自身になるので接続できない。

ssh-agentやForwardAgentを使っていない場合エラーになる。
