#ifndef SLINK_H
#define SLINK_H

#include "common.h"
#include "options.h"

enum SLINK_exit_code {
    SLINK_EXIT_SUCCESS,
    SLINK_EXIT_FAILURE,
    SLINK_EXIT_DISCONNECTED,
};

enum SLINK_exit_code
SLINK(struct SLINK_options *options);

#endif
