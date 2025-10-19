output "sapbtp" {
 sensitive = true
 value = module.mt_context.sapbtp
}

output "faas-app-xp264-049-saas" {
  value = module.mt_context.faas-app-xp264-049-saas
}

output "faas_xp264_mt_subscription_url" {
  value = nonsensitive(module.mt_context.faas_xp264_mt.subscription_url)
}