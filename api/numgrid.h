#ifndef NUMGRID_H_INCLUDED
#define NUMGRID_H_INCLUDED

#ifndef NUMGRID_API
#include "numgrid_export.h"
#define NUMGRID_API numgrid_EXPORT
#endif

#ifdef __cplusplus
extern "C" {
#endif

struct context_s;
typedef struct context_s context_t;

/* get version */
NUMGRID_API
char *numgrid_get_version();

/* create a new context */
NUMGRID_API
context_t *numgrid_new_context();

/* create a new atom grid */
NUMGRID_API
context_t *numgrid_new_atom_grid(const double radial_precision,
                                 const int min_num_angular_points,
                                 const int max_num_angular_points,
                                 const int proton_charge,
                                 const int num_shells,
                                 const int shell_l_quantum_numbers[],
                                 const int shell_num_primitives[],
                                 const double primitive_exponents[]);

/* get number of grid points on current atom */
NUMGRID_API
int numgrid_get_num_grid_points(const context_t *context);

/* get grid on current atom, scaled by becke partitioning */
NUMGRID_API
void numgrid_get_grid_points(const context_t *context,
                             const int num_centers,
                             const int center_index,
                             const double x_coordinates_au[],
                             const double y_coordinates_au[],
                             const double z_coordinates_au[],
                             const int proton_charges[],
                             double grid_x_au[],
                             double grid_y_au[],
                             double grid_z_au[],
                             double grid_w[]);

/* destroy the atom and deallocate all data */
NUMGRID_API
void numgrid_free_atom_grid(context_t *context);

/* destroy the context and deallocates all data */
NUMGRID_API
void numgrid_free_context(context_t *context);

/* generate grid and hold it in memory for the lifetime of the context */
NUMGRID_API
int numgrid_generate_grid(context_t *context,
                          const double radial_precision,
                          const int min_num_angular_points,
                          const int max_num_angular_points,
                          const int num_centers,
                          const double center_coordinates[],
                          const int center_elements[],
                          const int num_outer_centers,
                          const double outer_center_coordinates[],
                          const int outer_center_elements[],
                          const int num_shells,
                          const int shell_centers[],
                          const int shell_l_quantum_numbers[],
                          const int shell_num_primitives[],
                          const double primitive_exponents[]);

/* get number of grid points */
NUMGRID_API
int numgrid_get_num_points(const context_t *context);

/* get the pointer to the memory which holds the grid */
NUMGRID_API
const double *const numgrid_get_grid(const context_t *context);

#ifdef __cplusplus
}
#endif

#endif /* NUMGRID_H_INCLUDED */
