auditd:
  service:
    enabled: true
    log_file: /var/log/audit/audit.log
    log_format: RAW
    log_group: root
    priority_boost: 4
    flush: INCREMENTAL
    freq: 20
    num_logs: 5
    disp_qos: lossy
    dispatcher: /sbin/audispd
    name_format: NONE
    max_log_file: 6
    max_log_file_action: ROTATE
    space_left: 75
    space_left_action: SYSLOG
    action_mail_acct: root
    admin_space_left: 50
    admin_space_left_action: SUSPEND
    disk_full_action: SUSPEND
    disk_error_action: SUSPEND
    tcp_listen_queue: 5
    tcp_max_per_addr: 1
    tcp_client_max_idle: 0
    enable_krb5: no
  rules:
    options:
      enabled: 0
      bufzise: 4096
    rules:
      1:
        key: host_conf
        enabled: true
        rule_list:
          - '-w /etc/host.conf -p wa'
