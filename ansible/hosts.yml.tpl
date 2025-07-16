all:
  children:
    frontend:
      hosts:
        ${instance_ip}:
          ansible_connection: ssh
          ansible_user: ubuntu
          ansible_python_interpreter: python3

    backend:
      hosts:
        ${instance_ip}:
          ansible_connection: ssh
          ansible_user: ubuntu
          ansible_python_interpreter: python3

    database:
      hosts:
        localhost:
          ansible_host: ${rds_endpoint}
          ansible_connection: local
          ansible_become: false
    
    proxy:
      hosts:
        ${instance_ip}:
          ansible_connection: ssh
          ansible_user: ubuntu
          ansible_python_interpreter: python3

    keys:
      hosts:
        ${instance_ip}:
          ansible_connection: ssh
          ansible_user: ubuntu
          ansible_python_interpreter: python3
    
