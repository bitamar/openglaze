<?php

/**
 * @file
 * Contains \OglazeGlazeIngredinetsMigrate.
 */

class OglazeGlazeIngredinetsMigrate extends \OpenglazeMigrateBase {

  public $entityType = 'node';
  public $bundle = 'glaze_ingredient';

  public $fields = array(
    '_material_id',
    '_amount',
  );

  public function __construct() {
    parent::__construct();

    $this->addFieldMapping('field_material', '_material_id');
    $this->addFieldMapping('field_amount', '_amount');
  }
}
