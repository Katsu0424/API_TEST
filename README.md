## Java Springbootで簡単なAPIを作成し、Code PipelineでCI/CD化
- 参画中の案件にてPipelineを使用する予定みたいなので、動作確認してみる。
- 本番環境での運用を考えるとELB、ECS Fargateを使用すべきなので、その辺も今後確認予定。
- CircleCIとの比較もしてみたい。
<br>

## 構成図
![image](https://github.com/Katsu0424/API_TEST/assets/69413292/05f4c4fc-a629-469f-b06e-e100cc57f2b9)
<br>
1. Gitにpush
2. Code Pipelineの設定で対象のGithubリポジトリ+ブランチを監視し、Code Buildスタート
3. Code Buildでビルドしたjar+αをS3にput
4. Code Deployスタート
5. Code Deployの指示を受け、EC2にてCodeDeploy AgentがS3から資材を取得し、デプロイ
<br>

## 主要ファイル
- buildspec.yml
  - ビルドの仕様を記載したYaml形式のファイル。実行するLinuxのコマンドやS3にアップロードするファイルパスなどを記述。

- cddedeploy/appspec.yml
  - デプロイの仕様を記載したYaml形式のファイル。S3から取得したモジュールの配置場所、各フェーズで実行する処理を記述。

- deploy/backendProject-restart.sh
  - アプリケーションをSystemdサービスとして常駐させるためのシェルスクリプト。デプロイ時、モジュールを配置後にサービスを再起動させる。
<br>

### 参考<br>
[Spring Bootを使ったWebAPIの作成]([https://www.google.co.jp/](https://zenn.dev/ryo7/articles/dev-app-by-spring-boot)https://zenn.dev/ryo7/articles/dev-app-by-spring-boot/)
