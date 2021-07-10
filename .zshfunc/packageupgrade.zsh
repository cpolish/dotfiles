function packageupgrade() {
	macupdater scan --quiet;
	killall MacUpdater;
	macupdater update /Applications/Firefox.app --quiet;
	macupdater update /Applications/Visual\ Studio\ Code.app --quiet;
	sudo port selfupdate;
	sudo port upgrade outdated;
	sudo softwareupdate -i -a;
}
