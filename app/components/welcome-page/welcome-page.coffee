module.exports = 
  url: '/'
  template: require('./welcome-page.html')
  controller: ($scope, $auth, $location, Records, $rootScope) ->

    $rootScope.$on 'auth:validation-success', (event, user) ->
      $location.path('groups/1')

    $scope.login = (formData) ->
      $scope.formError = ""
      $auth.submitLogin(
        email: formData.email
        password: formData.password
      ).then (user) ->
        $location.path('/groups/1')

    # TODO: how to put inside .fail callback above?
    $scope.$on 'auth:login-error', () ->
      $scope.formError = "Invalid Credentials"

    return