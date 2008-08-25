From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: Linux drivers for GoForce 5500 on g900
Date: Mon, 25 Aug 2008 14:00:20 +0200
Message-ID: <6a89f9d50808250500j42a724c1s59e740876327247c@mail.gmail.com>
References: <E1KXXuD-000BoC-00.red_lion-inbox-ru@f9.mail.ru>
	<6a89f9d50808250419wb05de31udead086621f80a13@mail.gmail.com>
	<5712ce4f0808250428u5c0a382fo69b5708a78f41225@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5712ce4f0808250428u5c0a382fo69b5708a78f41225-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "=?ISO-8859-1?Q?Ralovich,_Krist=F3f?=" <kristof.ralovich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "=?KOI8-R?Q?=E2=C1=D2=D9=CE=C9=CE_=EB=CF=CE=D3=D4=C1=CE=D4=C9?=
	=?KOI8-R?Q?=CE_(aka=5FRed=3D5FLion)?=" <red_lion-aPYA7nAdAYY@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Aug 25, 2008 at 1:28 PM, Ralovich, Krist=F3f
<kristof.ralovich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Stephane,
>
> in this http://lists.freedesktop.org/archives/nouveau/2008-April/001390.h=
tml
> mail you mention, I am quoting "we have most of the technical
> documentation for the GeForce 5x00 chips". Is this doc available
> somewhere for the general public?

Yeah, although it's scattered around:
- 2D/3D accel bits are at
http://nouveau.cvs.sourceforge.net/nouveau/renouveau/renouveau.xml?revision=
=3D1.237&view=3Dmarkup
- the regs are at
http://nouveau.cvs.sourceforge.net/nouveau/rules-ng/databases/nvregisters.x=
ml?revision=3D1.48&view=3Dmarkup
- some things are still only documented in the driver code itself, but
patches correcting that by fixing the above 2 are welcome :)

Stephane
