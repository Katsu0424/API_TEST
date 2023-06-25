## Java Springbootで簡単なAPIを作成し、Code PipelineでCI/CD化
- 参画中の案件にてPipelineを使用する予定みたいなので、動作確認してみる。
- 本番環境での運用を考えるとELB、ECS Fargateを使用すべきなので、その辺も今後確認予定。
- CircleCIとの比較もしてみたい。
<br>

## 構成図
![image](https://github.com/Katsu0424/API_TEST/assets/69413292/d12ba239-63c0-457c-9a3a-cfaaa193c906)


1. GitHubにpush
2. Code Pipelineの設定で対象リポジトリ内のブランチ変更を検知
3. GitHubに資材を取りに行く
4. Code Pipelineを介してCode Buildスタート
5. Code Buildでビルドしたjar+αをS3にput
6. Code Deployスタート
7. Code Deployの指示を受け、EC2(Codedeploy Agent)で処理実行
8. EC2にてCodeDeploy AgentがS3から資材を取得し、デプロイ
<br>

## CI/CDに用いた主要ファイル
- buildspec.yml
  - ビルドの仕様を記載したYaml形式のファイル。実行するLinuxのコマンドやS3にアップロードするファイルパスなどを記述。

- cddedeploy/appspec.yml
  - デプロイの仕様を記載したYaml形式のファイル。S3から取得したモジュールの配置場所、各フェーズで実行する処理を記述。

- deploy/backendProject-restart.sh
  - アプリケーションをSystemdサービスとして常駐させるためのシェルスクリプト。デプロイ時、モジュールを配置後にサービスを再起動させる。
<br>

### 参考<br>
[Spring Bootを使ったWebAPIの作成](https://zenn.dev/ryo7/articles/dev-app-by-spring-boot/)
