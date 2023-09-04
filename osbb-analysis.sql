EXPLAIN SELECT
    p.first_name,
    p.last_name,
    p.middle_name,
    p.email,
    p.phone_number,
    b.number AS building_number,
    s.street AS street_name,
    a.number AS apartment_number,
    a.area
FROM
    resident r
JOIN
    person p ON r.person_id = p.id
JOIN
    apartment a ON r.apartment_id = a.id
JOIN
    building b ON a.building_id = b.id
JOIN
    street s ON b.street_id = s.id
WHERE
    r.car_entry_permission = FALSE
    AND a.floor IS NOT NULL
    AND (SELECT COUNT(*) FROM resident r2 WHERE r2.person_id = p.id) = 1;

-- To improve query performance, we can create two indexes on the resident table

-- CREATE INDEX idx_person_id ON resident (person_id);
-- CREATE INDEX idx_apartment_id ON resident (apartment_id);
