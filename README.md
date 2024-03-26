[![License](https://img.shields.io/github/license/impresscms-dev/test-impresscms-addon-action.svg)](LICENSE)
[![GitHub release](https://img.shields.io/github/release/impresscms-dev/test-impresscms-addon-action.svg)](https://github.com/impresscms-dev/test-impresscms-addon-action/releases)

# Test ImpressCMS AddOn Action

GitHub action to test [ImpressCMS](https://github.com/ImpressCMS/impresscms) addon (theme, module, translation).

Works only with ImpressCMS versions that are supported by [impresscms-dev/install-impresscms-action](https://github.com/marketplace/actions/install-impresscms).  Also supported database service (like MySQL) is needed to make this action usable.

## Usage

To use this action in your project, create workflow in your project similar to this code (Note: some parts and arguments
needs to be altered):

```yaml
name: Tests

on:
  push:

jobs:
  test:
    runs-on: ${{ matrix.os }}    
    strategy:
      max-parallel: 3
      matrix:
        os:
          - ubuntu-latest
        php:
          - 8.0
          - 8.1
          - 8.2
          - 8.3
        database:
          - mysql:5.6
          - mariadb:10.1
        impresscms_version:
          - dev-TNG
        composer_version:
          - 2

    services:
      mysql:
        image: ${{ matrix.database }}
        env:
          MYSQL_ROOT_PASSWORD: icms
          MYSQL_DATABASE: icms
        ports:
          - 3306
        options: --health-cmd="mysqladmin ping" --health-interval=10s --health-timeout=5s --health-retries=3

    name: Test - impresscms:${{ matrix.impresscms_version }}; php:${{ matrix.php }}; ${{ matrix.database }}; ${{ matrix.os }}; composer:${{ matrix.composer_version }};
    steps:
      - name: Checkouting project code...
        uses: actions/checkout@v2
          
      - name: Testing addon...
        uses: impresscms-dev/test-impresscms-addon-action@v0.1
        with:
          impresscms_version: ${{ matrix.impresscms_version }}
          php_version: ${{ matrix.php_version }}
          composer_version: ${{ matrix.composer_version }}
          database_type: pdo.mysql
          database_name: icms
          database_user: root
          database_password: icms
          database_port: ${{ job.services.mysql.ports['3306'] }}
          
```

## Arguments

This action supports such arguments (used in `with` keyword):

| Argument | Required | Default value                  | Description                                                                                     |
|----------|----------|--------------------------------|-------------------------------------------------------------------------------------------------|
| impresscms_version  | No       | dev-TNG             | ImpressCMS version tag to test addon with                                                       |
| addon_type  | No       |                                | If not specified, add on type will be autodetected. Possible values: module, theme, translation |
| php_version  | No       | 7.4                            | PHP version to use for tests                                                                    |
| composer_version  | No       | 2                              | Composer version to use for tests                                                               |
| post_max_size  | No       | 256M                              | Max POST size                                                                                   |
| extra_php_extensions  | No       |                               | If needed here can be listed some extra php extensions separated by comma                       |
| database_type | No       | pdo.mysql                      | Database type                                                                                   |
| database_name | No       | icms                           | Database name                                                                                   |
| database_host | No       | 127.0.0.1                      | Database host                                                                                   |
| database_user | Yes      |                                | Database user                                                                                   |
| database_password | No       |                                | Database password                                                                               |
| database_charset | No       | utf8                           | Charset used for database                                                                       |
| database_collation | No       | utf8_general_ci                | Collation used for database                                                                     |
| database_prefix | No       | *icms_{run_id}_{run_attemnpt}* | Prefix for each ImpressCMS database table                                                       |
| database_port | No       | 3306                           | Port that is used for database connection                                                       |
| addon_requirements_update | No | false | Set this to true to allow addon required other packages to be autoupdated on install |

## How to contribute?

If you want to add some functionality or fix bugs, you can fork, change and create pull request. If you not sure how
this works, try [interactive GitHub tutorial](https://skills.github.com).

If you found any bug or have some questions,
use [issues tab](https://github.com/impresscms-dev/test-impresscms-addon-action/issues) and write there your questions.
