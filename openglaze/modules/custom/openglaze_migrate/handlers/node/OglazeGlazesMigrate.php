<?php

/**
 * @file
 * Contains \OglazeGlazesMigrate.
 */

class OglazeGlazesMigrate extends \OpenglazeMigrateBase {

  public $entityType = 'node';
  public $bundle = 'glaze';

  public $dependencies = array(
    'OglazeGlazeIngredinetsMigrate',
  );

  public $fields = array(
    '_language',
    '_temperature',
    '_ingredients',
  );

  public function __construct() {
    parent::__construct();

    $this->addFieldMapping('language', '_language');
    $this->addFieldMapping('field_temperature', '_temperature');
    $this->addFieldMapping('field_temperature:create_term')
      ->defaultValue(TRUE);
    $this->addFieldMapping('field_ingredients', '_ingredients')
      ->separator('|')
      ->sourceMigration('OglazeGlazeIngredinetsMigrate');
  }
}
