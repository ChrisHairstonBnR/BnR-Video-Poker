/* Automation Studio generated header file */
/* Do not edit ! */
/* PseudoRNG 1.00.1 */

#ifndef _PSEUDORNG_
#define _PSEUDORNG_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _PseudoRNG_VERSION
#define _PseudoRNG_VERSION 1.00.1
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Constants */
#ifdef _REPLACE_CONST
 #define RAND_MAX 32797U
#else
 _GLOBAL_CONST unsigned short RAND_MAX;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct PRNG
{
	/* VAR_INPUT (analog) */
	unsigned short Multiplier;
	unsigned short Increment;
	unsigned long Seed;
	/* VAR_OUTPUT (analog) */
	unsigned long Result;
	/* VAR_INPUT (digital) */
	plcbit CMD_Generate;
	/* VAR (digital) */
	plcbit Initialized;
} PRNG_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void PRNG(struct PRNG* inst);


#ifdef __cplusplus
};
#endif
#endif /* _PSEUDORNG_ */

