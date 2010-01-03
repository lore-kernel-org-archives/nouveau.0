From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Latest xf86-video-nouveau does not compile
Date: Sun, 3 Jan 2010 03:11:51 +0100
Message-ID: <6d4bc9fc1001021811k8a971fbu882b04875ae32c1c@mail.gmail.com>
References: <201001030255.43577.johannesobermayr@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201001030255.43577.johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Attempt 2, better?

From 061cb284b93612848296599759b915a4d66b6d01 Mon Sep 17 00:00:00 2001
From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date: Sun, 3 Jan 2010 02:14:36 +0100
Subject: [PATCH] exa: Some compat defines for new pixman formats.

Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 src/nv50_exa.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/src/nv50_exa.c b/src/nv50_exa.c
index 10a3a64..59c198f 100644
--- a/src/nv50_exa.c
+++ b/src/nv50_exa.c
@@ -431,6 +431,26 @@ NV50EXAUploadSIFC(const char *src, int src_pitch,
 	return TRUE;
 }

+/* Compat defines for pre 1.7 xservers. */
+#ifndef PICT_a2b10g10r10
+#define PICT_a2b10g10r10 PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10)
+#endif
+#ifndef PICT_x2b10g10r10
+#define PICT_x2b10g10r10  PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, 10)
+#endif
+#ifndef  PICT_a2r10g10b10
+#define PICT_a2r10g10b10 PICT_FORMAT(32, PICT_TYPE_ARGB, 2, 10, 10, 10)
+#endif
+#ifndef  PICT_x2r10g10b10
+#define PICT_x2r10g10b10 PICT_FORMAT(32, PICT_TYPE_ARGB, 0, 10, 10, 10)
+#endif
+#ifndef PICT_b8g8r8a8
+#define PICT_b8g8r8a8 PIXMAN_FORMAT(32,PIXMAN_TYPE_BGRA,8,8,8,8)
+#endif
+#ifndef PICT_b8g8r8x8
+#define PICT_b8g8r8x8 PIXMAN_FORMAT(32,PIXMAN_TYPE_BGRA,0,8,8,8)
+#endif
+
 static Bool
 NV50EXACheckRenderTarget(PicturePtr ppict)
 {
-- =

1.6.6.rc4



On Sun, Jan 3, 2010 at 2:55 AM, Johannes Obermayr
<johannesobermayr-Mmb7MZpHnFY@public.gmane.org> wrote:
> I forgot to add the mailing list:
>
> It changed:
>
> CC nv50_sor.lo
> nv50_exa.c: In function 'NV50EXACheckTexture':
> nv50_exa.c:545: error: 'PICT_b8g8r8a8' undeclared (first use in this func=
tion)
> nv50_exa.c:545: error: (Each undeclared identifier is reported only once
> nv50_exa.c:545: error: for each function it appears in.)
> nv50_exa.c:546: error: 'PICT_b8g8r8x8' undeclared (first use in this func=
tion)
> nv50_exa.c: In function 'NV50EXATexture':
> nv50_exa.c:645: error: 'PICT_b8g8r8x8' undeclared (first use in this func=
tion)
> nv50_exa.c:648: error: 'PICT_b8g8r8a8' undeclared (first use in this func=
tion)
> make[2]: *** [nv50_exa.lo] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[2]: Leaving directory `/usr/src/packages/BUILD/xf86-video-nouveau/sr=
c'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/usr/src/packages/BUILD/xf86-video-nouveau'
> make: *** [all] Error 2
> error: Bad exit status from /var/tmp/rpm-tmp.6TqA5J (%build)
>
> Am Sonntag, 3. Januar 2010 02:15:49 schrieben Maarten Maathuis:
>> Does this patch help?
>>
>> >From f1fa2e3b15e24175fb899418bbe0d587237ca797 Mon Sep 17 00:00:00 2001
>> From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Date: Sun, 3 Jan 2010 02:14:36 +0100
>> Subject: [PATCH] exa: Some compat defines for depth 30 formats.
>>
>> Signed-off-by: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0src/nv50_exa.c | =A0 =A08 ++++++++
>> =A01 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/src/nv50_exa.c b/src/nv50_exa.c
>> index 10a3a64..c558896 100644
>> --- a/src/nv50_exa.c
>> +++ b/src/nv50_exa.c
>> @@ -431,6 +431,14 @@ NV50EXAUploadSIFC(const char *src, int src_pitch,
>> =A0 =A0 =A0 return TRUE;
>> =A0}
>>
>> +/* Compat defines for pre 1.7 xservers. */
>> +#ifndef PICT_a2b10g10r10
>> +#define PICT_a2b10g10r10 PICT_FORMAT(32, PICT_TYPE_ABGR, 2, 10, 10, 10)
>> +#define PICT_x2b10g10r10 =A0PICT_FORMAT(32, PICT_TYPE_ABGR, 0, 10, 10, =
10)
>> +#define PICT_a2r10g10b10 PICT_FORMAT(32, PICT_TYPE_ARGB, 2, 10, 10, 10)
>> +#define PICT_x2r10g10b10 PICT_FORMAT(32, PICT_TYPE_ARGB, 0, 10, 10, 10)
>> +#endif
>> +
>> =A0static Bool
>> =A0NV50EXACheckRenderTarget(PicturePtr ppict)
>> =A0{
>> > Hi,
>> >
>> > latest 2D driver does not compile.
>> >
>> > libdrm and Mesa are latest git...
>> >
>> > Johannes
>> >
>> >
>> > CC nv50_exa.lo
>> > nv50_exa.c: In function 'NV50EXACheckRenderTarget':
>> > nv50_exa.c:451: error: 'PICT_a2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:451: error: (Each undeclared identifier is reported only on=
ce
>> > nv50_exa.c:451: error: for each function it appears in.)
>> > nv50_exa.c:452: error: 'PICT_x2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:453: error: 'PICT_a2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:454: error: 'PICT_x2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c: In function 'NV50EXARenderTarget':
>> > nv50_exa.c:485: error: 'PICT_a2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:486: error: 'PICT_x2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:489: error: 'PICT_a2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:490: error: 'PICT_x2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c: In function 'NV50EXACheckTexture':
>> > nv50_exa.c:537: error: 'PICT_b8g8r8a8' undeclared (first use in this f=
unction)
>> > nv50_exa.c:538: error: 'PICT_b8g8r8x8' undeclared (first use in this f=
unction)
>> > nv50_exa.c:539: error: 'PICT_a2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:540: error: 'PICT_x2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:541: error: 'PICT_x2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:542: error: 'PICT_a2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c: In function 'NV50EXATexture':
>> > nv50_exa.c:637: error: 'PICT_b8g8r8x8' undeclared (first use in this f=
unction)
>> > nv50_exa.c:640: error: 'PICT_b8g8r8a8' undeclared (first use in this f=
unction)
>> > nv50_exa.c:643: error: 'PICT_a2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:646: error: 'PICT_x2b10g10r10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:649: error: 'PICT_x2r10g10b10' undeclared (first use in thi=
s function)
>> > nv50_exa.c:652: error: 'PICT_a2r10g10b10' undeclared (first use in thi=
s function)
>> > make[2]: *** [nv50_exa.lo] Error 1
>> > make[2]: *** Waiting for unfinished jobs....
>> > make[2]: Leaving directory `/usr/src/packages/BUILD/xf86-video-nouveau=
/src'
>> > make[1]: *** [all-recursive] Error 1
>> > make[1]: Leaving directory `/usr/src/packages/BUILD/xf86-video-nouveau'
>> > make: *** [all] Error 2
>> > error: Bad exit status from /var/tmp/rpm-tmp.8bVOVF (%build)
>> > _______________________________________________
>> > Nouveau mailing list
>> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> > http://lists.freedesktop.org/mailman/listinfo/nouveau
>> >
>>
>
> -----------------------------------------
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
