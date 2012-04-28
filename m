From: gabriel muguerza <glmcabra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Question about NV18 and GBM library.
Date: Fri, 27 Apr 2012 21:11:35 -0300
Message-ID: <CAJvabWApOKF69nDiAmKRrK0vh_9wK+yFe8+J8huiVWMgLYUmsg@mail.gmail.com>
References: <CAJvabWDH8U_H-LaHj1LzZXYdSGb8E+grNUwDeJK+W0KrxKgAqg@mail.gmail.com>
	<1335462119.2645.1.camel@tellur>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1676074164=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1335462119.2645.1.camel@tellur>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: nouveau mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1676074164==
Content-Type: multipart/alternative; boundary=14dae934085969840f04beb21003

--14dae934085969840f04beb21003
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 26, 2012 at 2:41 PM, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:

> Am Mittwoch, den 25.04.2012, 12:34 -0300 schrieb gabriel muguerza:
>
> > Hi,
> >
> > I have a geforce 4mx 440 agp 8x, and I'm trying to use the GBM
> > library,
> > (as jbarnes in:
> > http://virtuousgeek.org/blog/index.php/jbarnes/2011/10/
> > and David Hermann in KMSCON: https://github.com/dvdhrm/kmscon),
> > without success.
> >
> > when I try to create a gbm_device, I get: (below the code.)
> >
> > nouveau_drm_screen_create: unknown chipset nv18
> > dri_init_screen_helper: failed to create pipe_screen
> > loaded /usr/lib/gbm/pipe_nouveau.so
> > nouveau_drm_screen_create: unknown chipset nv18
> > failed to load driver: nouveau
> >
> >
> > My question is:
> > Is this not supported by the driver?,
> > It's a GBM problem? or am I doing something wrong?
> >
> Yep, you are right, your GPU is simply too old. GBM is only supported
> with the nouveau gallium drivers, which start with the nv30 generation.
> The nouveau_vieux driver for your card does not support GBM.
>
> -- Lucas
>
>
Ok, thank you.
(and nor Wayland works, I guess).

Gabriel.

--14dae934085969840f04beb21003
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Thu, Apr 26, 2012 at 2:41 PM, Lucas S=
tach <span dir=3D"ltr">&lt;<a href=3D"mailto:dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" target=3D"_bla=
nk">dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Am Mittwoch, den 25.04.2012, 12:34 -0300 schrieb gabriel muguerza:<br>
<div class=3D"im"><br>
&gt; Hi,<br>
&gt;<br>
&gt; I have a geforce 4mx 440 agp 8x, and I&#39;m trying to use the GBM<br>
&gt; library,<br>
&gt; (as jbarnes in:<br>
&gt; <a href=3D"http://virtuousgeek.org/blog/index.php/jbarnes/2011/10/" ta=
rget=3D"_blank">http://virtuousgeek.org/blog/index.php/jbarnes/2011/10/</a>=
<br>
&gt; and David Hermann in KMSCON: <a href=3D"https://github.com/dvdhrm/kmsc=
on" target=3D"_blank">https://github.com/dvdhrm/kmscon</a>),<br>
&gt; without success.<br>
&gt;<br>
&gt; when I try to create a gbm_device, I get: (below the code.)<br>
&gt;<br>
&gt; nouveau_drm_screen_create: unknown chipset nv18<br>
&gt; dri_init_screen_helper: failed to create pipe_screen<br>
&gt; loaded /usr/lib/gbm/pipe_nouveau.so<br>
&gt; nouveau_drm_screen_create: unknown chipset nv18<br>
&gt; failed to load driver: nouveau<br>
&gt;<br>
&gt;<br>
&gt; My question is:<br>
&gt; Is this not supported by the driver?,<br>
&gt; It&#39;s a GBM problem? or am I doing something wrong?<br>
&gt;<br>
</div>Yep, you are right, your GPU is simply too old. GBM is only supported=
<br>
with the nouveau gallium drivers, which start with the nv30 generation.<br>
The nouveau_vieux driver for your card does not support GBM.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-- Lucas<br>
<br></font></span></blockquote><div>=A0</div></div>Ok, thank you.<br>(and n=
or Wayland works, I guess).<br><br>Gabriel.<br><br><br>

--14dae934085969840f04beb21003--

--===============1676074164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1676074164==--
