--1.Selezionare tutti gli studenti nati nel 1990 (160)
SELECT
  *
FROM
  `students`
WHERE
  YEAR(`date_of_birth`) = '1990';
--2.Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT
  *
FROM
  `courses`
WHERE
  `cfu` > 10;
--3.Selezionare tutti gli studenti che hanno più di 30 anni
SELECT
  *
FROM
  `students`
WHERE
  2022 - YEAR(`date_of_birth`) > 30
ORDER BY
  `date_of_birth`;
--4.Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT
  *
FROM
  `courses`
WHERE
  `period` LIKE 'I %'
  AND `year` = 1;
--5.Selezionare tutti gli appelli d 'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT
  *
FROM
  `exams`
WHERE
  TIME(`hour`) > '14:00:00'
  AND DATE(`date`) = '2020-06-20';
--6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT
  *
FROM
  `degrees`
WHERE
  `level` = 'magistrale';
--7. Da quanti dipartimenti è composta l' università ? (12)
SELECT
  COUNT(`id`) AS `departments_tot`
FROM
  `departments`;
--8.Quanti sono gli insegnanti che non hanno un numero di telefono ? (50)
SELECT
  COUNT(`id`) AS `teachers_no_phone_number_tot`
FROM
  `teachers`
WHERE
  `phone` IS NULL;

-----------------GROUP BY---------------
--1.Contare quanti iscritti ci sono stati ogni anno
SELECT
  COUNT(`id`) AS 'tot_students',
  YEAR(`enrolment_date`) AS 'per_year'
FROM
  `students`
GROUP BY
  YEAR(`enrolment_date`);
--2.Contare gli insegnanti che hanno l 'ufficio nello stesso edificio
SELECT
  COUNT(`id`) AS 'teachers_for_place',
  `office_address`
FROM
  `teachers`
GROUP BY
  `office_address`;
--3.Calcolare la media dei voti di ogni appello d 'esame
SELECT
  ROUND(AVG(`vote`), 1) AS 'votes_average',
  `exam_id`
FROM
  `exam_student`
GROUP BY
  `exam_id`;
--4.Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT
  COUNT(`id`) AS 'degrees_tot_per_department',
  `department_id`
FROM
  `degrees`
GROUP BY
  `department_id`;

-----------------JOIN---------------
--1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT
  `degrees`.`name`,
  `students`.*
FROM
  `degrees`
INNER JOIN `students` 
  ON `students`.`degree_id` = `degrees`.`id`
WHERE
  `degrees`.`name` = 'Corso di Laurea in Economia'
--2.Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT
  `departments`.`name`,
  `degrees`.*
FROM
  `departments`
INNER JOIN `degrees` 
  ON `degrees`.`department_id` = `departments`.`id`
WHERE
  `departments`.`id` = 7;
--3.Selezionare tutti i corsi in cui insegna Fulvio Amato (id = 44)
SELECT
  `teachers`.`id`,
  `teachers`.`name`,
  `teachers`.`surname`,
  `courses`.*
FROM
  `teachers`
INNER JOIN `course_teacher` 
  ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses` 
  ON `course_teacher`.`course_id` = `courses`.`id`
WHERE
  `teachers`.`id` = 44;
  --4.Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
  SELECT
  *
FROM
  `students`
INNER JOIN `degrees` 
  ON `degrees`.`id` = `students`.`degree_id`
INNER JOIN `departments` 
  ON `departments`.`id` = `degrees`.`department_id`
ORDER BY
  `students`.`surname`,
  `students`.`name`