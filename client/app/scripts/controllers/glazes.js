'use strict';

/**
 * @ngdoc function
 * @name clientApp.controller:GlazesCtrl
 * @description
 * # GlazesCtrl
 * Controller of the clientApp
 */
angular.module('clientApp')
  .controller('GlazesCtrl', function ($scope, glazes, $stateParams, $log) {
    // Initialize values.
    $scope.glazes = glazes;
    $scope.selectedGlaze = null;

    /**
     * Set the selected Company.
     *
     * @param int id
     *   The company ID.
     */
    var setSelectedGlaze = function(id) {
      $scope.selectedGlaze = null;

      angular.forEach($scope.glazes, function(value) {
        if (value.id == id) {
          $scope.selectedGlaze = value;
        }
      });
    };

    if ($stateParams.id) {
      setSelectedGlaze($stateParams.id);
    }
  });
