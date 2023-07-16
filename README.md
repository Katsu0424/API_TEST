## API、DBをDockerで起動
- docker-composeで一括で立ち上がるように修正
  <br>

## 起動方法
1. 本プロジェクトをクローン
```
git clone https://github.com/Katsu0424/API_TEST/tree/master
```
2. プロジェクトのルートディレクトリに移動
3. ビルド実行
```
docker-compose build
```
4. コンテナ起動
```
docker-compose up
```
<br>

## 実行URL
http://localhost:8080/onsen/{温泉名}
<br><br>

## 過去バージョンをoldフォルダで管理
- 現在のバージョン：v2