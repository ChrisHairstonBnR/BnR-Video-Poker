/* Automation Studio generated header file */
/* Do not edit ! */
/* Cards  */

#ifndef _CARDS_
#define _CARDS_
#ifdef __cplusplus
extern "C" 
{
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
typedef enum Faces_enum
{	CARD_TWO,
	CARD_THREE,
	CARD_FOUR,
	CARD_FIVE,
	CARD_SIX,
	CARD_SEVEN,
	CARD_EIGHT,
	CARD_NINE,
	CARD_TEN,
	CARD_JACK,
	CARD_QUEEN,
	CARD_KING,
	CARD_ACE
} Faces_enum;

typedef enum Suits_enum
{	SUIT_HEARTS,
	SUIT_CLUBS,
	SUIT_DIAMONDS,
	SUIT_SPADES
} Suits_enum;

typedef enum DeckState
{	DECKSTATE_INIT,
	DECKSTATE_IDLE,
	DECKSTATE_SHUFFLE,
	DECKSTATE_ERROR
} DeckState;

typedef struct Card_typ
{	enum Faces_enum Face;
	enum Suits_enum Suit;
} Card_typ;

typedef struct CardFB
{
	/* VAR_OUTPUT (analog) */
	struct Card_typ Deck[52];
	/* VAR (analog) */
	unsigned char IndexI;
	unsigned char IndexJ;
	unsigned char IndexR;
	unsigned char ShuffleCount;
	unsigned char FaceIndex;
	unsigned char SuitIndex;
	enum DeckState State;
	struct PRNG Randy;
	/* VAR_INPUT (digital) */
	plcbit CMD_Shuffle;
	plcbit Enable;
	/* VAR (digital) */
	plcbit CommandDone;
	plcbit Initialized;
} CardFB_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CardFB(struct CardFB* inst);
_BUR_PUBLIC plcbit SwapCard(struct Card_typ (*Deck)[52], unsigned char CardIndexA, unsigned char CardIndexB);


#ifdef __cplusplus
};
#endif
#endif /* _CARDS_ */

