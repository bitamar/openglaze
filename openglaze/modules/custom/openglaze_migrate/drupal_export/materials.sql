SELECT
	n.nid AS id,
	title,
	n.language,
	GROUP_CONCAT(aka.field_aka_value) AS aka,
	wa.field_wikipedia_article_url AS wiki_url,
  ff.field_formula_value as formula,
	fm.filename
FROM node n
	LEFT JOIN field_data_field_wikipedia_article wa ON n.nid = wa.entity_id AND wa.entity_type = 'node'
	LEFT JOIN field_data_field_aka aka ON n.nid = aka.entity_id AND aka.entity_type = 'node'
	LEFT JOIN field_data_field_images i ON n.nid = i.entity_id AND i.entity_type = 'node'
  LEFT JOIN field_data_field_formula ff ON n.nid = ff.entity_id AND ff.entity_type = 'node'
	LEFT JOIN file_managed fm ON fm.fid = i.field_images_fid
WHERE type = 'material'
GROUP BY n.nid
ORDER BY title