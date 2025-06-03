"Проверим работоспособность таблицы"

SELECT *
from education_career_success

"Изучим таблицу перед тем, как начать работать с ней:
- Посмотрим первые 10 строк.
- Подсчитаем количество строк в таблице. "

SELECT  *
from education_career_success 
limit 10;

SELECT count(*)
from education_career_success;

"Разделим таблицу на два больших блока: где гендер определен и где он не определен."

CREATE TEMPORARY TABLE gender_education AS
SELECT *
FROM education_career_success
WHERE Gender = 'Male' OR Gender = 'Female';

CREATE TEMPORARY TABLE other_education AS
SELECT *
FROM education_career_success
WHERE Gender = 'Other';

"Поработаем с временной таблицей gender_education"

SELECT *
FROM gender_education;

"Посчитаем основные показатели для мужчин, открывших свой бизнес, с ранжированием по грейду"

SELECT 
	ROUND(AVG(Age), 2) AS avg_age,
	ROUND(AVG(High_School_GPA), 2) AS avg_hs_gpa,
	ROUND(AVG(SAT_Score), 2) AS avg_sat_score,
	ROUND(AVG(University_Ranking), 2) AS avg_university_ranking,
	ROUND(AVG(University_GPA), 2) AS avg_university_gpa,
	ROUND(AVG(Internships_Completed), 2) AS avg_internships_completed,
	ROUND(AVG(Projects_Completed), 2) AS avg_projects_completed,
	ROUND(AVG(Certifications), 2) AS avg_certifications,
	ROUND(AVG(Soft_Skills_Score), 2) AS avg_soft_skills,
	ROUND(AVG(Networking_Score), 2) AS avg_networking_score,
	ROUND(AVG(Job_Offers), 2) AS avg_job_offers,	
	ROUND(AVG(Starting_Salary), 2) AS avg_starting_salary,
	ROUND(AVG(Career_Satisfaction), 2) AS avg_career_satisfaction,
	ROUND(AVG(Years_to_Promotion), 2) AS avg_years_to_promotion,
	ROUND(AVG(Work_Life_Balance), 2) AS avg_work_life_balance,	
	Current_Job_Level
FROM gender_education
WHERE (Gender = 'Male') and (Entrepreneurship = 'True')
GROUP BY Current_Job_Level;

"Выводы:

Портрет стажеров: 
	Средний возраст: 22.97 (!)
	Средний балл аттестата зрелости: 3.05 (!)
	Средний СТА (стандартизированный тестовый балл): 1271.19
	Средний рейтинг университета: 511.53
	Средний балл университета: 3.04
	Количество завершенных стажировок: 1.98
	Количество завершенных личных/академических проектов: 4.58
	Количество полученных дополнительных сертификатов: 2.68 (!)
	Оценка софт-скиллов: 5.74 (!)
	Оценка нетворкинга: 5.7
	Количество офферов после завершения учебы: 2.56 (!)
	Зарплата на первом месте работе: 50276.5
	Уровень удовлетворенности карьерой: 5.75 (!)
	Время на повышение: 3.09
	Рейтинг баланса между работой и жизнью: 5.39


Портрет мидлов: 
	Средний возраст: 23.34
	Средний балл аттестата зрелости: 2.99 (!)
	Средний СТА (стандартизированный тестовый балл): 1240.24
	Средний рейтинг университета: 512.54
	Средний балл университета: 2.98 (!)
	Количество завершенных стажировок: 2.05
	Количество завершенных личных/академических проектов: 4.59
	Количество полученных дополнительных сертификатов: 2.3
	Оценка софт-скиллов: 5.52
	Оценка нетворкинга: 5.76 (!)
	Количество офферов после завершения учебы: 2.31 (!)
	Зарплата на первом месте работе: 48891.95 (!)
	Уровень удовлетворенности карьерой: 5.6
	Время на повышение: 2.74 (!)
	Рейтинг баланса между работой и жизнью: 5.54
	
Портрет сеньоров: 
	Средний возраст: 23.43
	Средний балл аттестата зрелости: 3.0
	Средний СТА (стандартизированный тестовый балл): 1232.16 (!)
	Средний рейтинг университета: 517.98 (!)
	Средний балл университета: 3.01
	Количество завершенных стажировок: 1.94 (!)
	Количество завершенных личных/академических проектов: 4.43 (!)
	Количество полученных дополнительных сертификатов: 2.49
	Оценка софт-скиллов: 5.64
	Оценка нетворкинга: 5.73
	Количество офферов после завершения учебы: 2.42
	Зарплата на первом месте работе: 51082.22
	Уровень удовлетворенности карьерой: 5.36
	Время на повышение: 3.01
	Рейтинг баланса между работой и жизнью: 5.22 (!)

Портрет лидов: 
	Средний возраст: 24.04 (!)
	Средний балл аттестата зрелости: 3.2
	Средний СТА (стандартизированный тестовый балл): 1289.85 (!)
	Средний рейтинг университета: 391.65 (!)
	Средний балл университета: 3.2 (!)
	Количество завершенных стажировок: 2.19 (!)
	Количество завершенных личных/академических проектов: 4.73 (!)
	Количество полученных дополнительных сертификатов: 2.19 (!)
	Оценка софт-скиллов: 5.31 (!)
	Оценка нетворкинга: 5.58 (!)
	Количество офферов после завершения учебы: 2.46
	Зарплата на первом месте работе: 53384.62 (!)
	Уровень удовлетворенности карьерой: 5.15 (!)
	Время на повышение: 3.19 (!)
	Рейтинг баланса между работой и жизнью: 5.62 (!)"
	

"Посчитаем основные показатели для мужчин, не открывших свой бизнес, с ранжированием по грейду"

SELECT 
	ROUND(AVG(Age), 2) AS avg_age,
	ROUND(AVG(High_School_GPA), 2) AS avg_hs_gpa,
	ROUND(AVG(SAT_Score), 2) AS avg_sat_score,
	ROUND(AVG(University_Ranking), 2) AS avg_university_ranking,	
	ROUND(AVG(University_GPA), 2) AS avg_university_gpa,
	ROUND(AVG(Internships_Completed), 2) AS avg_internships_completed,
	ROUND(AVG(Projects_Completed), 2) AS avg_projects_completed,
	ROUND(AVG(Certifications), 2) AS avg_certifications,
	ROUND(AVG(Soft_Skills_Score), 2) AS avg_soft_skills,
	ROUND(AVG(Networking_Score), 2) AS avg_networking_score,
	ROUND(AVG(Job_Offers), 2) AS avg_job_offers,	
	ROUND(AVG(Starting_Salary), 2) AS avg_starting_salary,
	ROUND(AVG(Career_Satisfaction), 2) AS avg_career_satisfaction,
	ROUND(AVG(Years_to_Promotion), 2) AS avg_years_to_promotion,
	ROUND(AVG(Work_Life_Balance), 2) AS avg_work_life_balance,	
	Current_Job_Level
FROM gender_education
WHERE (Gender = 'Male') and (Entrepreneurship = 'False')
GROUP BY Current_Job_Level
ORDER BY Current_Job_Level;

"Выводы:

Портрет стажеров: 
	Средний возраст: 23.47
	Средний балл аттестата зрелости: 2.99 (!)
	Средний СТА (стандартизированный тестовый балл): 1258.61
	Средний рейтинг университета: 513.06
	Средний балл университета: 3.0
	Количество завершенных стажировок: 2.0
	Количество завершенных личных/академических проектов: 4.54
	Количество полученных дополнительных сертификатов: 2.5
	Оценка софт-скиллов: 5.58
	Оценка нетворкинга: 5.56
	Количество офферов после завершения учебы: 2.44
	Зарплата на первом месте работе: 50609.66
	Уровень удовлетворенности карьерой: 5.58
	Время на повышение: 3.01
	Рейтинг баланса между работой и жизнью: 5.37 (!)


Портрет мидлов: 
	Средний возраст: 23.52
	Средний балл аттестата зрелости: 2.99
	Средний СТА (стандартизированный тестовый балл): 1262.93
	Средний рейтинг университета: 512.96
	Средний балл университета: 3.01
	Количество завершенных стажировок: 1.93 (!)
	Количество завершенных личных/академических проектов: 4.59 (!)
	Количество полученных дополнительных сертификатов: 2.54 (!)
	Оценка софт-скиллов: 5.6 (!)
	Оценка нетворкинга: 5.55 (!)
	Количество офферов после завершения учебы: 2.62
	Зарплата на первом месте работе: 50719.1
	Уровень удовлетворенности карьерой: 5.64
	Время на повышение: 3.12 (!)
	Рейтинг баланса между работой и жизнью: 5.67
	
Портрет сеньоров: 
	Средний возраст: 23.2 (!)
	Средний балл аттестата зрелости: 3.01
	Средний СТА (стандартизированный тестовый балл): 1228.36 (!)
	Средний рейтинг университета: 486.99 (!)
	Средний балл университета: 3.02 (!)
	Количество завершенных стажировок: 2.03
	Количество завершенных личных/академических проектов: 4.43
	Количество полученных дополнительных сертификатов: 2.44
	Оценка софт-скиллов: 5.42
	Оценка нетворкинга: 5.59
	Количество офферов после завершения учебы: 2.4 (!)
	Зарплата на первом месте работе: 51897.71 (!)
	Уровень удовлетворенности карьерой: 5.39 (!)
	Время на повышение: 2.95 (!)
	Рейтинг баланса между работой и жизнью: 5.41

Портрет лидов: 
	Средний возраст: 23.55 (!)
	Средний балл аттестата зрелости: 3.04 (!)
	Средний СТА (стандартизированный тестовый балл): 1293.41 (!)
	Средний рейтинг университета: 547.76 (!)
	Средний балл университета: 2.93 (!)
	Количество завершенных стажировок: 2.1 (!)
	Количество завершенных личных/академических проектов: 4.2 (!)
	Количество полученных дополнительных сертификатов: 2.35 (!)
	Оценка софт-скиллов: 5.01 (!)
	Оценка нетворкинга: 6.17 (!)
	Количество офферов после завершения учебы: 2.65 (!)
	Зарплата на первом месте работе: 48993.18 (!!!!)
	Уровень удовлетворенности карьерой: 6.09 (!)
	Время на повышение: 3.08
	Рейтинг баланса между работой и жизнью: 5.99" (!)


"Посчитаем основные показатели для мужчин, открывших свой бизнес, с ранжированием по специальностям"

SELECT 
	ROUND(AVG(Age), 2) AS avg_age,
	ROUND(AVG(High_School_GPA), 2) AS avg_hs_gpa,
	ROUND(AVG(SAT_Score), 2) AS avg_sat_score,
	ROUND(AVG(University_Ranking), 2) AS avg_university_ranking,
	ROUND(AVG(University_GPA), 2) AS avg_university_gpa,
	ROUND(AVG(Internships_Completed), 2) AS avg_internships_completed,
	ROUND(AVG(Projects_Completed), 2) AS avg_projects_completed,
	ROUND(AVG(Certifications), 2) AS avg_certifications,
	ROUND(AVG(Soft_Skills_Score), 2) AS avg_soft_skills,
	ROUND(AVG(Networking_Score), 2) AS avg_networking_score,
	ROUND(AVG(Job_Offers), 2) AS avg_job_offers,	
	ROUND(AVG(Starting_Salary), 2) AS avg_starting_salary,
	ROUND(AVG(Career_Satisfaction), 2) AS avg_career_satisfaction,
	ROUND(AVG(Years_to_Promotion), 2) AS avg_years_to_promotion,
	ROUND(AVG(Work_Life_Balance), 2) AS avg_work_life_balance,	
	Field_of_Study
FROM gender_education
WHERE (Gender = 'Male') and (Entrepreneurship = 'True')
GROUP BY Field_of_Study
ORDER BY Field_of_Study;

"Выводы:

Портрет специализации Arts: 
	Средний возраст: 23.55
	Средний балл аттестата зрелости: 3.01
	Средний СТА (стандартизированный тестовый балл): 1257.51
	Средний рейтинг университета: 479.73
	Средний балл университета: 3.02
	Количество завершенных стажировок: 2.05
	Количество завершенных личных/академических проектов: 4.71 (!)
	Количество полученных дополнительных сертификатов: 2.63
	Оценка софт-скиллов: 5.65
	Оценка нетворкинга: 5.48
	Количество офферов после завершения учебы: 2.55
	Зарплата на первом месте работе: 52538.55 (!)
	Уровень удовлетворенности карьерой: 5.8
	Время на повышение: 3.13
	Рейтинг баланса между работой и жизнью: 5.2


Портрет специализации Business: 
	Средний возраст: 22.43 (!)
	Средний балл аттестата зрелости: 3.0
	Средний СТА (стандартизированный тестовый балл): 1278.9 (!)
	Средний рейтинг университета: 556.37
	Средний балл университета: 3.0
	Количество завершенных стажировок: 1.93
	Количество завершенных личных/академических проектов: 4.69
	Количество полученных дополнительных сертификатов: 2.75 (!)
	Оценка софт-скиллов: 5.42
	Оценка нетворкинга: 6.09 (!)
	Количество офферов после завершения учебы: 2.28
	Зарплата на первом месте работе: 51704.48
	Уровень удовлетворенности карьерой: 5.18
	Время на повышение: 2.69 (!)
	Рейтинг баланса между работой и жизнью: 5.21

	
Портрет специализации Computer Science:
	Средний возраст: 23.75
	Средний балл аттестата зрелости: 3.03
	Средний СТА (стандартизированный тестовый балл): 1250.06
	Средний рейтинг университета: 443.88 (!)
	Средний балл университета: 2.87 (!)
	Количество завершенных стажировок: 2.15
	Количество завершенных личных/академических проектов: 4.54
	Количество полученных дополнительных сертификатов: 2.42
	Оценка софт-скиллов: 6.42 (!)
	Оценка нетворкинга: 5.94
	Количество офферов после завершения учебы: 2.65
	Зарплата на первом месте работе: 47985.42
	Уровень удовлетворенности карьерой: 5.98
	Время на повышение: 3.33 (!)
	Рейтинг баланса между работой и жизнью: 5.63

Портрет специализации Engineering: 
	Средний возраст: 22.96
	Средний балл аттестата зрелости: 2.9 (!)
	Средний СТА (стандартизированный тестовый балл): 1258.66
	Средний рейтинг университета: 478.22
	Средний балл университета: 3.1 (!)
	Количество завершенных стажировок: 1.85 (!)
	Количество завершенных личных/академических проектов: 4.54
	Количество полученных дополнительных сертификатов: 2.49
	Оценка софт-скиллов: 5.9
	Оценка нетворкинга: 5.24 (!)
	Количество офферов после завершения учебы: 2.1 (!)
	Зарплата на первом месте работе: 51025.0
	Уровень удовлетворенности карьерой: 5.59
	Время на повышение: 2.99
	Рейтинг баланса между работой и жизнью: 5.82 (!)

Портрет специализации Law: 
	Средний возраст: 23.75 (!)
	Средний балл аттестата зрелости: 3.1 (!)
	Средний СТА (стандартизированный тестовый балл): 1234.63 (!)
	Средний рейтинг университета: 525.67
	Средний балл университета: 3.02
	Количество завершенных стажировок: 1.91
	Количество завершенных личных/академических проектов: 4.33 (!)
	Количество полученных дополнительных сертификатов: 2.21 (!)
	Оценка софт-скиллов: 5.16 (!)
	Оценка нетворкинга: 5.91
	Количество офферов после завершения учебы: 2.83 (!)
	Зарплата на первом месте работе: 50314.67
	Уровень удовлетворенности карьерой: 5.61
	Время на повышение: 2.95
	Рейтинг баланса между работой и жизнью: 5.81

Портрет специализации Mathematics: 
	Средний возраст: 23.39
	Средний балл аттестата зрелости: 3.07
	Средний СТА (стандартизированный тестовый балл): 1240.99
	Средний рейтинг университета: 486.42
	Средний балл университета: 3.08
	Количество завершенных стажировок: 2.02
	Количество завершенных личных/академических проектов: 4.56
	Количество полученных дополнительных сертификатов: 2.47
	Оценка софт-скиллов: 5.76
	Оценка нетворкинга: 5.74
	Количество офферов после завершения учебы: 2.42
	Зарплата на первом месте работе: 49264.71
	Уровень удовлетворенности карьерой: 6.18 (!)
	Время на повышение: 2.94
	Рейтинг баланса между работой и жизнью: 5.11 (!)

Портрет специализации Medicine: 
	Средний возраст: 22.74
	Средний балл аттестата зрелости: 3.04
	Средний СТА (стандартизированный тестовый балл): 1273.32
	Средний рейтинг университета: 564.05 (!)
	Средний балл университета: 3.01
	Количество завершенных стажировок: 2.15 (!)
	Количество завершенных личных/академических проектов: 4.56
	Количество полученных дополнительных сертификатов: 2.58
	Оценка софт-скиллов: 5.4
	Оценка нетворкинга: 5.71
	Количество офферов после завершения учебы: 2.37
	Зарплата на первом месте работе: 47616.44 (!)
	Уровень удовлетворенности карьерой: 4.88 (!)
	Время на повышение: 2.9
	Рейтинг баланса между работой и жизнью: 5.3"


"Посчитаем основные показатели для мужчин, не открывших свой бизнес, с ранжированием по специальностям"

SELECT 
	ROUND(AVG(Age), 2) AS avg_age,
	ROUND(AVG(High_School_GPA), 2) AS avg_hs_gpa,
	ROUND(AVG(SAT_Score), 2) AS avg_sat_score,
	ROUND(AVG(University_Ranking), 2) AS avg_university_ranking,
	ROUND(AVG(University_GPA), 2) AS avg_university_gpa,
	ROUND(AVG(Internships_Completed), 2) AS avg_internships_completed,
	ROUND(AVG(Projects_Completed), 2) AS avg_projects_completed,
	ROUND(AVG(Certifications), 2) AS avg_certifications,
	ROUND(AVG(Soft_Skills_Score), 2) AS avg_soft_skills,
	ROUND(AVG(Networking_Score), 2) AS avg_networking_score,
	ROUND(AVG(Job_Offers), 2) AS avg_job_offers,	
	ROUND(AVG(Starting_Salary), 2) AS avg_starting_salary,
	ROUND(AVG(Career_Satisfaction), 2) AS avg_career_satisfaction,
	ROUND(AVG(Years_to_Promotion), 2) AS avg_years_to_promotion,
	ROUND(AVG(Work_Life_Balance), 2) AS avg_work_life_balance,	
	Field_of_Study
FROM gender_education
WHERE (Gender = 'Male') and (Entrepreneurship = 'False')
GROUP BY Field_of_Study
ORDER BY Field_of_Study;

"Выводы:

Портрет специализации Arts: 
	Средний возраст: 23.3
	Средний балл аттестата зрелости: 3.03
	Средний СТА (стандартизированный тестовый балл): 1251.72
	Средний рейтинг университета: 512.33
	Средний балл университета: 2.99
	Количество завершенных стажировок: 2.06 (!)
	Количество завершенных личных/академических проектов: 4.7 (!)
	Количество полученных дополнительных сертификатов: 2.44
	Оценка софт-скиллов: 5.6
	Оценка нетворкинга: 5.52
	Количество офферов после завершения учебы: 2.61 (!)
	Зарплата на первом месте работе: 51829.62 (!)
	Уровень удовлетворенности карьерой: 5.6
	Время на повышение: 3.01
	Рейтинг баланса между работой и жизнью: 5.38


Портрет специализации Business: 
	Средний возраст: 23.45
	Средний балл аттестата зрелости: 3.03
	Средний СТА (стандартизированный тестовый балл): 1257.77
	Средний рейтинг университета: 507.87
	Средний балл университета: 3.04
	Количество завершенных стажировок: 2.03
	Количество завершенных личных/академических проектов: 4.3 (!)
	Количество полученных дополнительных сертификатов: 2.37 (!)
	Оценка софт-скиллов: 5.44
	Оценка нетворкинга: 5.73
	Количество офферов после завершения учебы: 2.5
	Зарплата на первом месте работе: 50425.59
	Уровень удовлетворенности карьерой: 5.34 (!)
	Время на повышение: 3.14 (!)
	Рейтинг баланса между работой и жизнью: 5.81 (!)


Портрет специализации Computer Science:
	Средний возраст: 23.47
	Средний балл аттестата зрелости: 2.89 (!)
	Средний СТА (стандартизированный тестовый балл): 1261.8
	Средний рейтинг университета: 515.73
	Средний балл университета: 2.96
	Количество завершенных стажировок: 1.97
	Количество завершенных личных/академических проектов: 4.41
	Количество полученных дополнительных сертификатов: 2.59 (!)
	Оценка софт-скиллов: 5.35 (!)
	Оценка нетворкинга: 5.29 (!)
	Количество офферов после завершения учебы: 2.47
	Зарплата на первом месте работе: 50682.18
	Уровень удовлетворенности карьерой: 5.49
	Время на повышение: 3.13
	Рейтинг баланса между работой и жизнью: 5.67

Портрет специализации Engineering: 
	Средний возраст: 23.67 (!)
	Средний балл аттестата зрелости: 2.97
	Средний СТА (стандартизированный тестовый балл): 1265.48
	Средний рейтинг университета: 505.76
	Средний балл университета: 3.1 (!)
	Количество завершенных стажировок: 2.0
	Количество завершенных личных/академических проектов: 4.67
	Количество полученных дополнительных сертификатов: 2.47
	Оценка софт-скиллов: 5.6
	Оценка нетворкинга: 5.56
	Количество офферов после завершения учебы: 2.45
	Зарплата на первом месте работе: 50452.46
	Уровень удовлетворенности карьерой: 5.62
	Время на повышение: 2.99
	Рейтинг баланса между работой и жизнью: 5.58"


"Попробуем найти корреляцию между академической успеваемостью и навыками"

WITH correlations AS (
  SELECT
    Field_of_Study,

    ROUND(CORR(High_School_GPA, Internships_Completed), 2) AS hs_interns,
    ROUND(CORR(High_School_GPA, Projects_Completed), 2) AS hs_projects,
    ROUND(CORR(High_School_GPA, Certifications), 2) AS hs_certs,
    ROUND(CORR(High_School_GPA, Soft_Skills_Score), 2) AS hs_soft,
    ROUND(CORR(High_School_GPA, Networking_Score), 2) AS hs_network,

    ROUND(CORR(SAT_Score, Internships_Completed), 2) AS sat_interns,
    ROUND(CORR(SAT_Score, Projects_Completed), 2) AS sat_projects,
    ROUND(CORR(SAT_Score, Certifications), 2) AS sat_certs,
    ROUND(CORR(SAT_Score, Soft_Skills_Score), 2) AS sat_soft,
    ROUND(CORR(SAT_Score, Networking_Score), 2) AS sat_network,

    ROUND(CORR(University_Ranking, Internships_Completed), 2) AS rank_interns,
    ROUND(CORR(University_Ranking, Projects_Completed), 2) AS rank_projects,
    ROUND(CORR(University_Ranking, Certifications), 2) AS rank_certs,
    ROUND(CORR(University_Ranking, Soft_Skills_Score), 2) AS rank_soft,
    ROUND(CORR(University_Ranking, Networking_Score), 2) AS rank_network,

    ROUND(CORR(University_GPA, Internships_Completed), 2) AS gpa_interns,
    ROUND(CORR(University_GPA, Projects_Completed), 2) AS gpa_projects,
    ROUND(CORR(University_GPA, Certifications), 2) AS gpa_certs,
    ROUND(CORR(University_GPA, Soft_Skills_Score), 2) AS gpa_soft,
    ROUND(CORR(University_GPA, Networking_Score), 2) AS gpa_network

  FROM gender_education
  WHERE Gender = 'Male'
  GROUP BY Field_of_Study
),

hard_positive AS (
  SELECT *
  FROM correlations
  WHERE
    hs_interns >= 0.1 AND
    hs_projects >= 0.1 AND
    hs_certs >= 0.1 AND
    hs_soft >= 0.1 AND
    hs_network >= 0.1 AND
    sat_interns >= 0.1 AND
    sat_projects >= 0.1 AND
    sat_certs >= 0.1 AND
    sat_soft >= 0.1 AND
    sat_network >= 0.1 AND
    rank_interns >= 0.1 AND
    rank_projects >= 0.1 AND
    rank_certs >= 0.1 AND
    rank_soft >= 0.1 AND
    rank_network >= 0.1 AND
    gpa_interns >= 0.1 AND
    gpa_projects >= 0.1 AND
    gpa_certs >= 0.1 AND
    gpa_soft >= 0.1 AND
    gpa_network >= 0.1
)

SELECT * FROM hard_positive
ORDER BY Field_of_Study;

"Корреляций по жёсткому фильтру не обнаружено. Попробуем посчитать мягче."

WITH correlations AS (
  SELECT
    Field_of_Study,

    ROUND(CORR(High_School_GPA, Internships_Completed), 2) AS hs_interns,
    ROUND(CORR(High_School_GPA, Projects_Completed), 2) AS hs_projects,
    ROUND(CORR(High_School_GPA, Certifications), 2) AS hs_certs,
    ROUND(CORR(High_School_GPA, Soft_Skills_Score), 2) AS hs_soft,
    ROUND(CORR(High_School_GPA, Networking_Score), 2) AS hs_network,

    ROUND(CORR(SAT_Score, Internships_Completed), 2) AS sat_interns,
    ROUND(CORR(SAT_Score, Projects_Completed), 2) AS sat_projects,
    ROUND(CORR(SAT_Score, Certifications), 2) AS sat_certs,
    ROUND(CORR(SAT_Score, Soft_Skills_Score), 2) AS sat_soft,
    ROUND(CORR(SAT_Score, Networking_Score), 2) AS sat_network,

    ROUND(CORR(University_Ranking, Internships_Completed), 2) AS rank_interns,
    ROUND(CORR(University_Ranking, Projects_Completed), 2) AS rank_projects,
    ROUND(CORR(University_Ranking, Certifications), 2) AS rank_certs,
    ROUND(CORR(University_Ranking, Soft_Skills_Score), 2) AS rank_soft,
    ROUND(CORR(University_Ranking, Networking_Score), 2) AS rank_network,

    ROUND(CORR(University_GPA, Internships_Completed), 2) AS gpa_interns,
    ROUND(CORR(University_GPA, Projects_Completed), 2) AS gpa_projects,
    ROUND(CORR(University_GPA, Certifications), 2) AS gpa_certs,
    ROUND(CORR(University_GPA, Soft_Skills_Score), 2) AS gpa_soft,
    ROUND(CORR(University_GPA, Networking_Score), 2) AS gpa_network

  FROM gender_education
  WHERE Gender = 'Male'
  GROUP BY Field_of_Study
),

soft_positive AS (
  SELECT *
  FROM correlations
  WHERE
    hs_interns >= 0.1 OR
    hs_projects >= 0.1 OR
    hs_certs >= 0.1 OR
    hs_soft >= 0.1 OR
    hs_network >= 0.1 OR
    sat_interns >= 0.1 OR
    sat_projects >= 0.1 OR
    sat_certs >= 0.1 OR
    sat_soft >= 0.1 OR
    sat_network >= 0.1 OR
    rank_interns >= 0.1 OR
    rank_projects >= 0.1 OR
    rank_certs >= 0.1 OR
    rank_soft >= 0.1 OR
    rank_network >= 0.1 OR
    gpa_interns >= 0.1 OR
    gpa_projects >= 0.1 OR
    gpa_certs >= 0.1 OR
    gpa_soft >= 0.1 OR
    gpa_network >= 0.1
)

SELECT * FROM soft_positive
ORDER BY Field_of_Study;

"Положительных корреляций по мягкому фильтру тоже не обнаружено."

"Вывод:
Положительных сильных корреляций между академической успеваемостью и навыками нет."

"Попробуем найти сильные отрицательные корреляции между академической успеваемостью и навыками"

WITH correlations AS (
  SELECT
    Field_of_Study,
    
    CORR(High_School_GPA, Internships_Completed) AS corr_hs_intern,
    CORR(High_School_GPA, Projects_Completed) AS corr_hs_projects,
    CORR(High_School_GPA, Certifications) AS corr_hs_certs,
    CORR(High_School_GPA, Soft_Skills_Score) AS corr_hs_soft,
    CORR(High_School_GPA, Networking_Score) AS corr_hs_network,
    
    CORR(SAT_Score, Internships_Completed) AS corr_sat_intern,
    CORR(SAT_Score, Projects_Completed) AS corr_sat_projects,
    CORR(SAT_Score, Certifications) AS corr_sat_certs,
    CORR(SAT_Score, Soft_Skills_Score) AS corr_sat_soft,
    CORR(SAT_Score, Networking_Score) AS corr_sat_network,
    
    CORR(University_Ranking, Internships_Completed) AS corr_rank_intern,
    CORR(University_Ranking, Projects_Completed) AS corr_rank_projects,
    CORR(University_Ranking, Certifications) AS corr_rank_certs,
    CORR(University_Ranking, Soft_Skills_Score) AS corr_rank_soft,
    CORR(University_Ranking, Networking_Score) AS corr_rank_network,
    
    CORR(University_GPA, Internships_Completed) AS corr_uni_intern,
    CORR(University_GPA, Projects_Completed) AS corr_uni_projects,
    CORR(University_GPA, Certifications) AS corr_uni_certs,
    CORR(University_GPA, Soft_Skills_Score) AS corr_uni_soft,
    CORR(University_GPA, Networking_Score) AS corr_uni_network

  FROM gender_education
  WHERE Gender = 'Male'
  GROUP BY Field_of_Study
)
SELECT *
FROM correlations
WHERE
  corr_hs_intern <= -0.3 OR
  corr_hs_projects <= -0.3 OR
  corr_hs_certs <= -0.3 OR
  corr_hs_soft <= -0.3 OR
  corr_hs_network <= -0.3 OR
  corr_sat_intern <= -0.3 OR
  corr_sat_projects <= -0.3 OR
  corr_sat_certs <= -0.3 OR
  corr_sat_soft <= -0.3 OR
  corr_sat_network <= -0.3 OR
  corr_rank_intern <= -0.3 OR
  corr_rank_projects <= -0.3 OR
  corr_rank_certs <= -0.3 OR
  corr_rank_soft <= -0.3 OR
  corr_rank_network <= -0.3 OR
  corr_uni_intern <= -0.3 OR
  corr_uni_projects <= -0.3 OR
  corr_uni_certs <= -0.3 OR
  corr_uni_soft <= -0.3 OR
  corr_uni_network <= -0.3
ORDER BY Field_of_Study;

"Вывод:
Отрицательных сильных корреляций между академической успеваемостью и навыками нет."

"Протестируем по жёстким параметрам"

WITH correlations AS (
  SELECT
    Field_of_Study,
    
    CORR(High_School_GPA, Internships_Completed) AS corr_hs_intern,
    CORR(High_School_GPA, Projects_Completed) AS corr_hs_projects,
    CORR(High_School_GPA, Certifications) AS corr_hs_certs,
    CORR(High_School_GPA, Soft_Skills_Score) AS corr_hs_soft,
    CORR(High_School_GPA, Networking_Score) AS corr_hs_network,
    
    CORR(SAT_Score, Internships_Completed) AS corr_sat_intern,
    CORR(SAT_Score, Projects_Completed) AS corr_sat_projects,
    CORR(SAT_Score, Certifications) AS corr_sat_certs,
    CORR(SAT_Score, Soft_Skills_Score) AS corr_sat_soft,
    CORR(SAT_Score, Networking_Score) AS corr_sat_network,
    
    CORR(University_Ranking, Internships_Completed) AS corr_rank_intern,
    CORR(University_Ranking, Projects_Completed) AS corr_rank_projects,
    CORR(University_Ranking, Certifications) AS corr_rank_certs,
    CORR(University_Ranking, Soft_Skills_Score) AS corr_rank_soft,
    CORR(University_Ranking, Networking_Score) AS corr_rank_network,
    
    CORR(University_GPA, Internships_Completed) AS corr_uni_intern,
    CORR(University_GPA, Projects_Completed) AS corr_uni_projects,
    CORR(University_GPA, Certifications) AS corr_uni_certs,
    CORR(University_GPA, Soft_Skills_Score) AS corr_uni_soft,
    CORR(University_GPA, Networking_Score) AS corr_uni_network

  FROM gender_education
  WHERE Gender = 'Male'
  GROUP BY Field_of_Study
)
SELECT *
FROM correlations
WHERE
  corr_hs_intern <= -0.3 AND
  corr_hs_projects <= -0.3 AND
  corr_hs_certs <= -0.3 AND
  corr_hs_soft <= -0.3 AND
  corr_hs_network <= -0.3 AND

  corr_sat_intern <= -0.3 AND
  corr_sat_projects <= -0.3 AND
  corr_sat_certs <= -0.3 AND
  corr_sat_soft <= -0.3 AND
  corr_sat_network <= -0.3 AND

  corr_rank_intern <= -0.3 AND
  corr_rank_projects <= -0.3 AND
  corr_rank_certs <= -0.3 AND
  corr_rank_soft <= -0.3 AND
  corr_rank_network <= -0.3 AND

  corr_uni_intern <= -0.3 AND
  corr_uni_projects <= -0.3 AND
  corr_uni_certs <= -0.3 AND
  corr_uni_soft <= -0.3 AND
  corr_uni_network <= -0.3
ORDER BY Field_of_Study;

"Вывод:
Отрицательных сильных корреляций между академической успеваемостью и навыками нет."