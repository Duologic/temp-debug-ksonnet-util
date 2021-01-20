(import 'ksonnet-util/kausal.libsonnet')
{
  core+: {
    v1+: {
      // Extend service
      service+: {
        new(name, selector={}, ports=[])::
          super.new(name, selector, ports)
          + {
            dns: std.trace('a', '%s.%s.svc.cluster.local' % [self.metadata.name, $._config.namespace]),
          },
      },
    },
  },
}
+
{
  _config+:: {
    namespace: 'test',
  },

  account:
    $.core.v1.serviceAccount.new('a'),

  sts:
    $.apps.v1.statefulSet.new('name', 1, [], volumeClaims=[], podLabels={})
    + $.util.antiAffinity,

  svc: $.util.serviceFor(
    self.sts,
  ),
}
