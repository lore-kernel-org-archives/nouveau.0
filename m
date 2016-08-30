From: Baoyou Xie <baoyou.xie@linaro.org>
Subject: Re: [PATCH v2] drm/nouveau/gr: mark gm107_grctx_generate_tpcid()
 static
Date: Wed, 31 Aug 2016 00:27:59 +0800
Message-ID: <CA+DQWkxm=OJxzJfnRuTGRN_PCT4gmQpjd2P8uiOWbqS3BbbsFQ@mail.gmail.com>
References: <1472475747-30296-1-git-send-email-baoyou.xie@linaro.org>
 <CAOw6vbL9C1o+-1w1=cuwazhS6CqhofsiBbBZjYvBsDT+_dcQ6A@mail.gmail.com>
 <CA+DQWkws5sJMnJagECjXdbEKOdFZ8LLbwm9ng6dYt26KUXUQRQ@mail.gmail.com>
 <201608301440.52481.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0610789167=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <201608301440.52481.arnd@arndb.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sean Paul <seanpaul@google.com>, nouveau@lists.freedesktop.org, xie.baoyou@zte.com.cn, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org

--===============0610789167==
Content-Type: multipart/alternative; boundary=001a1143e4e4cc90b1053b4c76b4

--001a1143e4e4cc90b1053b4c76b4
Content-Type: text/plain; charset=UTF-8

dear all:
    I have resend a patch, which consolidate the 'nouveau' changes into it,
its subject is "drm/nouveau: silence warnings reported during builds with
W=1".
   FYI.

On 30 August 2016 at 20:40, Arnd Bergmann <arnd@arndb.de> wrote:

> On Tuesday 30 August 2016, Baoyou Xie wrote:
> > On 30 August 2016 at 00:01, Sean Paul <seanpaul@google.com> wrote:
> >
> > > On Mon, Aug 29, 2016 at 9:02 AM, Baoyou Xie <baoyou.xie@linaro.org>
> wrote:
> > > > We get 1 warning when build kernel with W=1:
> > > > drivers/gpu/drm/nouveau/nvkm/engine/gr/ctxgm107.c:937:1: warning: no
> > > previous prototype for 'gm107_grctx_generate_tpcid'
> [-Wmissing-prototypes]
> > > >
> > > > In fact, this function is only used in the file in which it is
> > > > declared and don't need a declaration, but can be made static.
> > > > so this patch marks this function with 'static'.
> > > >
> > >
> > > It would make things a lot easier if you either consolidated all of
> > > these static changes into one patch, or released them as a series.
> > >
> > >
> > Do you mean that I need to consolidate all of them into one patch this
> > time? or next time?
>
> I'd suggest consolidating the 'nouveau' changes into a single patch,
> as this is one (very big) driver and resend that one.
>
>         Arnd
>

--001a1143e4e4cc90b1053b4c76b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>dear all:<br></div>=C2=A0=C2=A0=C2=A0 I have res=
end a patch, which consolidate the &#39;nouveau&#39; changes into it, its s=
ubject is &quot;drm/nouveau: silence warnings reported during builds with W=
=3D1&quot;.<br></div>=C2=A0=C2=A0 FYI.<br></div><div class=3D"gmail_extra">=
<br><div class=3D"gmail_quote">On 30 August 2016 at 20:40, Arnd Bergmann <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:arnd@arndb.de" target=3D"_blank">arnd=
@arndb.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Tuesday 30 August 2016, Baoyou Xie wrote:<br>
&gt; On 30 August 2016 at 00:01, Sean Paul &lt;<a href=3D"mailto:seanpaul@g=
oogle.com">seanpaul@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; On Mon, Aug 29, 2016 at 9:02 AM, Baoyou Xie &lt;<a href=3D"mailto=
:baoyou.xie@linaro.org">baoyou.xie@linaro.org</a>&gt; wrote:<br>
&gt; &gt; &gt; We get 1 warning when build kernel with W=3D1:<br>
&gt; &gt; &gt; drivers/gpu/drm/nouveau/nvkm/<wbr>engine/gr/ctxgm107.c:937:1=
: warning: no<br>
&gt; &gt; previous prototype for &#39;gm107_grctx_generate_tpcid&#39; [-Wmi=
ssing-prototypes]<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; In fact, this function is only used in the file in which it =
is<br>
&gt; &gt; &gt; declared and don&#39;t need a declaration, but can be made s=
tatic.<br>
&gt; &gt; &gt; so this patch marks this function with &#39;static&#39;.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; It would make things a lot easier if you either consolidated all =
of<br>
&gt; &gt; these static changes into one patch, or released them as a series=
.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Do you mean that I need to consolidate all of them into one patch this=
<br>
&gt; time? or next time?<br>
<br>
</span>I&#39;d suggest consolidating the &#39;nouveau&#39; changes into a s=
ingle patch,<br>
as this is one (very big) driver and resend that one.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnd<br>
</font></span></blockquote></div><br></div>

--001a1143e4e4cc90b1053b4c76b4--

--===============0610789167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0610789167==--
