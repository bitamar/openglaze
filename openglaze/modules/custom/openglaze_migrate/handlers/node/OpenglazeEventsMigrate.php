<?php

/**
 * @file
 * Contains \OpenglazeEventsMigrate.
 */

class OpenglazeEventsMigrate extends \OpenglazeMigrateBase {

  public $entityType = 'node';
  public $bundle = 'event';

  public $fields = array(
    '_location',
    '_company',
    '_author',
  );

  public $dependencies = array(
    'OpenglazeCompaniesMigrate',
    'OpenglazeUsersMigrate',
  );


  public function __construct() {
    parent::__construct();


    $this
      ->addFieldMapping(OG_AUDIENCE_FIELD, '_company')
      ->sourceMigration('OpenglazeCompaniesMigrate');

    $this
      ->addFieldMapping('uid', '_author')
      ->sourceMigration('OpenglazeUsersMigrate');
  }

  /**
   * Map location field.
   *
   * @todo: Move to value callback.
   */
  public function prepare($entity, $row) {
    list($lat, $lng) = explode('|', $row->_location);
    $wrapper = entity_metadata_wrapper('node', $entity);
    $values = array(
      'lat' => $lat,
      'lng' => $lng,
    );
    $wrapper->field_location->set($values);
  }
}
