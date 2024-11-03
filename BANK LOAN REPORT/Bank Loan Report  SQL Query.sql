SELECT * FROM Bank_Loan_data

SELECT COUNT(id) as Total_Applications FROM Bank_Loan_data

SELECT COUNT(id) as MTD_Total_Applications FROM Bank_Loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) =2021

SELECT COUNT(id)AS PMTD_Total_Applications FROM Bank_Loan_data
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

--(MTD-PMTD)/PMTD
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM Bank_Loan_data

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_Loan_data
WHERE MONTH (issue_date)=12 AND YEAR(issue_date)= 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM Bank_Loan_data
WHERE MONTH (issue_date)=11 AND YEAR(issue_date)= 2021

SELECT SUM(total_payment) AS Total_Amount_Collected FROM Bank_Loan_data

SELECT SUM(total_payment) AS MTD_Total_Amount_Collected FROM Bank_Loan_data
WHERE MONTH(issue_date)=12 

SELECT SUM(total_payment) AS PMTD_Total_Amount_Collected FROM Bank_Loan_data
WHERE MONTH(issue_date)=11

SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM Bank_Loan_data 

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM Bank_Loan_data 
WHERE MONTH(issue_date)=12

SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM Bank_Loan_data 
WHERE MONTH(issue_date)=11

SELECT AVG(dti)*100 AS Avg_DTI FROM Bank_Loan_data

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM Bank_Loan_data
WHERE MONTH(issue_date)=12 

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM Bank_Loan_data
WHERE MONTH(issue_date)=11

SELECT (COUNT(CASE WHEN loan_status = 'Fully paid' OR loan_status = 'Current' THEN id END)*100.0)/
COUNT(id) AS Good_Loan_Percentage FROM Bank_Loan_data

SELECT COUNT(id) AS Good_Loan_Applications FROM Bank_Loan_data
WHERE loan_status ='Fully Paid' OR loan_status ='Current'

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM Bank_Loan_data
WHERE loan_status ='Fully Paid' OR loan_status ='Current'

SELECT SUM(total_Payment) AS Good_Loan_Amount_Received FROM Bank_Loan_data
WHERE loan_status ='Fully Paid' OR loan_status ='Current'

SELECT(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0)/ 
COUNT(id) AS Bad_Loan_Percentage FROM bank_loan_data

SELECT COUNT(id) AS Bad_Loan_Percentage FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'

SELECT loan_status, COUNT(id) AS LoanCount,SUM(total_payment)AS Total_Amount_Received,
SUM(loan_amount)AS Total_Funded_Amount,
AVG(int_rate) AS Interest_Rate,
AVG(dti*100)AS DTI FROM Bank_Loan_data GROUP BY loan_status

SELECT loan_status, SUM(total_payment) AS MTD_Total_Amount_Received, 
SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_Loan_data 
WHERE MONTH(issue_date)=12 GROUP BY loan_status 

SELECT MONTH(issue_date) AS Month_Number,DATENAME(MONTH, issue_date) AS Month_Name,
COUNT(id) AS Total_Loan_Applications,SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM Bank_Loan_data 
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT address_state AS State,COUNT(id) AS Total_Loan_Applications, SUM(loan_amount)
AS Total_Funded_Amount, SUM(total_payment)AS Total_Amount_Received FROM [Bank_Loan_data]
GROUP BY address_state ORDER BY address_state

SELECT term AS Term, COUNT(id) AS Total_Loan_Applications, SUM(loan_amount) AS Total_Funded_Amount, 
SUM(total_payment)AS Total_Amount_Received FROM Bank_Loan_data
GROUP BY term ORDER BY term

SELECT emp_length AS Employee_Length,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_Amount)AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM Bank_Loan_data GROUP BY Emp_length ORDER BY emp_length

SELECT purpose AS PURPOSE,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment)AS Total_Amount_Received
FROM Bank_Loan_data GROUP BY purpose ORDER BY purpose

SELECT home_ownership AS Home_Ownership,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount)AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received FROM Bank_Loan_data GROUP BY home_ownership 
ORDER BY Home_Ownership

SELECT purpose AS PURPOSE, 
COUNT(id) AS Total_Loan_Applications, 
SUM(loan_amount) AS Total_Funded_Amount,
SUM(loan_amount) AS Total_Amount_Received
FROM Bank_Loan_data WHERE grade ='A' GROUP BY purpose ORDER BY purpose