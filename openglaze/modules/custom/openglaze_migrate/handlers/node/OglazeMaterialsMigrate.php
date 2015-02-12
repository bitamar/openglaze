<?php

/**
 * @file
 * Contains \OglazeMaterialsMigrate.
 */

class OglazeMaterialsMigrate extends \OpenglazeMigrateBase {

  public $entityType = 'node';
  public $bundle = 'material';

  public $fields = array(
    '_language',
    '_aka',
    '_wiki_url',
    '_image',
  );

  public function __construct() {
    parent::__construct();

    $this->addFieldMapping('field_images', '_image');
    $this->addFieldMapping('field_images:file_replace')->defaultValue(FILE_EXISTS_REPLACE);
    $this->addFieldMapping('field_images:source_dir')->defaultValue($this->getMigrateDirectory() . '/images/material/');

    $this->addFieldMapping('field_aka', '_aka');
    $this->addFieldMapping('field_wikipedia_article', '_wiki_url');
  }
}
