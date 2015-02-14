<?php

$plugin = array(
  'label' => t('Glazes'),
  'resource' => 'glazes',
  'name' => 'glazes__1_0',
  'entity_type' => 'node',
  'bundle' => 'glaze',
  'description' => t('Export the "Glaze" content type.'),
  'class' => 'OpenglazeGlazesResource',
  'authentication_types' => TRUE,
);
