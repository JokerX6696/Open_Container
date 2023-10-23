rule open_container:
    input:
        container_open = "container.open"
    output:
        closed_file = "container.closed"
    log:
        o = "logs/open_container/open_container.log.o",
        e = "logs/open_container/open_container.log.e"
    benchmark:
        "benchmarks/map2b/map2b.txt"
    params:
        enzyme_site = 5,
        database = 'GTDB',
        host = ''
    shell:
        """
        sleep 600
        touch {output.closed_file}
        """
