-- My First Solution

SELECT company.company_code, company.founder, 
    (SELECT COUNT(DISTINCT(lm.lead_manager_code)) 
            FROM lead_manager lm 
            WHERE lm.company_code = company.company_code) lm_count,
    (SELECT COUNT(DISTINCT(sm.senior_manager_code))
            FROM senior_manager sm 
            WHERE sm.company_code = company.company_code) sm_count,
    (SELECT COUNT(DISTINCT(m.manager_code))
            FROM manager m 
            WHERE m.company_code = company.company_code) m_count,
    (SELECT COUNT(DISTINCT(e.employee_code)) 
            FROM employee e 
            WHERE e.company_code = company.company_code) e_count
FROM company
ORDER BY company.company_code
-- If the question asks to be arranged by the number in company code 
-- ORDER BY CONVERT(MID(company.company_code, 2), SIGNED) 