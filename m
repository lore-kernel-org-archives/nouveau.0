From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: GeForce FX5200 dual DVI & Samsung 204b
Date: Wed, 6 Oct 2010 00:33:25 +0300
Message-ID: <20101006003325.3bfb33e9@daedalus.pq.iki.fi>
References: <4C9E0167.8000507@pfu.pl>
	<20100928004117.0a0ae0ca@daedalus.pq.iki.fi>
	<4CA1C6C0.1000709@pfu.pl>
	<20100928170227.00665f76@daedalus.pq.iki.fi>
	<4CA21515.4030903@pfu.pl>
	<20100929193136.644e0d68@daedalus.pq.iki.fi>
	<878w2jike0.fsf@riseup.net> <4CA4A934.4080109@pfu.pl>
	<87zkuzgqsv.fsf@riseup.net> <4CA4D199.8010403@pfu.pl>
	<87pqvuhksw.fsf@riseup.net> <4CA5B64D.8000608@pfu.pl>
	<871v88hgam.fsf@riseup.net> <4CAAFB3A.8010804@pfu.pl>
	<87fwwkhk8h.fsf@riseup.net> <4CAB3BDC.4070502@pfu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CAB3BDC.4070502-t9zbU3WrWHI@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grzesiek =?ISO-8859-1?Q?S=F3jka?= <pld-t9zbU3WrWHI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 05 Oct 2010 16:53:16 +0200
Grzesiek S=F3jka <pld-t9zbU3WrWHI@public.gmane.org> wrote:

> On 10/05/10 14:55, Francisco Jerez wrote:
> >> PS. I'm afraid that my system is not very stable when the AGP
> >> support is turned on both using the nouveau kernel source tree
> >> and the PLD patched 2.6.35-5 version with an extra amd-k7-agp
> >> patch. The Xserver uses the driver:
> > Unstable? How? What's the problem?
> =

> Here are the logs:
> http://yen.ipipan.waw.pl/~gs159090/tmp/log.tgz
> =

> BTW: Sometimes the Xserver freezes during normal work.
> Unfortunately I was not able to generate such a crush now. I send
> you logs if it happens again.

Whoa, you have three graphics cards/chips?
X log lists three devices, maybe the third one is not
a graphics card?

Anyway, the Matrox card is an important detail.

X drivers in use:
- nouveau
- mga

kernel drivers in use:
- matroxfb (fb0)
- nouveau (fb1)

Your kernel log is missing the part from boot to 12
seconds. Might not contain anything important, but
would be nice to see it.

You are missing VGA arbiter support in kernel.

I'm not sure how many conflicts all those cards and drivers
create in theory, but missing VGA arbiter is not good in
a multi-card machine.

I hope someone can tell, if the following are conflicts, and
if so, are they fixable:
- mga vs. nouveau DDX (XAA vs. EXA, pre-Randr vs. Randr 1.2)
- mga vs. matroxfb (kernel driver vs. X driver)
- matroxfb vs. nouveau (legacy kernel fb driver vs. KMS driver,
multiple fb devices)

Finally, there is a kernel BUG at the end of the log,
from TTM. I can't tell if it is something already
fixed.

One option is to remove all but the nvidia graphics card,
that would hopefully stabilise your system immediately.
Apparently you are not really using the Matrox card, yes?
At least, disable matroxfb and mga, and enable VGA arbiter,
if not touching the hardware.


Cheers.

-- =

Pekka Paalanen
http://www.iki.fi/pq/
