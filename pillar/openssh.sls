sshd_config:
  Port: 22
  Protocol: 2
  HostKey:
    - /etc/ssh/ssh_host_rsa_key
    - /etc/ssh/ssh_host_dsa_key
    - /etc/ssh/ssh_host_ecdsa_key
    - /etc/ssh/ssh_host_ed25519_key
  UsePrivilegeSeparation: 'yes'
  KeyRegenerationInterval: 3600
  ServerKeyBits: 768
  SyslogFacility: AUTH
  LogLevel: INFO
  ClientAliveInterval: 0
  ClientAliveCountMax: 3
  LoginGraceTime: 120
  PermitRootLogin: 'yes'
  PasswordAuthentication: 'no'
  StrictModes: 'yes'
  MaxAuthTries: 6
  MaxSessions: 10
  RSAAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  AuthorizedKeysCommand: '/usr/bin/sss_ssh_authorizedkeys'
  AuthorizedKeysCommandUser: 'nobody'
  IgnoreRhosts: 'yes'
  RhostsRSAAuthentication: 'no'
  HostbasedAuthentication: 'no'
  PermitEmptyPasswords: 'no'
  ChallengeResponseAuthentication: 'no'
  AuthenticationMethods: 'publickey,keyboard-interactive'
  AuthorizedKeysFile: '%h/.ssh/authorized_keys'
  X11Forwarding: 'yes'
  X11DisplayOffset: 10
  PrintMotd: 'no'
  PrintLastLog: 'yes'
  TCPKeepAlive: 'yes'
  AcceptEnv: "LANG LC_*"
  Subsystem: "sftp /usr/lib/openssh/sftp-server"
  UsePAM: 'yes'
  UseDNS: 'yes'
  AllowUsers: 'ljk'
  matches:
    sftp_chroot:
      type:
        Group: sftpusers
      options:
        ChrootDirectory: /sftp-chroot/%u
        X11Forwarding: no
        AllowTcpForwarding: no
        ForceCommand: internal-sftp
  # Check `man sshd_config` for supported KexAlgorithms, Ciphers and MACs first.
  KexAlgorithms: 'diffie-hellman-group14-sha1,diffie-hellman-group1-sha1'
  Ciphers: 'aes128-ctr,aes256-ctr'
  MACs: 'hmac-sha1'

ssh_config:
  StrictHostKeyChecking: no
  ForwardAgent: no
  ForwardX11: no
  RhostsRSAAuthentication: no
  RSAAuthentication: yes
  PasswordAuthentication: yes
  HostbasedAuthentication: no
  GSSAPIAuthentication: no
  GSSAPIDelegateCredentials: no
  BatchMode: 'yes'
  CheckHostIP: 'yes'
  AddressFamily: 'any'
  ConnectTimeout: 0
  IdentityFile: '~/.ssh/id_rsa'
  Port: 22
  Protocol: 2
  Cipher: '3des'
  Tunnel: 'no'
  TunnelDevice: 'any:any'
  PermitLocalCommand: 'no'
  VisualHostKey: 'no'
