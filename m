From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: reorder framebuffer init
	sequence
Date: Thu, 13 Dec 2012 07:16:15 -0800
Message-ID: <CAAQKjZP7KFsqLhZ3fPiZp4qEbvkgUhcm+Q0+1nHbKbwXngV0bg@mail.gmail.com>
References: <1355317637-16742-17-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355396719-25286-2-git-send-email-daniel.vetter@ffwll.ch>
	<00a001cdd92d$09cf2ae0$1d6d80a0$%dae@samsung.com>
	<CAKMK7uHOqmKu+tQMWeBHayP_zSBFynWmfHomhxB+p1huptSRxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1235258634=="
Return-path: <intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <CAKMK7uHOqmKu+tQMWeBHayP_zSBFynWmfHomhxB+p1huptSRxQ@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
	<mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
Errors-To: intel-gfx-bounces+gcfxdi-intel-gfx=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============1235258634==
Content-Type: multipart/alternative; boundary=f46d043bdf28689cb704d0bd656f

--f46d043bdf28689cb704d0bd656f
Content-Type: text/plain; charset=ISO-8859-1

2012/12/13 Daniel Vetter <daniel.vetter@ffwll.ch>

> Hi Inki,
>
> I've pushed out the latest bits to
> http://cgit.freedesktop.org/~danvet/drm/log/?h=drm-kms-locking with
> some hacks on top to be able to compile all the arm drivers. Testing
> feedback of the entire pile would be awesome, especially since you've
> had some issues with framebuffer lifecycle and those should now be
> correctly fixable with the proper refcounting. If you have too many
> conflicts pls yell so that I can include your base into mine and
> rebase the entire series.
>
>
Hi Daniel,

How about rebasing this patch to top of git://
people.freedesktop.org/~airlied/linux.git drm-next?
Exynos's many patches have already been merged to drm-next. Or if you are
ok, I'd like to rebase your patch to -next and test it. I don't care either
way. :)

If there is any problem, please let me know.

Thanks,
Inki Dae

Thanks, Daniel
>
> On Thu, Dec 13, 2012 at 1:26 PM, Inki Dae <inki.dae@samsung.com> wrote:
> >> -----Original Message-----
> >> From: dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org
> >> [mailto:dri-devel-bounces+inki.dae=samsung.com@lists.freedesktop.org]
> On
> >> Behalf Of Daniel Vetter
> >> Sent: Thursday, December 13, 2012 8:05 PM
> >> To: DRI Development
> >> Cc: Nouveau Dev; Intel Graphics Development; Daniel Vetter
> >> Subject: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence
> >>
> >> For user framebuffers it's easier to just inline the
> >> exynos_drm_framebuffer_init helper instead of trying to adjust it -
> >> most of the things that helper sets up need to be overwritten anyway
> >> again due to the multiple backing storage objects support exynos has,
> >> but does not use for the fbdev.
> >>
> >
> > Hi Daniel,
> >
> > I'd rebase this patch to -next. This patch is conflicted with -next.
> > And if there is no any problem after test, will apply it.
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--f46d043bdf28689cb704d0bd656f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2012/12/13 Daniel Vetter <span dir=3D"lt=
r">&lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=3D"_blank">daniel.v=
etter@ffwll.ch</a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hi Inki,<br>
<br>
I&#39;ve pushed out the latest bits to<br>
<a href=3D"http://cgit.freedesktop.org/~danvet/drm/log/?h=3Ddrm-kms-locking=
" target=3D"_blank">http://cgit.freedesktop.org/~danvet/drm/log/?h=3Ddrm-km=
s-locking</a> with<br>
some hacks on top to be able to compile all the arm drivers. Testing<br>
feedback of the entire pile would be awesome, especially since you&#39;ve<b=
r>
had some issues with framebuffer lifecycle and those should now be<br>
correctly fixable with the proper refcounting. If you have too many<br>
conflicts pls yell so that I can include your base into mine and<br>
rebase the entire series.<br>
<br></blockquote><div><br>Hi Daniel,<br><br>How about rebasing this patch t=
o top of git://<a href=3D"http://people.freedesktop.org/~airlied/linux.git"=
>people.freedesktop.org/~airlied/linux.git</a> drm-next?<br>Exynos&#39;s ma=
ny patches have already been merged to drm-next. Or if you are ok, I&#39;d =
like to rebase your patch to -next and test it. <span id=3D"result_box" cla=
ss=3D"short_text" lang=3D"en"><span class=3D"">I don&#39;t care</span> <spa=
n class=3D"hps">either way</span></span>. :)<br>
<br>If there is any problem, please let me know.<br><br>Thanks,<br>Inki Dae=
 <br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">
Thanks, Daniel<br>
<div class=3D"im HOEnZb"><br>
On Thu, Dec 13, 2012 at 1:26 PM, Inki Dae &lt;<a href=3D"mailto:inki.dae@sa=
msung.com">inki.dae@samsung.com</a>&gt; wrote:<br>
&gt;&gt; -----Original Message-----<br>
&gt;&gt; From: dri-devel-bounces+inki.dae=3D<a href=3D"mailto:samsung.com@l=
ists.freedesktop.org">samsung.com@lists.freedesktop.org</a><br>
&gt;&gt; [mailto:<a href=3D"mailto:dri-devel-bounces%2Binki.dae">dri-devel-=
bounces+inki.dae</a>=3D<a href=3D"mailto:samsung.com@lists.freedesktop.org"=
>samsung.com@lists.freedesktop.org</a>] On<br>
&gt;&gt; Behalf Of Daniel Vetter<br>
&gt;&gt; Sent: Thursday, December 13, 2012 8:05 PM<br>
&gt;&gt; To: DRI Development<br>
&gt;&gt; Cc: Nouveau Dev; Intel Graphics Development; Daniel Vetter<br>
&gt;&gt; Subject: [PATCH 2/2] drm/exynos: reorder framebuffer init sequence=
<br>
&gt;&gt;<br>
&gt;&gt; For user framebuffers it&#39;s easier to just inline the<br>
&gt;&gt; exynos_drm_framebuffer_init helper instead of trying to adjust it =
-<br>
&gt;&gt; most of the things that helper sets up need to be overwritten anyw=
ay<br>
&gt;&gt; again due to the multiple backing storage objects support exynos h=
as,<br>
&gt;&gt; but does not use for the fbdev.<br>
&gt;&gt;<br>
&gt;<br>
&gt; Hi Daniel,<br>
&gt;<br>
&gt; I&#39;d rebase this patch to -next. This patch is conflicted with -nex=
t.<br>
&gt; And if there is no any problem after test, will apply it.<br>
<br>
<br>
<br>
</div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
+41 (0) 79 365 57 48 - <a href=3D"http://blog.ffwll.ch" target=3D"_blank">h=
ttp://blog.ffwll.ch</a><br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/dri-devel" target=
=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div></div></blockquote></div><br>

--f46d043bdf28689cb704d0bd656f--

--===============1235258634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============1235258634==--
