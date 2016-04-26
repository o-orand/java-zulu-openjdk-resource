# Azul Zulu JDK Resource

Tracks update made to [Azul Zulu Open JDK 8 Releases](http://www.azul.com/downloads/zulu/). This resource parse http://www.azul.com/downloads/zulu/zulu-linux/ to get
 Open Jdk binairies. It's a linux x64 version.

    Zulu® is a certified build of OpenJDK that is fully compliant with the Java SE standard. Zulu® is 100% open source and freely downloadable. Now Java developers, system administrators and end users can enjoy the full benefits of open source Java with deployment flexibility and control over upgrade timing. Zulu® Enterprise adds the comfort of world-class, subscription-based support provided by Azul Systems, the only company 100% dedicated to Java and the Java Virtual Machine (JVM). Zulu® Embedded is available for OEMs and device manufacturers.


## Deploying to Concourse

In your bosh deployment manifest, add to the `groundcrew.additional_resource_types` with the following:

```yaml
- image: docker:///orangeopensource/zulu-openjdk-resource
  type: zulu-openjdk-resource
```

or directly

```yaml
resource_types:
- name: zulu-openjdk-resource
  type: docker-image
  source:
    repository: orangeopensource/zulu-openjdk-resource
```

## Source Configuration
Default value *bold*
* `platform`: *Optional.* target execution platform. Value [*.zip*, RPM,.DEB]

* `fallback_url`: *Optional* Fallback url use to download binaries. Sometime no version is available for download. *Default: ""*

    Exemple:


## Behavior

### `check`: Check for new version of openjdk

Detects new versions of Zulu Open JDK that have been published to [Azul Zulu Open JDK 8 Releases](http://www.azul.com/downloads/zulu/).

### `in`: Clone the repository, at the given pull request ref

Fetches a given release, placing the following in the destination:

* `version`: The version number of the release.
* `url`: A URL that can be used to download the release tarball.
* `zulu-openjdk.tar.gz`: The Zulu OpenJdk tarball, if the `tarball` param is `true`.

#### Parameters

* `tarball`: *Optional.* Default `true`. Fetch the release tarball.
* `output_name` : *Optional.* Default `zulu-openjdk.tar.gz`. Set a custom name for Open Jdk tarball.


## Example pipeline

Have a look at [our pipeline](ci/pipeline.yml).


## Tests

Tests can be run two ways, for local feedback and to see how it will run on the resource container.

1. Local

```sh
 TODO
```
2. Container, requires requires `docker`

```sh
TODO
```
Reminder: details proxy usage


