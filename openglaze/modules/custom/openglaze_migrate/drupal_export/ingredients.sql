SELECT
  n.nid AS unique_id,
  'ingredient' AS title,
  fm.field_material_target_id AS material_id,
  fa.field_amount_value AS amount
FROM node n
  LEFT JOIN field_data_field_material fm ON n.nid = fm.entity_id AND fm.entity_type = 'node'
  LEFT JOIN field_data_field_amount fa ON n.nid = fa.entity_id AND fa.entity_type = 'node'
WHERE type = 'glaze_ingredient'
GROUP BY n.nid
ORDER BY title