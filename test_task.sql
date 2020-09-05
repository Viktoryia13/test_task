-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 05 2020 г., 21:18
-- Версия сервера: 5.6.38
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_task`
--

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id` int(32) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id`, `name`) VALUES
(1, 'John'),
(2, 'Vika'),
(3, 'Jane'),
(4, 'Mask'),
(5, 'Tom'),
(6, 'Tom');

-- --------------------------------------------------------

--
-- Структура таблицы `time_reports`
--

CREATE TABLE `time_reports` (
  `id` int(32) NOT NULL,
  `employee_id` int(32) NOT NULL,
  `hours` float NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `time_reports`
--

INSERT INTO `time_reports` (`id`, `employee_id`, `hours`, `date`) VALUES
(1, 3, 8.5, '9/4/2020'),
(2, 4, 9, '9/4/2020'),
(3, 4, 8, '9/5/2020'),
(4, 1, 2, '9/3/2020'),
(5, 4, 4, '9/5/2020'),
(7, 2, 33, '9/4/2020'),
(8, 3, 45.3, '9/4/2020'),
(9, 4, 56.678, '9/4/2020'),
(10, 6, 45.3, '9/4/2020'),
(12, 2, 7.66, '9/7/2020'),
(13, 4, 3, '9/7/2020'),
(14, 5, 1, '9/7/2020'),
(16, 3, 8, '9/7/2020'),
(17, 1, 7.66, '9/7/2020'),
(20, 2, 6.66, '9/8/2020'),
(22, 2, 7, '9/10/2020'),
(23, 3, 8, '9/8/2020');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `time_reports`
--
ALTER TABLE `time_reports`
  MODIFY `id` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `time_reports`
--
ALTER TABLE `time_reports`
  ADD CONSTRAINT `time_reports_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
