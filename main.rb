require "colorize"
puts "welcome to the dns changer linux".colorize(:green)
while(true)  
  print "EnterCommand (0 for help and 00 for exit) => "
  command = gets().chop()
  if command == "00"
    puts "by. thanks for use".colorize(:yellow)
    break
  elsif command == "0"
    puts '''
                FamaStudio
      
    '''.center(10).colorize(:green)
    puts '''
      00 -- exit 
      shecanDns -- change dns to shecan 
      customdns -- set custom dns 
      reset -- reset network 
      chattr -- lock dns file
      uchatter -- break lock dns file
    '''.center(0).colorize(:yellow)
  elsif command == "shecanDns"
    puts "starting shecan dns".colorize(:green)
    file = File.open("/etc/resolv.conf","w")
    file.write("nameserver 178.22.122.100 \nnameserver 185.51.200.2")
    file.close()
  elsif command == "reset"
    puts "reset dns".colorize(:green)
    puts "warning rest dns if you not use chattr".colorize(:yellow)
    system "systemctl restart NetworkManager" 
  elsif command == "chattr"
    puts "chattr dns file".colorize(:green)
    system "chattr +i /etc/resolv.conf"
  elsif command == "uchattr"
    puts "unChattr dns file".colorize(:green)
    system "chattr -i /etc/resolv.conf"
  elsif command == "customdns"
    print "enter ip one => "
    dns1 = gets().chomp()
    print "enter ip two => "
    dns2 = gets().chomp()
    file = File.open("/etc/resolv.conf","w")
    file.write("nameserver #{dns1} \nnameserver #{dns2}")
    file.close()
    puts "change dns".colorize(:green)
  else
    puts "error".colorize(:red)
  end

end
