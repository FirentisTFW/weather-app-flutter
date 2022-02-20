.DEFAULT_GOAL := help

build_android_dev: ## Builds dev apk
	fvm flutter build apk --flavor dev --release --target lib/main_dev.dart

build_android_prod: ## Builds prod apk
	fvm flutter build apk --flavor prod --release --target lib/main_prod.dart

models: ## Runs build runner command
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs

clean: ## Cleans flutter directories
	fvm flutter clean

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'