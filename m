From: Maarten Lankhorst <m.b.lankhorst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] g3dvl: disable iDCT for now
Date: Thu, 28 Jul 2011 20:03:34 +0200
Message-ID: <CAMuW1weq2TSFKSdwyarY_WoBwbPYFDe6SM0MsUvZ2CwSbBmCiw@mail.gmail.com>
References: <1311187717-3621-2-git-send-email-bryancain3@gmail.com>
	<1311752531.2296.0.camel@nisroch> <4E306234.5040502@gmail.com>
	<1311807296.8504.20.camel@nisroch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0011121189=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1311807296.8504.20.camel@nisroch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Bryan Cain <bryancain3-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0011121189==
Content-Type: multipart/alternative; boundary=00248c0eefc6c6b08704a924fb0b

--00248c0eefc6c6b08704a924fb0b
Content-Type: text/plain; charset=UTF-8

Also nacking nouveau almost has xvmc acceleration

Op 28 jul. 2011 00:55 schreef "Ben Skeggs" <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> het volgende:
> On Wed, 2011-07-27 at 14:08 -0500, Bryan Cain wrote:
>> On 07/27/2011 02:42 AM, Ben Skeggs wrote:
>> > On Wed, 2011-07-20 at 13:48 -0500, Bryan Cain wrote:
>> >> ---
>> >> src/vl_hwmc.c | 4 ++--
>> >> 1 files changed, 2 insertions(+), 2 deletions(-)
>> > The obvious question I have for this is, why?
>> >
>> > Ben
>>
>> At least at the time I wrote these patches (in April), the iDCT stage
>> didn't work correctly with nv50. If it's fixed now, this patch can be
>> ignored.
> Then it should be fixed in mesa if that's the case, not disabled in the
> DDX, that helps nothing.
>
> Some time down the track, when it *does* work, we'll re-enable it, and
> someone will update just the DDX and see the breakage because they
> haven't updated mesa yet too..
>
> Ben.
>
>>
>> Bryan
>>
>>
>> >> diff --git a/src/vl_hwmc.c b/src/vl_hwmc.c
>> >> index 6e9e0c7..8e24786 100644
>> >> --- a/src/vl_hwmc.c
>> >> +++ b/src/vl_hwmc.c
>> >> @@ -55,7 +55,7 @@ static XF86MCSurfaceInfoRec yv12_mpeg2_surface =
>> >> 2048,
>> >> 2048,
>> >> 2048,
>> >> - XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
>> >> + /*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,
>> >> XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
>> >> &subpicture_list
>> >> };
>> >> @@ -69,7 +69,7 @@ static XF86MCSurfaceInfoRec uyvy_mpeg2_surface =
>> >> 2048,
>> >> 2048,
>> >> 2048,
>> >> - XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,
>> >> + /*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,
>> >> XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,
>> >> &subpicture_list
>> >> };
>> >
>> >
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--00248c0eefc6c6b08704a924fb0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>Also nacking nouveau almost has xvmc acceleration </p>
<p>Op 28 jul. 2011 00:55 schreef &quot;Ben Skeggs&quot; &lt;<a href=3D"mail=
to:skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; het volgende:<br type=3D"at=
tribution">&gt; On Wed, 2011-07-27 at 14:08 -0500, Bryan Cain wrote:<br>&gt=
;&gt; On 07/27/2011 02:42 AM, Ben Skeggs wrote:<br>
&gt;&gt; &gt; On Wed, 2011-07-20 at 13:48 -0500, Bryan Cain wrote:<br>&gt;&=
gt; &gt;&gt; ---<br>&gt;&gt; &gt;&gt;  src/vl_hwmc.c |    4 ++--<br>&gt;&gt=
; &gt;&gt;  1 files changed, 2 insertions(+), 2 deletions(-)<br>&gt;&gt; &g=
t; The obvious question I have for this is, why?<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; Ben<br>&gt;&gt; <br>&gt;&gt; At least at the=
 time I wrote these patches (in April), the iDCT stage<br>&gt;&gt; didn&#39=
;t work correctly with nv50.  If it&#39;s fixed now, this patch can be<br>
&gt;&gt; ignored.<br>&gt; Then it should be fixed in mesa if that&#39;s the=
 case, not disabled in the<br>&gt; DDX, that helps nothing.<br>&gt; <br>&gt=
; Some time down the track, when it *does* work, we&#39;ll re-enable it, an=
d<br>
&gt; someone will update just the DDX and see the breakage because they<br>=
&gt; haven&#39;t updated mesa yet too..<br>&gt; <br>&gt; Ben.<br>&gt; <br>&=
gt;&gt; <br>&gt;&gt; Bryan<br>&gt;&gt; <br>&gt;&gt; <br>&gt;&gt; &gt;&gt; d=
iff --git a/src/vl_hwmc.c b/src/vl_hwmc.c<br>
&gt;&gt; &gt;&gt; index 6e9e0c7..8e24786 100644<br>&gt;&gt; &gt;&gt; --- a/=
src/vl_hwmc.c<br>&gt;&gt; &gt;&gt; +++ b/src/vl_hwmc.c<br>&gt;&gt; &gt;&gt;=
 @@ -55,7 +55,7 @@ static XF86MCSurfaceInfoRec yv12_mpeg2_surface =3D<br>
&gt;&gt; &gt;&gt;  	2048,<br>&gt;&gt; &gt;&gt;  	2048,<br>&gt;&gt; &gt;&gt;=
  	2048,<br>&gt;&gt; &gt;&gt; -	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,<br>&=
gt;&gt; &gt;&gt; +	/*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,<br>&gt;&gt; &=
gt;&gt;  	XVMC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,<br=
>
&gt;&gt; &gt;&gt;  	&amp;subpicture_list<br>&gt;&gt; &gt;&gt;  };<br>&gt;&g=
t; &gt;&gt; @@ -69,7 +69,7 @@ static XF86MCSurfaceInfoRec uyvy_mpeg2_surfac=
e =3D<br>&gt;&gt; &gt;&gt;  	2048,<br>&gt;&gt; &gt;&gt;  	2048,<br>&gt;&gt;=
 &gt;&gt;  	2048,<br>
&gt;&gt; &gt;&gt; -	XVMC_IDCT | XVMC_MOCOMP | XVMC_MPEG_2,<br>&gt;&gt; &gt;=
&gt; +	/*XVMC_IDCT |*/ XVMC_MOCOMP | XVMC_MPEG_2,<br>&gt;&gt; &gt;&gt;  	XV=
MC_SUBPICTURE_INDEPENDENT_SCALING | XVMC_BACKEND_SUBPICTURE,<br>&gt;&gt; &g=
t;&gt;  	&amp;subpicture_list<br>
&gt;&gt; &gt;&gt;  };<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;<br>&gt;&gt; <br>&gt=
;&gt; _______________________________________________<br>&gt;&gt; Nouveau m=
ailing list<br>&gt;&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">No=
uveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a><br>
&gt;&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau">=
http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>&gt; <br>&gt; =
<br>&gt; _______________________________________________<br>&gt; Nouveau ma=
iling list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>&gt; <a href=3D"http://lists.freedesktop.org/mailman/listin=
fo/nouveau">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br></=
p>

--00248c0eefc6c6b08704a924fb0b--

--===============0011121189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0011121189==--
