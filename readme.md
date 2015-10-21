# td-agant-es-kibana3-chef

###fluentd,elastocsearch,kibanaをインストールしたいサーバ(以下node)にchefをインストール 明示的にバージョンを12.5.1にする。
```
knife zero bootstrap --bootstrap-install-command "(echo 'version=12.5.1'; curl -L https://www.chef.io/chef/install.sh) | sudo bash" {{chefインストールするip}} -x vagrant -i {秘密鍵} --sudo
```

###nodeのrubyのpathをchefで使用するpathに変更
```
export PATH=/opt/chef/embedded/bin/:$PATH
which ruby
/opt/chef/embedded/bin/ruby
```

###nodeにroleを追加
```
knife node run_list add {{node名}} 'role[td-agent]' && knife node run_list add {{node名}} 'role[elasticsearch]' && knife node run_list add {{node名}} 'role[kibana]'
```

###レシピの実行
```
knife zero converge  'name:{{node名}}' -x vagrant -i {{秘密鍵}} --attribute knife_zero.host
```
