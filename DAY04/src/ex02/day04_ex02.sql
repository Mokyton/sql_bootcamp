CREATE VIEW v_generated_dates AS
SELECT date(gd) generated_date FROM generate_series('2022-01-01'::date, '2022-01-31', '1 day') gd;