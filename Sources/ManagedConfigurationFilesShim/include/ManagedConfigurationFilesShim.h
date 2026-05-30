#ifndef ManagedConfigurationFilesShim_h
#define ManagedConfigurationFilesShim_h

#include <stddef.h>

size_t managed_configuration_service_path_for_service_type(const char *service_type,
                                                           char *service_path,
                                                           size_t service_path_size);

#endif /* ManagedConfigurationFilesShim_h */
