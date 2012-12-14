From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
Date: Fri, 14 Dec 2012 13:57:02 +0900
Message-ID: <CAAQKjZM1_bDQoRdrFaDwLm6d0A5wyVfAOD7KFxUK2VZMPf5kRg@mail.gmail.com>
References: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
	<00a001cdd92d$09cf2ae0$1d6d80a0$%dae@samsung.com>
	<CAKMK7uHOqmKu+tQMWeBHayP_zSBFynWmfHomhxB+p1huptSRxQ@mail.gmail.com>
	<CAAQKjZP7KFsqLhZ3fPiZp4qEbvkgUhcm+Q0+1nHbKbwXngV0bg@mail.gmail.com>
	<CAKMK7uE6=taCeErFSvn-eUhG7+C0BxOCKELTara=XiGwmAticA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0736070329=="
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKMK7uE6=taCeErFSvn-eUhG7+C0BxOCKELTara=XiGwmAticA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============0736070329==
Content-Type: multipart/alternative; boundary=e89a8fb1fd7ec0826304d0c8dce0

--e89a8fb1fd7ec0826304d0c8dce0
Content-Type: text/plain; charset=ISO-8859-1

2012/12/14 Daniel Vetter <daniel.vetter@ffwll.ch>

> On Thu, Dec 13, 2012 at 4:16 PM, Inki Dae <inki.dae@samsung.com> wrote:
> > How about rebasing this patch to top of
> > git://people.freedesktop.org/~airlied/linux.git drm-next?
> > Exynos's many patches have already been merged to drm-next. Or if you are
> > ok, I'd like to rebase your patch to -next and test it. I don't care
> either
> > way. :)
>
> I've pushed out a rebased version, but somehow I can't compile-test
> exynos any more :( Probably missing some other stuff from linux-next.
> Anyway, I don't mind which patch you pick or whether you just roll
> your own, the important thing is that drm_framebuffer_init is called
> _after_ everything is set up and initialized. Everything else doesn't
> really matter.
>

I've rebase your patch to -next and tested it. But your patch had null
pointer issue to gem object so I fixed it.
For this, you can refer to the below link,

http://git.kernel.org/?p=linux/kernel/git/daeinki/drm-exynos.git;a=shortlog;h=refs/heads/exynos-drm-next

And I gonna request git pull to -next including that patch today. If there
is any problem, please let me know.

Thanks,
Inki Dae.



> -Daniel
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--e89a8fb1fd7ec0826304d0c8dce0
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/14 Daniel Vetter <span dir=3D"lt=
r">&lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_blank">daniel.v=
etter@ffwll.ch</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, Dec 13, 2012 at 4:16 PM, Inki Dae &lt;<a href=3D"=
mailto:inki.dae@samsung.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt; How about rebasing this patch to top of<br>
&gt; git://<a href=3D"http://people.freedesktop.org/~airlied/linux.git" tar=
get=3D"_blank">people.freedesktop.org/~airlied/linux.git</a> drm-next?<br>
&gt; Exynos&#39;s many patches have already been merged to drm-next. Or if =
you are<br>
&gt; ok, I&#39;d like to rebase your patch to -next and test it. I don&#39;=
t care either<br>
&gt; way. :)<br>
<br>
</div>I&#39;ve pushed out a rebased version, but somehow I can&#39;t compil=
e-test<br>
exynos any more :( Probably missing some other stuff from linux-next.<br>
Anyway, I don&#39;t mind which patch you pick or whether you just roll<br>
your own, the important thing is that drm_framebuffer_init is called<br>
_after_ everything is set up and initialized. Everything else doesn&#39;t<b=
r>
really matter.<br></blockquote><div><br>I&#39;ve rebase your patch to -next=
 and tested it. But your patch had null pointer issue to gem object so I fi=
xed it.<br>For this, you can refer to the below link,<br>=A0=A0=A0=A0=A0=A0=
=A0 <a href=3D"http://git.kernel.org/?p=3Dlinux/kernel/git/daeinki/drm-exyn=
os.git;a=3Dshortlog;h=3Drefs/heads/exynos-drm-next">http://git.kernel.org/?=
p=3Dlinux/kernel/git/daeinki/drm-exynos.git;a=3Dshortlog;h=3Drefs/heads/exy=
nos-drm-next</a><br>
<br>And I gonna request git pull to -next including that patch today. If th=
ere is any problem, please let me know.<br><br>Thanks,<br>Inki Dae.<br><br>=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">

<span class=3D"HOEnZb"><font color=3D"#888888">-Daniel<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
+41 (0) 79 365 57 48 - <a href=3D"http://blog.ffwll.ch" target=3D"_blank">h=
ttp://blog.ffwll.ch</a><br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br>

--e89a8fb1fd7ec0826304d0c8dce0--

--===============0736070329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0736070329==--
