<?php
/**
 * @file
 * oglaze_material.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function oglaze_material_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_views_api().
 */
function oglaze_material_views_api($module = NULL, $api = NULL) {
  return array("api" => "3.0");
}

/**
 * Implements hook_node_info().
 */
function oglaze_material_node_info() {
  $items = array(
    'material' => array(
      'name' => t('Material'),
      'base' => 'node_content',
      'description' => '',
      'has_title' => '1',
      'title_label' => t('Name'),
      'help' => '',
    ),
  );
  drupal_alter('node_info', $items);
  return $items;
}
