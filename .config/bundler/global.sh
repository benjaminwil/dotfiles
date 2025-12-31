export BUNDLE_DISABLE_LOCAL_BRANCH_CHECK=true
export BUNDLE_PATH=vendor/bundle
export BUNDLE_DISABLE_SHARED_GEMS=1
export BUNDLE_JOBS=$(getconf _NPROCESSORS_ONLN 2>/dev/null || nproc --all 2>/dev/null || grep -c ^processor /proc/cpuinfo)
