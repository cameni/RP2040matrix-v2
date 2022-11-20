
#ifndef _BMFONT_H_
#define _BMFONT_H_

#include <stdbool.h>
#include <stdint.h>

struct info {
	const char* face;
	const char* charset;
	int size;
	int stretchH;
	int8_t padding[4];
	int8_t spacing[2];
	bool bold;
	bool italic;
	bool unicode;
	bool smooth;
	bool aa;
	int8_t outline;
};

struct common {
	int lineHeight;
	int base;
	int scaleW;
	int scaleH;
	bool packed;
	int8_t alphaChnl;
	int8_t redChnl;
	int8_t greenChnl;
	int8_t blueChnl;
};

struct chardata {
	int id;
	int width, height;
	int xoffset, yoffset;
	int xadvance;
	int offset;
	int channel;
};

struct kerning {
	int first;
	int second;
	int amount;
};

struct font {
	struct info info;
	struct common common;
	const uint8_t* data;
	int data_size;
	int chars_count;
	struct chardata* chars;
	int kernings_count;
	struct kerning* kernings;
};

#endif //_BMFONT_H_
