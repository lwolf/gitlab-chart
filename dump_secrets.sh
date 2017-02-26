#!/usr/bin/env bash

NAMESPACE=${1}

echo "GITLAB_ROOT_PASSWORD: $(kubectl get secret --namespace gitlab ${NAMESPACE}-gitlab -o jsonpath="{.data.GITLAB_ROOT_PASSWORD}" | base64 --decode)"
echo "GITLAB_SECRETS_DB_KEY_BASE: $(kubectl get secret --namespace gitlab ${NAMESPACE}-gitlab -o jsonpath="{.data.GITLAB_SECRETS_DB_KEY_BASE}" | base64 --decode)"
echo "GITLAB_SECRETS_SECRET_KEY_BASE: $(kubectl get secret --namespace gitlab ${NAMESPACE}-gitlab -o jsonpath="{.data.GITLAB_SECRETS_SECRET_KEY_BASE}" | base64 --decode)"
echo "GITLAB_SECRETS_OTP_KEY_BASE: $(kubectl get secret --namespace gitlab ${NAMESPACE}-gitlab -o jsonpath="{.data.GITLAB_SECRETS_OTP_KEY_BASE}" | base64 --decode)"