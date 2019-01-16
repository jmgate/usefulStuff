#!/bin/bash
TRILINOS_DIR=/build/Packages/EM-Plasma/Trilinos
SYNC_SCRIPTS_DIR=/build/Packages/Trilinos/BuildScripts/trilinos_sync
cd ${TRILINOS_DIR} && \
env \
  RUN_CMND_EMAIL_RESULT_OUTFILE=sync-from-trilinos-develop.out \
  RUN_CMND_EMAIL_RESULT_SUMMARYLINE="Sync trilinos/develop to em-plasma/develop" \
  RUN_CMND_EMAIL_RESULT_EMAIL=jmgate@sandia.gov \
${SYNC_SCRIPTS_DIR}/run-cmnd-email-result.sh \
  ${SYNC_SCRIPTS_DIR}/sync-from-trilinos-develop.sh
