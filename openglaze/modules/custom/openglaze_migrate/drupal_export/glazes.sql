SELECT
  n.nid AS id,
  title,
  n.language,
  td.name AS temperature
FROM node n
  LEFT JOIN field_data_field_temperature ft ON n.nid = ft.entity_id AND ft.entity_type = 'node'
  LEFT JOIN taxonomy_term_data td ON td.tid = ft.field_temperature_tid
WHERE type = 'glaze'
ORDER BY title