SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Ensure DB exists
CREATE DATABASE IF NOT EXISTS test_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE test_db;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';

DROP TABLE IF EXISTS jobs, job_types, job_categories;

-- Job Categories
CREATE TABLE job_categories (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  sort_order INT DEFAULT 0,
  created_by INT,
  created DATETIME,
  modified DATETIME,
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Job Types
CREATE TABLE job_types (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  job_category_id INT,
  sort_order INT DEFAULT 0,
  created_by INT,
  created DATETIME,
  modified DATETIME,
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Table: jobs
CREATE TABLE jobs (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  media_id INT,
  job_category_id INT,
  job_type_id INT,
  description TEXT,
  detail TEXT,
  business_skill TEXT,
  knowledge TEXT,
  location TEXT,
  activity TEXT,
  academic_degree_doctor TINYINT(1) DEFAULT 0,
  academic_degree_master TINYINT(1) DEFAULT 0,
  academic_degree_professional TINYINT(1) DEFAULT 0,
  academic_degree_bachelor TINYINT(1) DEFAULT 0,
  salary_statistic_group TEXT,
  salary_range_first_year VARCHAR(50),
  salary_range_average VARCHAR(50),
  salary_range_remarks TEXT,
  restriction TEXT,
  estimated_total_workers INT,
  remarks TEXT,
  url TEXT,
  seo_description TEXT,
  seo_keywords TEXT,
  sort_order INT DEFAULT 0,
  publish_status TINYINT(1) DEFAULT 1,
  version INT DEFAULT 1,
  created_by INT,
  created DATETIME,
  modified DATETIME,
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Insert job categories
INSERT INTO job_categories (id, name, sort_order, created_by, created, modified, deleted) VALUES
(1, '航空業界', 3, 1001, NOW(), NOW(), 0),
(2, '旅行業界', 2, 1002, NOW(), NOW(), 0),
(3, '医療業界', 1, 1003, NOW(), NOW(), 0);


-- Insert job types
INSERT INTO job_types (id, name, job_category_id, sort_order, created_by, created, modified, deleted) VALUES
(1, 'キャビンアテンダント', 1, 3, 1001, NOW(), NOW(), 0),
(2, 'パイロット', 1, 2, 1001, NOW(), NOW(), 0),
(3, 'ツアーガイド', 2, 3, 1002, NOW(), NOW(), 0),
(4, '看護師', 3, 2, 1003, NOW(), NOW(), 0),
(5, '薬剤師', 3, 1, 1003, NOW(), NOW(), 0);

-- Insert jobs
INSERT INTO jobs (
  name, media_id, job_category_id, job_type_id, description, detail,
  business_skill, knowledge, location, activity,
  academic_degree_doctor, academic_degree_master, academic_degree_professional, academic_degree_bachelor,
  salary_statistic_group, salary_range_first_year, salary_range_average, salary_range_remarks,
  restriction, estimated_total_workers, remarks, url, seo_description, seo_keywords,
  sort_order, publish_status, version, created_by, created, modified, deleted
) VALUES
('キャビンアテンダント職', 1, 1, 1, 'キャビンアテンダントとしての経験を活かせます',
 '機内サービスの提供や安全確認業務', 'コミュニケーション能力', '航空業界の基礎知識',
 '東京/成田空港', '国内外へのフライト業務',
 0, 0, 0, 1, 'Aランク', '3M円', '5M円', '年収例あり',
 '夜勤あり', 100, '外国語スキル必須', 'https://example.com/ca1',
 '国際線でのキャリアを積むチャンス', 'CA,航空,国際線', 10, 1, 1, 101, NOW(), NOW(), 0),

('パイロット候補', 2, 1, 2, '将来の機長候補', 'フライト訓練含む',
 '責任感', '操縦知識', '大阪/関西空港', '操縦訓練',
 0, 0, 1, 1, 'Sランク', '5M円', '8M円', '住宅手当あり',
 '', 50, '健康診断必須', 'https://example.com/pilot1',
 'パイロット志望必見', 'パイロット,航空', 9, 1, 1, 102, NOW(), NOW(), 0),

('旅行ガイド', 3, 2, 3, '観光案内を行う仕事', '訪日観光客対応',
 '多言語対応スキル', '地理的知識', '京都', '日帰りツアー同行',
 0, 0, 0, 1, 'Bランク', '2.5M円', '4M円', '',
 '', 20, '', 'https://example.com/guide1',
 'ツアーガイド募集', 'ガイド,観光', 8, 1, 1, 103, NOW(), NOW(), 0),

('ナース採用', 4, 3, 4, '看護師業務', '患者ケアと診療補助',
 'ホスピタリティ', '看護知識', '東京', '病棟勤務',
 0, 1, 0, 1, 'Aランク', '4M円', '5.5M円', '', '', 80, '', 'https://example.com/nurse1',
 '安定の医療職', '看護,医療', 7, 1, 1, 104, NOW(), NOW(), 0),

('薬剤師補助', 5, 3, 5, '調剤業務の補助', '調剤室での作業',
 '細かい作業能力', '薬学基礎', '横浜', '処方箋対応',
 0, 1, 0, 1, 'Bランク', '3.5M円', '4.5M円', '', '', 40, '', 'https://example.com/pharma1',
 '医療サポート職', '薬剤師,医療', 6, 1, 1, 105, NOW(), NOW(), 0),

('空港保安員', 6, 1, 1, '手荷物検査', '空港でのセキュリティ',
 '注意力', 'セキュリティ対応', '福岡', '保安業務',
 0, 0, 0, 1, 'Cランク', '3M円', '4M円', '', '', 60, '', 'https://example.com/security1',
 '空港勤務', '空港,保安', 5, 1, 1, 106, NOW(), NOW(), 0),

('CA補助職', 7, 1, 1, 'CAのサポート業務', '訓練同行',
 '教育力', 'マナー研修知識', '名古屋', '研修補助',
 0, 0, 0, 1, 'Cランク', '2.5M円', '3.5M円', '', '', 30, '', 'https://example.com/ca2',
 '新人支援ポジション', 'CA,補助', 4, 1, 1, 107, NOW(), NOW(), 0),

('国際線CA', 8, 1, 1, '国際線対応', '長距離フライト',
 '語学力', '海外マナー', '成田空港', '海外線',
 0, 0, 0, 1, 'Sランク', '5M円', '6.5M円', '', '', 90, '', 'https://example.com/ca3',
 'グローバルに活躍', '国際,航空', 3, 1, 1, 108, NOW(), NOW(), 0),

('国内線CA', 9, 1, 1, '国内線勤務', '短距離路線',
 '対応力', '地理知識', '羽田空港', '国内線業務',
 0, 0, 0, 1, 'Aランク', '4M円', '5M円', '', '', 70, '', 'https://example.com/ca4',
 '国内フライト業務', '国内,CA', 2, 1, 1, 109, NOW(), NOW(), 0),

('ツアー企画', 10, 2, 3, 'ツアー設計', '旅行商品開発',
 '企画力', '観光知識', '北海道', '商品設計',
 0, 0, 0, 1, 'Bランク', '3M円', '4.5M円', '', '', 25, '', 'https://example.com/plan1',
 '旅行業界企画職', '旅行,企画', 1, 1, 1, 110, NOW(), NOW(), 0);


CREATE TABLE personalities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE jobs_personalities (
  job_id INT,
  personality_id INT
);

INSERT INTO personalities (id, name, deleted) VALUES
(1, 'チームワーク', 0),
(2, 'リーダーシップ', 0);

INSERT INTO jobs_personalities (job_id, personality_id) VALUES
(1, 1), (2, 2);

CREATE TABLE practical_skills (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE jobs_practical_skills (
  job_id INT,
  practical_skill_id INT
);

INSERT INTO practical_skills (id, name, deleted) VALUES
(1, '接客スキル', 0),
(2, '多言語対応', 0);

INSERT INTO jobs_practical_skills (job_id, practical_skill_id) VALUES
(1, 1), (3, 2);

CREATE TABLE basic_abilities (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE jobs_basic_abilities (
  job_id INT,
  basic_ability_id INT
);

INSERT INTO basic_abilities (id, name, deleted) VALUES
(1, '思考力', 0),
(2, '注意力', 0);

INSERT INTO jobs_basic_abilities (job_id, basic_ability_id) VALUES
(1, 1), (4, 2);

CREATE TABLE affiliates (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  type TINYINT,
  deleted TINYINT(1) DEFAULT 0
) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE jobs_tools (
  job_id INT,
  affiliate_id INT
);

INSERT INTO affiliates (id, name, type, deleted) VALUES
(1, '無線機器', 1, 0),  -- tools
(2, 'CA資格', 2, 0),   -- recommended qualification
(3, 'マネージャー経験', 3, 0); -- career path

INSERT INTO jobs_tools (job_id, affiliate_id) VALUES
(1, 1), (2, 1);

CREATE TABLE jobs_rec_qualifications (
  job_id INT,
  affiliate_id INT
);

CREATE TABLE jobs_req_qualifications (
  job_id INT,
  affiliate_id INT
);

CREATE TABLE jobs_career_paths (
  job_id INT,
  affiliate_id INT
);

-- Sample insert
INSERT INTO jobs_rec_qualifications (job_id, affiliate_id) VALUES (1, 2);
INSERT INTO jobs_req_qualifications (job_id, affiliate_id) VALUES (1, 2);
INSERT INTO jobs_career_paths (job_id, affiliate_id) VALUES (1, 3);


-- FULLTEXT indexes for search optimization

-- Jobs table
ALTER TABLE jobs
ADD FULLTEXT ft_jobs_text (
  name,
  description,
  detail,
  business_skill,
  knowledge,
  location,
  activity,
  salary_statistic_group,
  salary_range_remarks,
  restriction,
  remarks
);

-- JobCategories
ALTER TABLE job_categories
ADD FULLTEXT ft_category_name (name);

-- JobTypes
ALTER TABLE job_types
ADD FULLTEXT ft_type_name (name);

-- Personalities
ALTER TABLE personalities
ADD FULLTEXT ft_personality_name (name);

-- Practical Skills
ALTER TABLE practical_skills
ADD FULLTEXT ft_practical_name (name);

-- Basic Abilities
ALTER TABLE basic_abilities
ADD FULLTEXT ft_ability_name (name);

-- Affiliates (shared by Tools, CareerPaths, Rec/ReqQualifications)
ALTER TABLE affiliates
ADD FULLTEXT ft_affiliate_name (name);
