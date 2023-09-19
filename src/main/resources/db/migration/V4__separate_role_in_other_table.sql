CREATE TABLE IF NOT EXISTS roles (
  id BIGINT NOT NULL AUTO_INCREMENT,
  user_role VARCHAR(20) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY uk_user_role (user_role)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO roles (user_role)
VALUES ('USER'), ('ADMIN');

ALTER TABLE users
ADD COLUMN role_id INT NOT NULL;

UPDATE users
SET role_id = SELECT role_id
              FROM users
              INNER JOIN roles ON users.role = roles.user_role;

ALTER TABLE users
DROP COLUMN role;