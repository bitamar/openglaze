<?php

/**
 * @file
 * Contains OpenglazeGlazesResource.
 */
class OpenglazeGlazesResource extends \OpenglazeEntityBaseNode {
  /**
   * Overrides \RestfulEntityBaseNode::publicFieldsInfo().
   */
  public function publicFieldsInfo() {
    $public_fields = parent::publicFieldsInfo();

    $public_fields['ingredients'] = array(
      'property' => 'field_ingredients',
      'process_callbacks' => array(
        array($this, 'processIngredient'),
      ),
    );

    return $public_fields;
  }

  /**
   * Process callback; Clean the ingredient nodes.
   */
  protected function processIngredient($ingredient_nodes) {
    $ingredients = array();
    foreach ($ingredient_nodes as $node) {
      $wrapper = entity_metadata_wrapper('node', $node);
      $material_wrapper = $wrapper->field_material;

      $ingredients[] = array(
        'material' => array(
          'id' => $material_wrapper->getIdentifier(),
          'label' => $material_wrapper->label(),
          'aka' => $material_wrapper->field_aka->value()[0],
        ),
        'amount' => $wrapper->field_amount->value(),
      );
    }

    return $ingredients;
  }
}
