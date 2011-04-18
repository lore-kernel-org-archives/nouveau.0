From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: 2.6.39-rc1 nouveau(?) regression (bisected)
Date: Mon, 18 Apr 2011 13:27:10 -0700
Message-ID: <BANLkTi=Oo03CQchHYh4EvEsk+wZy7akLNw@mail.gmail.com>
References: <20110407151129.GA24977@comet.dominikbrodowski.net>
 <20110414170559.GA10768@comet.dominikbrodowski.net> <20110414190117.GA3493@joi.lan>
 <20110415061136.GA21979@isilmar-3.linta.de> <4DAA1453.5000604@nigelcunningham.com.au>
 <20110416235028.GA6096@taurine.csclub.uwaterloo.ca> <20110417151204.GA24519@taurine.csclub.uwaterloo.ca>
 <20110417154557.GA2871@joi.lan> <20110417162427.GB25242@taurine.csclub.uwaterloo.ca>
 <20110417164920.GA2626@joi.lan> <20110418200204.GA2522@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110418200204.GA2522@joi.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcin Slusarz <marcin.slusarz@gmail.com>
Cc: Kyle Spaans <kspaans@uwaterloo.ca>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Ben Skeggs <bskeggs@redhat.com>, airlied@redhat.com, dri-devel@lists.freedesktop.org, mjg@redhat.com, maciej.rutecki@gmail.com, nouveau@lists.freedesktop.org, Nigel Cunningham <lkml@nigelcunningham.com.au>, Nick Piggin <npiggin@gmail.com>
List-Id: nouveau.vger.kernel.org

On Mon, Apr 18, 2011 at 1:02 PM, Marcin Slusarz
<marcin.slusarz@gmail.com> wrote:
>
> It's some nasty corruption:

Looks like something wrote 0xffffffff to free'd memory.

Enabling DEBUG_PAGEALLOC *might* show where it happens.

>
> [ =A0 =A06.523867] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ =A0 =A06.523916] BUG sysfs_dir_cache: Poison overwritten
> [ =A0 =A06.523949] --------------------------------------------------=
---------------------------
> [ =A0 =A06.523950]
> [ =A0 =A06.524016] INFO: 0xffff8801bb47df4c-0xffff8801bb47df4f. First=
 byte 0xff instead of 0x6b
> [ =A0 =A06.524061] INFO: Slab 0xffffea00060f7b58 objects=3D22 used=3D=
21 fp=3D0xffff8801bb47df18 flags=3D0x80000000000000c1
> [ =A0 =A06.524110] INFO: Object 0xffff8801bb47df18 @offset=3D3864 fp=3D=
0x =A0 =A0 =A0 =A0 =A0(null)
> [ =A0 =A06.524111]
> [ =A0 =A06.524170] Bytes b4 0xffff8801bb47df08: =A000 00 00 00 00 00 =
00 00 5a 5a 5a 5a 5a 5a 5a 5a ........ZZZZZZZZ
> [ =A0 =A06.524516] =A0 Object 0xffff8801bb47df18: =A06b 6b 6b 6b 6b 6=
b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> [ =A0 =A06.524862] =A0 Object 0xffff8801bb47df28: =A06b 6b 6b 6b 6b 6=
b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> [ =A0 =A06.525208] =A0 Object 0xffff8801bb47df38: =A06b 6b 6b 6b 6b 6=
b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> [ =A0 =A06.525556] =A0 Object 0xffff8801bb47df48: =A06b 6b 6b 6b ff f=
f ff ff 6b 6b 6b 6b 6b 6b 6b 6b kkkk<FF><FF><FF><FF>kkkkkkkk

So here the 0xffffffff is pretty obvious.

> and in another boot:
>
> [ =A0 =A06.704786] BUG: unable to handle kernel paging request at fff=
fffffbc70b058

Here it is less obvious, but it was _probably_ a regular kernel
pointer of the type 0xffff8801bc70b058 before the high bits were
overwritten by a 0xffffffff.

So then sysfs_refresh_inode() follows that pointer, and crashes.

Just a guess, obviously, but it looks rather likely.

                         Linus
