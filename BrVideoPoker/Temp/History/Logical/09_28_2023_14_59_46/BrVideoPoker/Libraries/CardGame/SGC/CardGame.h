/* Automation Studio generated header file */
/* Do not edit ! */
/* CardGame  */

#ifndef _CARDGAME_
#define _CARDGAME_
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
{	CARD_ACE,
	CARD_TWO,
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
	CARD_KING
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

typedef struct CardDeck
{
	/* VAR_OUTPUT (analog) */
	struct Card_typ Cards[52];
	/* VAR (analog) */
	struct PRNG Randy;
	unsigned char n;
	unsigned char r;
	unsigned char i;
	enum DeckState State;
	unsigned char InitSuit;
	unsigned char InitFace;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Shuffle;
	/* VAR_OUTPUT (digital) */
	plcbit Active;
	plcbit CommandDone;
	/* VAR (digital) */
	plcbit Initialized;
} CardDeck_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CardDeck(struct CardDeck* inst);
_BUR_PUBLIC plcbit SwapCard(struct Card_typ (*Deck)[52], unsigned char CardIndexA, unsigned char CardIndexB);


#ifdef __cplusplus
};
#endif
#endif /* _CARDGAME_ */

