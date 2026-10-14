-- Учебный пример для MySQL: продукты питания.
-- Поля: id, наименование, цена, количество, сумма.
-- Цены условные. Сумма рассчитывается автоматически.

SET NAMES utf8mb4;

-- Создание и выбор базы данных
CREATE DATABASE IF NOT EXISTS grocery_shop
    DEFAULT CHARACTER SET utf8mb4;
USE grocery_shop;

-- Создание таблицы
CREATE TABLE groceries (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    name     VARCHAR(255) NOT NULL,
    price    DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    total    DECIMAL(12, 2)
             GENERATED ALWAYS AS (price * quantity) STORED
) DEFAULT CHARSET = utf8mb4;

-- Заполнение таблицы: 10 позиций
INSERT INTO groceries (name, price, quantity) VALUES
('Хлеб пшеничный',         150.00, 20),
('Молоко 1 л',             450.00, 15),
('Яйца, упаковка 10 шт.',   700.00, 12),
('Рис 1 кг',               600.00, 10),
('Макароны 500 г',         350.00, 18),
('Сахар 1 кг',             500.00, 14),
('Соль 1 кг',              120.00, 25),
('Масло подсолнечное 1 л', 900.00,  8),
('Чай чёрный 100 г',       800.00,  6),
('Печенье 300 г',          400.00, 16);

-- Просмотр таблицы
SELECT * FROM groceries;

-- Итоговые значения
SELECT
    COUNT(*)      AS `Количество позиций`,
    SUM(quantity) AS `Всего упаковок`,
    SUM(total)    AS `Общая стоимость`
FROM groceries;

-- Ожидаемый итог: 10 позиций, 144 упаковки, общая стоимость 58850.00.

-- Примеры удаления закомментированы.
-- Для выполнения нужной команды уберите в её начале два дефиса.
-- Выполняйте команды отдельно: каждая изменяет или удаляет данные.

-- Удалить товар с id = 5
-- DELETE FROM groceries WHERE id = 5;

-- Удалить все товары, содержащие слово «Молоко»
-- DELETE FROM groceries WHERE name LIKE '%Молоко%';

-- Удалить товары дороже 700
-- DELETE FROM groceries WHERE price > 700;

-- Удалить товары, которых нет на складе
-- DELETE FROM groceries WHERE quantity = 0;

-- Удалить все строки, сохранив таблицу
-- DELETE FROM groceries;

-- Другой способ очистить таблицу
-- TRUNCATE TABLE groceries;

-- Удалить колонку «сумма»
-- ALTER TABLE groceries DROP COLUMN total;

-- Удалить саму таблицу
-- DROP TABLE groceries;

-- Удалить всю базу данных
-- DROP DATABASE grocery_shop;
