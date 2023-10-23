rule open_container:
    input:
        container_open = "container.open"
    output:
        closed_file = "container.closed"
    log:
        e = "logs/open_container.log.e"
    benchmark:
        "benchmarks/map2b/map2b.txt"
    params:
        enzyme_site = 5,
        database = 'GTDB',
        host = ''
    shell:
        """
        sleep 600  # 这里可以手动修改需要镜像停留的时间，防止跑一半镜像关闭
        echo '如果要重新开启镜像，请删除本文件' > {output.closed_file} 2>{log.e}
        """
