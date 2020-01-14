@Library('libpipelines@master') _

hose {
    EMAIL = 'qa'
    DEVTIMEOUT = 20
    RELEASETIMEOUT = 20
    MODULE = 'marathon-lb'
    REPOSITORY = 'marathon-lb-sec'
    PKGMODULESNAMES = ['marathon-lb-sec']
    QA_ISSUE_PROJECT = 'EOS'
    BUILDTOOL = 'make'
    NEW_VERSIONING = true
    GENERATE_QA_ISSUE = true
    INSTALLTIMEOUT = 120

    ANCHORE_TEST = 'true'

    INSTALLSERVICES = [
        ['DCOSCLIHETZNER':  ['image': 'stratio/dcos-cli:0.4.15-SNAPSHOT',
                             'volumes': [
                                   '\$PEM_FILE_DIR:/tmp'
                             ],
                             'env': ['DCOS_IP=\$DCOS_IP',
                                      'SSL=true',
                                      'SSH=true',
                                      'TOKEN_AUTHENTICATION=true',
                                      'DCOS_USER=\$DCOS_USER',
                                      'DCOS_PASSWORD=\$DCOS_PASSWORD',
                                      'CLI_BOOTSTRAP_USER=\$CLI_BOOTSTRAP_USER',
                                      'PEM_PATH=/tmp/\${CLI_BOOTSTRAP_USER}_rsa'                                      
                             ],
                             'sleep':  120,
                             'healthcheck': 5000
                            ]
        ],
        ['DCOSCLIVMWARE':   ['image': 'stratio/dcos-cli:0.4.15-SNAPSHOT',
                             'volumes': ['stratio/paasintegrationpem:0.1.0'],
                             'env':  ['DCOS_IP=\$DCOS_IP',
                                      'SSL=true',
                                      'SSH=true',
                                      'TOKEN_AUTHENTICATION=true',
                                      'DCOS_USER=\$DCOS_USER',
                                      'DCOS_PASSWORD=\$DCOS_PASSWORD',
                                      'CLI_BOOTSTRAP_USER=\$CLI_BOOTSTRAP_USER',
                                      'PEM_PATH=/paascerts/PaasIntegration.pem'
                             ],
                             'sleep':  120,
                             'healthcheck': 5000
                            ]
        ]
    ]

    ATCREDENTIALS = [[TYPE:'sshKey', ID:'PEM_VMWARE']]

    INSTALLPARAMETERS = """
                    | -DREMOTE_USER=\$PEM_VMWARE_USER
                    | -DEOS_VAULT_PORT=8200
                    | """.stripMargin().stripIndent()
                    
    DEV = { config ->
        doDocker(config)
    }

    INSTALL = { config, params ->
      def ENVIRONMENTMAP = stringToMap(params.ENVIRONMENT)

      def pempathhetzner = ""
      pempathhetzner = """${params.ENVIRONMENT}
          |PEM_FILE_PATH=\$PEM_VMWARE_PATH
          |DCOS_CLI_HOST=%%DCOSCLIHETZNER#0
          |""".stripMargin().stripIndent()

      def PATHHETZNER = stringToMap(pempathhetzner)
      def PATHHETZNERINSTALL = doReplaceTokens(INSTALLPARAMETERS.replaceAll(/\n/, ''), PATHHETZNER)

      def pempathvmware = ""
      pempathvmware = """${params.ENVIRONMENT}
          |PEM_FILE_PATH=\$PEM_VMWARE_KEY
          |DCOS_CLI_HOST=%%DCOSCLIVMWARE#0
          |""".stripMargin().stripIndent()

      def PATHVMWARE = stringToMap(pempathvmware)
      def PATHVMWAREINSTALL = doReplaceTokens(INSTALLPARAMETERS.replaceAll(/\n/, ' '), PATHVMWARE) 


      if (config.INSTALLPARAMETERS.contains('GROUPS_MARATHONLB')) {
        if (params.ENVIRONMENT.contains('HETZNER_CLUSTER')) {
          PATHHETZNERINSTALL = "${PATHHETZNERINSTALL}".replaceAll('-DGROUPS_MARATHONLB', '-Dgroups')
          doAT(conf: config, parameters: PATHHETZNERINSTALL, environmentAuth: ENVIRONMENTMAP['HETZNER_CLUSTER'])
        } else {
          PATHVMWAREINSTALL = "${PATHVMWAREINSTALL}".replaceAll('-DGROUPS_MARATHONLB', '-Dgroups')
          doAT(conf: config, parameters: PATHVMWAREINSTALL)
        }
      } else {
        if (params.ENVIRONMENT.contains('HETZNER_CLUSTER')) {
          doAT(conf: config, groups: ['nightly'], parameters: PATHHETZNERINSTALL, environmentAuth: ENVIRONMENTMAP['HETZNER_CLUSTER'])
        } else {
          doAT(conf: config, groups: ['nightly'], parameters: PATHVMWAREINSTALL)
        }
      }

    }

}
