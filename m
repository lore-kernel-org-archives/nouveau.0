From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau and multiple video cards
Date: Mon, 20 Sep 2010 10:41:57 +1000
Message-ID: <1284943317.30072.1.camel@nisroch>
References: <20100918160119.GA3930@scooter>
	<AANLkTimWEBinSZ5mPVWhgVeHosN0Qh1N6GN8Uh_zbxZ-@mail.gmail.com>
	<AANLkTikAmoVDpfMD81kJqfQ85rWCGoEMAUga54CDV1co@mail.gmail.com>
	<AANLkTikW4oVmg74TkSO23R7XpiTyGCa5npmE3vVZ5cv+@mail.gmail.com>
	<AANLkTiktUJsULg6_+8wqP+5OaxfEnoz3innKam8DsGMP@mail.gmail.com>
	<20100919224853.GA19353@scooter>
	<AANLkTinKFLdngzQdj5Dz2QhMDD9ZivuAbzkLtkYn5wug@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTinKFLdngzQdj5Dz2QhMDD9ZivuAbzkLtkYn5wug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On Sun, 2010-09-19 at 20:22 -0400, Younes Manton wrote:
> On Sun, Sep 19, 2010 at 6:48 PM, Felix Blanke <felixblanke-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > Hi,
> >
> > I hope it is ok if I would ask one last question:
> >
> > It is possible to use a quadro NVS 450 with 3 monitors via DVI and nouveau?
> >
> >
> > The status matrix is kind of old (e.g. it says that dual link dvi is WIP, it works
> > for me good :)) and I dont find that quado NVS 450 on it.
> >
> >
> > Thanks again!
> 
> If the card can actually drive 3 monitors at once with the nvidia
> driver then it should work in nouveau now or can be implemented with
> some reversing. Maybe someone who knows more about mode setting can
> give you a definitive answer.
I don't believe there's any NVIDIA GPUs with more than 2 CRTCs.  At
least, none I've seen.

There are boards which can drive 4 displays, but they're actually
dual-GPU boards.

Ben.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
