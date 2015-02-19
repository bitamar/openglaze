#!/bin/sh

# Define the root of the GIT repository.
cd ${0%/*}
ROOT=$(pwd)
cd $ROOT

# Load the colors.
source $ROOT/scripts/helper-colors.sh

# Load the helpers.
source $ROOT/scripts/helper-functions.sh

convert_csv_to_sql