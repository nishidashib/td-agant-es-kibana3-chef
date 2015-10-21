# td-agant-es-kibana3-chef

##nodeにchefをインストール 明示的にバージョンを12.5.1にする。
```
knife zero bootstrap --bootstrap-install-command "(echo 'version=12.5.1'; curl -L https://www.chef.io/chef/install.sh) | sudo bash" {{chefインストールするip}} -x vagrant -i {秘密鍵} --sudo
```

##nodeにroleを追加
```
knife node run_list add {{node名}} 'role[td-agent]' && knife node run_list add {{node名}} 'role[elasticsearch]' && knife node run_list add {{node名}} 'role[kibana]'
```
