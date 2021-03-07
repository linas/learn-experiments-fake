#! /bin/bash
#
# cut-n-paste this
# --show-leak-kinds=all


valgrind --leak-check=full \
	--suppressions=valgrind.guile.suppressions      \
        --suppressions=valgrind.boost.suppressions      \
        --suppressions=valgrind.logger.suppressions     \
        --suppressions=valgrind.link-grammar.suppressions  \
guile
