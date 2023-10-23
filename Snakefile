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

# # 操作 docker 可以通过该函数 + 容器ID 进入该 container
# rundocker() {
#     if [ -z "$1" ]; then
#         dockerid=$(kubectl get pods -n k8s-dna|awk '{if($3=="Running"){print$1}}'|tail -n 1)
#     else
#         dockerid=$1
#     fi
#     kubectl exec -it ${dockerid} -n k8s-dna sh;
# }

# 2023-10-23-14-00-zfxsdcjdrw-hhajb-5kpdv                       0/1     Completed   0          7m57s
# 2023-10-23-14-02-zfxsdcjdrw-eigedhf-95cwj                     1/1     Running     0          5m48s
# 例如 rundocker 2023-10-23-14-02-zfxsdcjdrw-eigedhf-95cwj