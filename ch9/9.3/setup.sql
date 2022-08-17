CREATE DATABASE test CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';
USE test;
CREATE TABLE session_record (id int AUTO_INCREMENT, trace_id text, access_token text, user_uuid text, PRIMARY KEY (`id`));