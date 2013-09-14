/*
** Copyright (c) 2013, Cthulhu / Cthulhu@GBITnet.com.br
** All rights reserved.
**
** Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are met:
**
** 1. Redistributions of source code must retain the above copyright notice, this
**    list of conditions and the following disclaimer.
** 2. Redistributions in binary form must reproduce the above copyright notice,
**    this list of conditions and the following disclaimer in the documentation
**    and/or other materials provided with the distribution.
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
** ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
** WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
** DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
** ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
** (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
** LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
** ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
** SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

class TKPStandard extends Object
    Abstract;

/* Every method in this class must be static.
   They are to be used by other objects without the need for new instances. */

static function bool IsSpace(coerce string c)
{

    switch (Asc(c))
    {

        case 0x20:
        case 0x09:
        case 0x0A:
        case 0x0B:
        case 0x0C:
        case 0x0D:

            return true;
            break;

        default:

            return false;
            break;

    }

}

static function string TrimString(string s)
{

    if (s == "") // No-op.
        return s;

    while (IsSpace(Left(s, 1))) // First character.
    {

        s = Mid(s, 1);

    }

    while (IsSpace(Right(s, 1))) // Last character.
    {

        s = Left(s, (Len(s) - 1));

    }

    return s;

}

static function string ParseTime(int Time)
{

    /* Returns a time formatted string.
       HH:MM:SS Type(s) */

    local int Seconds, Minutes, Hours;
    local int Offset;
    local string TimeType;
    local string SS, MM, HH;
    local string TimeString;

    Seconds = (Time % 3600);
    Minutes = (Seconds / 60);
    Seconds = (Seconds % 60);
    Hours = (Time / 3600);
    Offset = 1;
    TimeType = "second";

    if (Seconds > 0)
        SS = (Seconds < 10) ? "0"$Seconds : string(Seconds);

    else
        SS = "00";

    if (Minutes > 0)
    {

        Offset = 60;
        TimeType = "minute";
        MM = (Minutes < 10) ? "0"$Minutes : string(Minutes);

    }

    else
        MM = "00";

    if (Hours > 0)
    {

        Offset = 3600;
        TimeType = "hour";
        HH = (Hours < 10) ? "0"$Hours : string(Hours);

    }

    else
        HH = "00";

    TimeString = HH$":"$MM$":"$SS@TimeType;

    if (Time != Offset)
        TimeString $= "s";

    return TimeString;

}