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

SELECT host_id, hostname, round5(host_usage.timestamp) AS round_timestamp, ROUND((AVG((total_mem/1000) - memory_free) / (total_mem/1000))*100, 2) AS avg_used_mem_percentage
FROM host_usage JOIN host_info hi on host_usage.host_id = hi.id
GROUP BY round_timestamp, host_id, hostname, memory_free, total_mem
ORDER BY round_timestamp ASC;

-- Question 3: Detect host failure

SELECT host_id, round5(timestamp) AS ts, COUNT(*) AS num_data_points
FROM host_usage
GROUP BY ts, host_id
HAVING COUNT(*) < 3
ORDER BY ts;

