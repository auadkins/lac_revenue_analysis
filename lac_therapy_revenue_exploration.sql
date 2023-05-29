USE lac_therapy_revenue;


-- checking weekly revenue sums

SELECT
date,
SUM(cash + paper_check + credit_debit) AS total_revenue
FROM lac_revenue
GROUP BY date;


-- checking for the highest weekly revenue

SELECT
date,
SUM(cash + paper_check + credit_debit) AS total_revenue
FROM lac_revenue
GROUP BY date
ORDER BY total_revenue DESC;


-- checking for the average weekly revenue

SELECT
AVG(cash + paper_check + credit_debit) AS avg_weekly_revenue
FROM lac_revenue;


-- checking counts for each payment type

SELECT COUNT(cash) AS total_cash_payments
FROM lac_revenue
WHERE cash > 0;

SELECT COUNT(paper_check) AS total_check_payments
FROM lac_revenue
WHERE paper_check > 0;

SELECT COUNT(credit_debit) AS total_card_payments
FROM lac_revenue
WHERE credit_debit > 0;


-- combining those queries into one


SELECT 
    (SELECT 
            COUNT(cash)
        FROM
            lac_revenue
        WHERE
            cash > 0) AS total_cash_payments,
    (SELECT 
            COUNT(paper_check)
        FROM
            lac_revenue
        WHERE
            paper_check > 0) AS total_check_payments,
    (SELECT 
            COUNT(credit_debit)
        FROM
            lac_revenue
        WHERE
            credit_debit > 0) AS total_card_payments;
            
            
-- checking for revenue totals for each category

SELECT 
    (SELECT 
            SUM(cash)
        FROM
            lac_revenue) AS total_cash_revenue,
    (SELECT 
            SUM(paper_check)
        FROM
            lac_revenue) AS total_check_revenue,
    (SELECT 
            SUM(credit_debit)
        FROM
            lac_revenue) AS total_card_revenue;