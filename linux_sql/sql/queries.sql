-- Question 1: Group hosts by hardware info

SELECT cpu_number, id AS host_id, total_mem
FROM host_info
GROUP BY cpu_number, id
ORDER BY total_mem DESC;

-- Function to round to the nearest 5 minutes

CREATE FUNCTION round5(ts timestamp) RETURNS timestamp AS
$$
BEGIN
    RETURN date_trunc('hour', ts) + date_part('minute', ts):: int / 5 * interval '5 min';
END;
$$
    LANGUAGE PLPGSQL;

-- Question 2: Average memory usage in 5 minute intervals

SELECT host_id, round5(host_usage.timestamp) AS round_timestamp, AVG((total_mem/1000)-memory_free) AS avg_memory
FROM host_usage JOIN host_info hi on host_usage.host_id = hi.id
GROUP BY round_timestamp, host_id;
--ORDER BY round_timestamp ASC;


