SELECT
  n.nid AS unique_id,
  title,
  'en' AS language,
  td.name AS temperature,
  GROUP_CONCAT(fi.field_ingredients_target_id SEPARATOR '|') AS ingredinets
FROM node n
  LEFT JOIN field_data_field_temperature ft ON n.nid = ft.entity_id AND ft.entity_type = 'node'
  LEFT JOIN taxonomy_term_data td ON td.tid = ft.field_temperature_tid
  LEFT JOIN field_data_field_ingredients fi ON n.nid = fi.entity_id AND fi.entity_type = 'node'
WHERE type = 'glaze'
GROUP BY n.nid
ORDER BY title