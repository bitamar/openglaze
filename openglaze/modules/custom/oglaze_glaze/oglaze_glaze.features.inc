<?php
/**
 * @file
 * oglaze_glaze.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function oglaze_glaze_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}

/**
 * Implements hook_node_info().
 */
function oglaze_glaze_node_info() {
  $items = array(
    'glaze' => array(
      'name' => t('Glaze'),
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
