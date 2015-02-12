<?php
/**
 * @file
 * Openglaze profile.
 */

/**
 * Implements hook_form_FORM_ID_alter().
 *
 * Allows the profile to alter the site configuration form.
 */
function openglaze_form_install_configure_form_alter(&$form, $form_state) {
  // Pre-populate the site name with the server name.
  $form['site_information']['site_name']['#default_value'] = $_SERVER['SERVER_NAME'];
}

/**
 * Implements hook_install_tasks().
 */
function openglaze_install_tasks() {
  $tasks = array();

  $tasks['openglaze_setup_variables'] = array(
    'display_name' => st('Set Variables'),
    'display' => FALSE,
  );

  $tasks['openglaze_setup_og_permissions'] = array(
    'display_name' => st('Set Blocks'),
    'display' => FALSE,
  );

  // Run this as the last task!
  $tasks['openglaze_setup_rebuild_permissions'] = array(
    'display_name' => st('Rebuild permissions'),
    'display' => FALSE,
  );

  return $tasks;
}

/**
 * Task callback; Set variables.
 */
function openglaze_setup_variables() {
  $variables = array(
    // Features default export path.
    'features_default_export_path' => 'profiles/openglaze/modules/custom',
    // Mime-mail.
    'mimemail_format' => 'full_html',
    'mimemail_sitestyle' => FALSE,
    'mimemail_name' => 'Openglaze',
    'mimemail_mail' => 'info@openglaze.com',
    // jQuery versions.
    'jquery_update_jquery_version' => '1.10',
    'jquery_update_jquery_admin_version' => '1.5',
    // Enable restful files upload.
    'restful_file_upload' => 1,
    // Private files directory.
    'file_private_path' => 'sites/default/files/private',
    'file_default_scheme' => 'private',
    // Appearance settings.
    'theme_bartik_settings' => array(
      'toggle_logo' => FALSE,
      'toggle_name' => TRUE,
      'toggle_slogan' => TRUE,
      'toggle_node_user_picture' => TRUE,
      'toggle_comment_user_picture' => TRUE,
      'toggle_comment_user_verification' => TRUE,
      'toggle_favicon' => TRUE,
      'toggle_main_menu' => TRUE,
      'toggle_secondary_menu' => TRUE,
      'default_logo' => FALSE,
      'logo_path' => NULL,
      'logo_upload' => NULL,
      'default_favicon' => FALSE,
      'favicon_path' => NULL,
      'favicon_upload' => NULL,
    ),
  );

  foreach ($variables as $key => $value) {
    variable_set($key, $value);
  }
}

/**
 * Task callback; Setup OG permissions.
 *
 * We do this here, late enough to make sure all group-content were
 * created.
 */
function openglaze_setup_og_permissions() {
  $og_roles = og_roles('node', 'company');
  $rid = array_search(OG_AUTHENTICATED_ROLE, $og_roles);

  $permissions = array();
  $types = array(
    'item',
    'item_variant',
    'material',
    'season',
  );
  foreach ($types as $type) {
    $permissions["create $type content"] = TRUE;
    $permissions["update own $type content"] = TRUE;
    $permissions["update any $type content"] = TRUE;
  }
  og_role_change_permissions($rid, $permissions);
}

/**
 * Task callback; Setup blocks.
 */
function openglaze_setup_blocks() {
  $default_theme = variable_get('theme_default', 'bartik');

  $blocks = array(
    array(
      'module' => 'system',
      'delta' => 'user-menu',
      'theme' => $default_theme,
      'status' => 1,
      'weight' => 0,
      'region' => 'header',
      'pages' => '',
      'title' => '<none>',
      'cache' => DRUPAL_NO_CACHE,
    ),
  );

  drupal_static_reset();
  _block_rehash($default_theme);
  foreach ($blocks as $record) {
    $module = array_shift($record);
    $delta = array_shift($record);
    $theme = array_shift($record);
    db_update('block')
      ->fields($record)
      ->condition('module', $module)
      ->condition('delta', $delta)
      ->condition('theme', $theme)
      ->execute();
  }
}

/**
 * Task callback; Rebuild permissions (node access).
 *
 * Setting up the platform triggers the need to rebuild the permissions.
 * We do this here so no manual rebuild is necessary when we finished the
 * installation.
 */
function openglaze_setup_rebuild_permissions() {
  node_access_rebuild();
}
