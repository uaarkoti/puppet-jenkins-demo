class profile::jenkins::master (
  $test_module_name = 'basic_module_tests'
){
  include ::profile::jenkins

  class { '::jenkins':
    plugin_hash => {
      swarm                 => {},
      greenballs           => {},
      git                   => {},
      git-client            => {},
      scm-api               => {},
      build-pipeline-plugin => {},
      parameterized-trigger => {},
      jquery                => {},
    },
  }

  profile::jenkins::module_jobs { "${test_module_name}":
    require => Class[ '::jenkins' ],
  }
}
