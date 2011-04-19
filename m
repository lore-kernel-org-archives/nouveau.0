From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: 2.6.39-rc1 nouveau(?) regression (bisected)
Date: Tue, 19 Apr 2011 23:47:47 +0200
Message-ID: <20110419214747.GA2965@joi.lan>
References: <20110414190117.GA3493@joi.lan>
 <20110415061136.GA21979@isilmar-3.linta.de>
 <4DAA1453.5000604@nigelcunningham.com.au>
 <20110416235028.GA6096@taurine.csclub.uwaterloo.ca>
 <20110417151204.GA24519@taurine.csclub.uwaterloo.ca>
 <20110417154557.GA2871@joi.lan>
 <20110417162427.GB25242@taurine.csclub.uwaterloo.ca>
 <20110417164920.GA2626@joi.lan>
 <20110418200204.GA2522@joi.lan>
 <BANLkTi=Oo03CQchHYh4EvEsk+wZy7akLNw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=Oo03CQchHYh4EvEsk+wZy7akLNw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kyle Spaans <kspaans@uwaterloo.ca>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Ben Skeggs <bskeggs@redhat.com>, airlied@redhat.com, dri-devel@lists.freedesktop.org, mjg@redhat.com, maciej.rutecki@gmail.com, nouveau@lists.freedesktop.org, Nigel Cunningham <lkml@nigelcunningham.com.au>, Nick Piggin <npiggin@gmail.com>
List-Id: nouveau.vger.kernel.org

On Mon, Apr 18, 2011 at 01:27:10PM -0700, Linus Torvalds wrote:
> On Mon, Apr 18, 2011 at 1:02 PM, Marcin Slusarz
> <marcin.slusarz@gmail.com> wrote:
> >
> > It's some nasty corruption:
>=20
> Looks like something wrote 0xffffffff to free'd memory.
>=20
> Enabling DEBUG_PAGEALLOC *might* show where it happens.
>=20
> >
> > [ =C2=A0 =C2=A06.523867] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [ =C2=A0 =C2=A06.523916] BUG sysfs_dir_cache: Poison overwritten
> > [ =C2=A0 =C2=A06.523949] ------------------------------------------=
-----------------------------------
> > [ =C2=A0 =C2=A06.523950]
> > [ =C2=A0 =C2=A06.524016] INFO: 0xffff8801bb47df4c-0xffff8801bb47df4=
f. First byte 0xff instead of 0x6b
> > [ =C2=A0 =C2=A06.524061] INFO: Slab 0xffffea00060f7b58 objects=3D22=
 used=3D21 fp=3D0xffff8801bb47df18 flags=3D0x80000000000000c1
> > [ =C2=A0 =C2=A06.524110] INFO: Object 0xffff8801bb47df18 @offset=3D=
3864 fp=3D0x =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(null)
> > [ =C2=A0 =C2=A06.524111]
> > [ =C2=A0 =C2=A06.524170] Bytes b4 0xffff8801bb47df08: =C2=A000 00 0=
0 00 00 00 00 00 5a 5a 5a 5a 5a 5a 5a 5a ........ZZZZZZZZ
> > [ =C2=A0 =C2=A06.524516] =C2=A0 Object 0xffff8801bb47df18: =C2=A06b=
 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> > [ =C2=A0 =C2=A06.524862] =C2=A0 Object 0xffff8801bb47df28: =C2=A06b=
 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> > [ =C2=A0 =C2=A06.525208] =C2=A0 Object 0xffff8801bb47df38: =C2=A06b=
 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b kkkkkkkkkkkkkkkk
> > [ =C2=A0 =C2=A06.525556] =C2=A0 Object 0xffff8801bb47df48: =C2=A06b=
 6b 6b 6b ff ff ff ff 6b 6b 6b 6b 6b 6b 6b 6b kkkk<FF><FF><FF><FF>kkkkk=
kkk
>=20
> So here the 0xffffffff is pretty obvious.
>=20
> > and in another boot:
> >
> > [ =C2=A0 =C2=A06.704786] BUG: unable to handle kernel paging reques=
t at ffffffffbc70b058
>=20
> Here it is less obvious, but it was _probably_ a regular kernel
> pointer of the type 0xffff8801bc70b058 before the high bits were
> overwritten by a 0xffffffff.
>=20
> So then sysfs_refresh_inode() follows that pointer, and crashes.
>=20
> Just a guess, obviously, but it looks rather likely.

Thanks. It helped a bit.
I'll send two patches in response to this message, one of which fixes t=
his bug.

Marcin
