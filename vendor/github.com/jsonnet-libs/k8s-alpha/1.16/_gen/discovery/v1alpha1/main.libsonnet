{
  local d = (import 'doc-util/main.libsonnet'),
  '#':: d.pkg(name='v1alpha1', url='', help=''),
  endpoint: (import 'endpoint.libsonnet'),
  endpointConditions: (import 'endpointConditions.libsonnet'),
  endpointPort: (import 'endpointPort.libsonnet'),
  endpointSlice: (import 'endpointSlice.libsonnet'),
}