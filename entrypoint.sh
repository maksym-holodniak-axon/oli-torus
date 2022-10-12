#!/bin/bash

bin/oli eval "Oli.ReleaseTasks.migrate_and_seed"

exec $@