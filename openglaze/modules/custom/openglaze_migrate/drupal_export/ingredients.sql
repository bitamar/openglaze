SELECT
n.nid AS id,
fi.entity_id AS glaze_id,
fm.field_material_target_id AS material_id,
fa.field_amount_value AS amount
FROM node n
LEFT JOIN field_data_field_material fm ON n.nid = fm.entity_id AND fm.entity_type = 'node'
LEFT JOIN field_data_field_amount fa ON n.nid = fa.entity_id AND fa.entity_type = 'node'
INNER JOIN field_data_field_ingredients fi ON n.nid = fi.field_ingredients_target_id
WHERE type = 'glaze_ingredient_'
GROUP BY n.nid
ORDER BY title