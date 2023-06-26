ALTER TABLE users
ADD COLUMN role VARCHAR(20) NOT NULL;

UPDATE users
SET role = 'ADMIN'
WHERE email = "admin@admin.com";

UPDATE users
SET role = 'USER'
WHERE email <> "admin@admin.com";

