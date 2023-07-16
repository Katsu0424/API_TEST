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
  , area_name VARCHAR(20) not null comment '地方名'
  , created_at TIMESTAMP comment '作成日'
  , updated_at TIMESTAMP comment '更新日'
  , constraint m_area_PKC primary key (area_id)
) comment '地方マスタ' ;

-- 都道府県マスタ
create table m_prefectures (
  prefectures_id CHAR(2) comment '都道府県id'
  , prefectures_name VARCHAR(20) not null comment '都道府県名'
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

-- 温泉
INSERT INTO t_onsen (onsen_name, type_id, prefectures_id, visited, visited_at, created_at, updated_at) VALUES ('北海道温泉1', '1', '01', false, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_onsen (onsen_name, type_id, prefectures_id, visited, visited_at, created_at, updated_at) VALUES ('青森温泉1', '2', '02', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_onsen (onsen_name, type_id, prefectures_id, visited, visited_at, created_at, updated_at) VALUES ('岩手温泉1', '3', '03', false, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_onsen (onsen_name, type_id, prefectures_id, visited, visited_at, created_at, updated_at) VALUES ('宮城温泉1', '4', '04', true, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO t_onsen (onsen_name, type_id, prefectures_id, visited, visited_at, created_at, updated_at) VALUES ('秋田温泉1', '5', '05', false, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- タイプマスタ
INSERT INTO m_type (type_id, type, created_at, updated_at) VALUES ('1', '露天風呂', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_type (type_id, type, created_at, updated_at) VALUES ('2', '内湯', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_type (type_id, type, created_at, updated_at) VALUES ('3', 'サウナ', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_type (type_id, type, created_at, updated_at) VALUES ('4', '足湯', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_type (type_id, type, created_at, updated_at) VALUES ('5', '家族風呂', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 地方マスタ
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('01', '北海道', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('02', '東北', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('03', '関東', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('04', '中部', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('05', '近畿', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('06', '中国', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('07', '四国', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_area (area_id, area_name, created_at, updated_at) VALUES ('08', '九州・沖縄', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- 都道府県マスタ
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('01', '北海道', '01', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('02', '青森', '02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('03', '岩手', '02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('04', '宮城', '02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('05', '秋田', '02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('06', '山形', '02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('07', '福島', '02', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('08', '茨城', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('09', '栃木', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('10', '群馬', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('11', '埼玉', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('12', '千葉', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('13', '東京', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('14', '神奈川', '03', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('15', '新潟', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('16', '富山', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('17', '石川', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('18', '福井', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('19', '山梨', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('20', '長野', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('21', '岐阜', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('22', '静岡', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('23', '愛知', '04', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('24', '三重', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('25', '滋賀', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('26', '京都', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('27', '大阪', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('28', '兵庫', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('29', '奈良', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('30', '和歌山', '05', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('31', '鳥取', '06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('32', '島根', '06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('33', '岡山', '06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('34', '広島', '06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('35', '山口', '06', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('36', '徳島', '07', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('37', '香川', '07', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('38', '愛媛', '07', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('39', '高知', '07', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('40', '福岡', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('41', '佐賀', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('42', '長崎', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('43', '熊本', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('44', '大分', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('45', '宮崎', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('46', '鹿児島', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
INSERT INTO m_prefectures (prefectures_id, prefectures_name, area_id, created_at, updated_at) VALUES ('47', '沖縄', '08', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
