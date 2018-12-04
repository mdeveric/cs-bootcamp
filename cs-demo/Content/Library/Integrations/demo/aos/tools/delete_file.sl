namespace: Integrations.demo.aos.tools
flow:
  name: delete_file
  inputs:
    - host: 10.0.46.39
    - username: root
    - password: admin@123
    - filename: install_java.sh
  workflow:
    - delete_file:
        do:
          io.cloudslang.base.ssh.ssh_command:
            - host: '${host}'
            - command: "${'cd '+get_sp('script_location')+' && rm -f '+filename}"
            - username: '${username}'
            - password:
                value: '${password}'
                sensitive: true
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      delete_file:
        x: 278
        y: 250
        navigate:
          c8e189b2-81f7-e768-633e-7113e8b97d45:
            targetId: 122c9b53-88e8-e252-6820-10f831c1111b
            port: SUCCESS
    results:
      SUCCESS:
        122c9b53-88e8-e252-6820-10f831c1111b:
          x: 454
          y: 260
