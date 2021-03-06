version 1.0
# Copyright Sequencing Analysis Support Core - Leiden University Medical Center 2017

# Bioconda installs

task installPrefix {
    input {
        Array[String] requirements
        String prefix
        String condaPath = "conda"
    }

    command <<<
        ~{condaPath} create \
        --json -q \
        --yes \
        --override-channels \
        --channel bioconda \
        --channel conda-forge \
        --channel defaults \
        --channel r \
        --prefix ${prefix} \
        ~{sep=' ' requirements}
    >>>

    output {
        File condaEnvPath=prefix
        File condaJson=stdout()
    }
 }
