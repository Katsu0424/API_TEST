-- データベース作成
create database if not exists mydb;

-- 既存のテーブル削除
drop table if exists m_type;
drop table if exists m_area;
drop table if exists m_prefectures;
drop table if exists t_onsen;

-- タイプマスタ
create table m_type (
  type_id CHAR(1) comment 'タイプid'
  , type VARCHAR(50) not null comment 'タイプ'
  , created_at TIMESTAMP comment '作成日'
  , updated_at TIMESTAMP comment '更新日'
  , constraint m_type_PKC primary key (type_id)
) comment 'タイプマスタ' ;

-- 地方マスタ
create table m_area (
  area_id CHAR(2) not null comment '地方id'
  , area_name CHAR(5) not null comment '地方名'
  , created_at TIMESTAMP comment '作成日'
  , updated_at TIMESTAMP comment '更新日'
  , constraint m_area_PKC primary key (area_id)
) comment '地方マスタ' ;

-- 都道府県マスタ
create table m_prefectures (
  prefectures_id CHAR(2) comment '都道府県id'
  , prefectures_name CHAR(5) not null comment '都道府県名'
  , area_id CHAR(2) not null comment '地方id'
  , created_at TIMESTAMP comment '作成日'
  , updated_at TIMESTAMP comment '更新日'
  , constraint m_prefectures_PKC primary key (prefectures_id)
) comment '都道府県マスタ' ;

-- 温泉
create table t_onsen (
  onsen_name VARCHAR(50) not null comment '温泉名'
  , type_id CHAR(1) comment 'タイプid'
  , prefectures_id CHAR(2) not null comment '都道府県ID'
  , visited BOOLEAN not null comment '訪問済み'
  , visited_at TIMESTAMP comment '訪問日時'
  , created_at TIMESTAMP comment '作成日'
  , updated_at TIMESTAMP comment '更新日'
  , constraint t_onsen_PKC primary key (onsen_name)
) comment '温泉' ;

