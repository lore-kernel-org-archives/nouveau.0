From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Tester wanted: Timing management
Date: Mon, 11 Oct 2010 23:06:59 +0200
Message-ID: <AANLkTimPTYkYEW=naBNem9JCsR5XtGO_f4ZX8cXgWSn5@mail.gmail.com>
References: <4CB2D281.7010705@ensi-bourges.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CB2D281.7010705-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Oct 11, 2010 at 11:01 AM, Martin Peres
<martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> wrote:
> =A0Hi,
>
> Roy Spliet, Emil Velikov and I are working on getting memory timing suppo=
rt
> to nouveau (http://en.wikipedia.org/wiki/Memory_timings).
>
> We badly need your help as the vbios timing table (that stores the timings
> that should be set when we up/down-clock the memory clocks) contains a lot
> of magic.
>
> If you want to help us, please follow this link:
> http://github.com/pathscale/pscnv/wiki/TestingTimings
>
> For those who already sent us your info and had a bios table containing
> timing values, please re-read the page, we now also need the strap regist=
er
> now (sorry).
>
> Thanking you by advance.
>

I checked the two regs on my nv84 laptop with nouveau and blob at the
3 perf levels.
On blob, I see that perf level $i seems to correspond to bios entry $i
with i=3D0,1,2
On nouveau, I always get same value as with blob on max level (2).

So two questions :
1) are you not interested in getting the values for each perf level
while running the blob ?
2) does it mean that the timings set on boot are already the best
ones, at least for my card ?

nouveau perf level 0,1,2
00100220: 09162728 0c01080c 0008080c 1e160909
00100230: 28000808 270c0c09 00320137 04090202
same as blob on level 2

blob
level 0
00100220: 02040606 0b010707 00020102 19160404
00100230: 28000808 06020702 00320132 04040202
similar to entry 0

level 1
00100220: 050a1112 0b010709 00040305 1b160606
00100230: 28000808 11050905 00320134 04060202
similar to entry 1

level 2
00100220: 09162728 0c01080c 0008080c 1e160909
00100230: 28000808 270c0c09 00320137 04090202
similar to entry 2


Timing table at c706. Version 10.
Header:
c706: 10 04 0c 10

12 entries
c70a: 09 05 05 06 00 06 00 04 00 02 02 01 02 08 00 00
Entry 0: RP(6), RAS(6), RFC(4), RC(2)
Registers: 220: 02040606 0b010704 02020102 00000000
           230: 00000808 06020702 00000000 00000000

c71a: 09 05 07 12 00 11 00 0a 00 05 05 03 04 08 00 00
Entry 1: RP(18), RAS(17), RFC(10), RC(5)
Registers: 220: 050a1112 0b010706 04040305 00000000
           230: 00000808 11050705 00000000 00000000

c72a: 0a 06 0a 28 00 27 00 16 00 09 0c 08 08 08 02 00
Entry 2: RP(40), RAS(39), RFC(22), RC(9)
Registers: 220: 09162728 0c010809 0808080c 00000000
           230: 00000808 270c0709 00000000 00000000

c73a: 0a 06 0b 28 00 27 00 16 00 0c 0c 08 08 08 02 00
Entry 3: RP(40), RAS(39), RFC(22), RC(12)
Registers: 220: 0c162728 0c01080a 0808080c 00000000
           230: 00000808 270c070c 00000000 00000000

c74a: 09 05 07 06 00 06 00 04 00 02 02 01 02 08 00 00
Entry 4: RP(6), RAS(6), RFC(4), RC(2)
Registers: 220: 02040606 0b010706 02020102 00000000
           230: 00000808 06020702 00000000 00000000

c75a: 0c 07 0b 24 00 2d 00 1a 00 0d 0c 08 08 07 02 00
Entry 5: RP(36), RAS(45), RFC(26), RC(13)
Registers: 220: 0d1a2d24 0e01090a 0808080c 00000000
           230: 00000707 2d0c070d 00000000 00000000
