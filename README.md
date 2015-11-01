#td-agent-es-kibana3-chef

##debian系のlinuxしかテストしてません。。
redhat、widowsもテストしておきます。

vagrantやdockerなりで仮想環境つくって試してみてください。

###ホストOSにchef,chef-zero,knife-zeroをinstallした状態にしておく。
```
$ gem list chef
*** LOCAL GEMS ***
chef (12.5.1)
chef-config (12.5.1)
$ gem list knife-zero
*** LOCAL GEMS ***
knife-zero (1.9.0)
```
###このリポジトリをダウンロード、このリポジトリをカレントディレクトリにしておく。
```
$ pwd
・・・・/td-agant-es-kibana3-chef
```

###fluentd,elasticsearch,kibanaをインストールしたいサーバ(以下node)にchef12.5.1をインストール
####ホストOSで下記コマンド実行。
```
knife zero bootstrap --bootstrap-install-command "(echo 'version=12.5.1'; curl -L https://www.chef.io/chef/install.sh) | sudo bash" {{chefインストールするip}} -x vagrant -i {秘密鍵} --sudo
```

###nodeにroleを追加.(node名はnodesディレクトリ参照)
```
chefをinstallしたサーバー名がnodesディレクトリ以下にjsonファイルとして作成されている。
・・・/td-agant-es-kibana3-chef$ ls -1 nodes/
{node名}.json

knife node run_list add {{node名}} 'role[td-agent]' && knife node run_list add {{node名}} 'role[elasticsearch]' && knife node run_list add {{node名}} 'role[kibana]'
```

###node側のrubyパスをchefで使用するパスに変更、リポジトリの更新
```
$ ssh {node名のサーバ}
export PATH=/opt/chef/embedded/bin/:$PATH
which ruby
/opt/chef/embedded/bin/ruby

念のためリポジトリ更新
$ sudo apt-get update
$ exit
```
###レシピの実行
```
knife zero converge  'name:{{node名}}' -x vagrant -i {{秘密鍵}} --attribute knife_zero.host
```
###nodeで下記にアクセスできたら成功。
http://{nodeのipアドレス}/kibana
