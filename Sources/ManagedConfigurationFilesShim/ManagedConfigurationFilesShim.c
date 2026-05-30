#include "ManagedConfigurationFilesShim.h"

#include <errno.h>
#include <libmanagedconfigurationfiles.h>

size_t
managed_configuration_service_path_for_service_type(const char *service_type,
                                                    char *service_path,
                                                    size_t service_path_size)
{
    if (service_type == NULL || service_path == NULL || service_path_size == 0) {
        errno = EINVAL;
        return 0;
    }

    service_path[0] = '\0';

    return mcf_service_path_for_service_type(service_type,
                                             service_path,
                                             service_path_size);
}
