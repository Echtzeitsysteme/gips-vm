token = ENV["GITHUB_TOKEN"]

Vagrant.configure("2") do |config|
    config.vm.box = "gusztavvargadr/ubuntu-desktop-2004-lts-xfce"
    config.vm.define 'emoflon'
    config.vm.provider :virtualbox do |vb|
        vb.name = "gips"
        vb.memory = 8192
        vb.cpus = 2
    end
    config.vm.provision "shell", path: "prov.sh", env: {"GITHUB_TOKEN" => token}, privileged: false

    # Prevent SharedFoldersEnableSymlinksCreate errors
    config.vm.synced_folder ".", "/vagrant", disabled: true
end
