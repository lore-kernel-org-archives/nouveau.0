From: Felix Blanke <felixblanke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: one desktop on four monitors ?
Date: Tue, 26 Oct 2010 12:00:46 +0200
Message-ID: <20101026120046.00001f3d@unknown>
References: <201010240426.o9O4Qm8w007081@envy.delorie.com>
	<AANLkTim-Req7CGadSsTrbe4ghi9531N-KuYqW0kDufev@mail.gmail.com>
	<201010250211.o9P2BO9o002199@envy.delorie.com>
	<AANLkTi=d2N5Fv-ndtgZw5uHTJrhYytO+-jkFqkKyrzRU@mail.gmail.com>
	<201010260144.o9Q1itQh005230@envy.delorie.com>
	<AANLkTik84bEYDj0A9ejLSQZA9C=1-kVA=vZV9RXOTZJ0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTik84bEYDj0A9ejLSQZA9C=1-kVA=vZV9RXOTZJ0-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

That are exact the same informations I got.

I wanted to get 3 screen working like one single screen. No chance with
nouveau.

What you could do (I hope you guys don't kill me :)):

If your displays got displayport use an AMD card with eyefinity. If
your displays dont have displayport you need to buy 4x active
dvi->displyport adapters :/


Regards,
Felix


Am Tue, 26 Oct 2010 00:10:32 -0400
schrieb Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

> On Mon, Oct 25, 2010 at 9:44 PM, DJ Delorie <dj-Ht4Cp5ncgjRBDgjK7y7TUQ@public.gmane.org> wrote:
> >
> > Grrr. =A0Can the nouveau driver grab two cards at a time and tell the
> > X server it's one card?
> =

> No. It would be pretty tricky to do, especially with different chip
> versions and generations, but even with identical cards it's probably
> a fair bit of effort that would be better spent on proper X server
> support. X server internals aren't really my area of interest so I
> can't tell you much more.
> =

> > Does nouveau support any cards that can drive four monitors with one
> > card, with at least one monitor at 2560x1600 ? =A0Would that get me
> > what I want?
> >
> =

> Current Nvidia cards that support 4 heads are actually dual-GPUs on a
> single card, so the problem is largely the same. Sorry to be the
> bearer of bad news.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
