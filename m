From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 10/10] drm/nouveau: fix off-by-one bugs
 related to command submission in IB mode
Date: Tue, 21 Aug 2012 07:13:23 +1000
Message-ID: <CACAvsv7FKZFoVi9akwfmnry8O+draX_ZfuBbFF_2zEOV9kkK6Q@mail.gmail.com>
References: <20120819210200.GA26902@joi.lan>
	<20120820063323.GF2013@nisroch.redhat.com>
	<20120820170719.GB3143@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0443164201=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120820170719.GB3143-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0443164201==
Content-Type: multipart/alternative; boundary=bcaec54eedf8d8152104c7b8fafb

--bcaec54eedf8d8152104c7b8fafb
Content-Type: text/plain; charset=ISO-8859-1

Am Dienstag, 21. August 2012 schrieb Marcin Slusarz :

> On Mon, Aug 20, 2012 at 04:33:24PM +1000, Ben Skeggs wrote:
> > On Sun, Aug 19, 2012 at 11:02:00PM +0200, Marcin Slusarz wrote:
> > > Commit "drm/nouveau: port all engines to new engine module format"
> changed
> > > IB size calculation to be less wasteful, but didn't take into account
> already
> > > existing off-by-one bugs :).
> > >
> > > So:
> > > - ib_max is the last entry, so we need to +1 when calculating number of
> > >   free entries
> > > - nv50_dma_wait already does +1 (for FIRE_RING), so we don't need
> another +1
> > >   on nouveau_gem_ioctl_pushbuf side
> > > - there are 512 allocated IB entries (and it needs to be round
> number), so we
> > >   can accept at most 511 entries from userspace (we need one for
> FIRE_RING) -
> > >   fortunately userspace already flushes at 511, so nr_push check
> change won't
> > >   have any impact
> > Also skipped this patch for now as I have work in progress that will
> improve this and
> > related code.  I should have it in the tree soon.
>
> Maybe I should have written this in the changelog, but this patch fixes
> total
> mayhem seen in warsow and nexuiz (at least). It's better to integrate it
> sooner
> than later.

I presume bumping the IB size to 8KiB also helps? I prefer this in the
meantime, and it's probably best to do anyway, I didn't take into account
what we allow userspace to do in one shot.  If this works too, i'll push
that change this morning.

I did try and reproduce on a couple of cards with warsow and wasn't able to.

Also, what happened to instmem being the culprit here?

Marcin
>

--bcaec54eedf8d8152104c7b8fafb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am Dienstag, 21. August 2012 schrieb Marcin Slusarz :<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Mon, Aug 20, 2012 at 04:33:24PM +1000, Ben Skeggs wrote:<b=
r>

&gt; On Sun, Aug 19, 2012 at 11:02:00PM +0200, Marcin Slusarz wrote:<br>
&gt; &gt; Commit &quot;drm/nouveau: port all engines to new engine module f=
ormat&quot; changed<br>
&gt; &gt; IB size calculation to be less wasteful, but didn&#39;t take into=
 account already<br>
&gt; &gt; existing off-by-one bugs :).<br>
&gt; &gt;<br>
&gt; &gt; So:<br>
&gt; &gt; - ib_max is the last entry, so we need to +1 when calculating num=
ber of<br>
&gt; &gt; =A0 free entries<br>
&gt; &gt; - nv50_dma_wait already does +1 (for FIRE_RING), so we don&#39;t =
need another +1<br>
&gt; &gt; =A0 on nouveau_gem_ioctl_pushbuf side<br>
&gt; &gt; - there are 512 allocated IB entries (and it needs to be round nu=
mber), so we<br>
&gt; &gt; =A0 can accept at most 511 entries from userspace (we need one fo=
r FIRE_RING) -<br>
&gt; &gt; =A0 fortunately userspace already flushes at 511, so nr_push chec=
k change won&#39;t<br>
&gt; &gt; =A0 have any impact<br>
&gt; Also skipped this patch for now as I have work in progress that will i=
mprove this and<br>
&gt; related code. =A0I should have it in the tree soon.<br>
<br>
Maybe I should have written this in the changelog, but this patch fixes tot=
al<br>
mayhem seen in warsow and nexuiz (at least). It&#39;s better to integrate i=
t sooner<br>
than later.</blockquote><div>I presume bumping the IB size to 8KiB also hel=
ps? I prefer this in the meantime, and it&#39;s probably best to do anyway,=
 I didn&#39;t take into account what we allow userspace to do in one shot. =
=A0If this works too, i&#39;ll push that change this morning.<span></span><=
/div>
<div><br></div><div>I did try and reproduce on a couple of cards with warso=
w and wasn&#39;t able to.</div><div><br></div><div>Also, what happened to i=
nstmem being the culprit here?</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
Marcin<br>
</blockquote>

--bcaec54eedf8d8152104c7b8fafb--

--===============0443164201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0443164201==--
