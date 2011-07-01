From: younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: nouveaufb problems with NV18
Date: Fri, 01 Jul 2011 17:13:49 +0000
Message-ID: <90e6ba6135a819446804a705242e@google.com>
References: <20110701163521.GA3162@joi.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1110918829=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110701163521.GA3162-OI9uyE9O0yo@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1110918829==
Content-Type: multipart/alternative; boundary=90e6ba6135a819445204a705242b

--90e6ba6135a819445204a705242b
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

On , Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jul 01, 2011 at 01:16:49AM -0400, George Spelvin wrote:

> > I mentioned these problems back in March, but went back to the nv driver

> > and ignored it. Since I need to reboot for another reason, I gave  
> nouveau a try again,

> >

> > This time, I'm using the kernel git tip, off of 3.0-rc5:

> > 181888bfeea73b2ec756b83fd590fd3a62d4171d: drm/nv50/dp: fix hack to work  
> for macbooks booted via EFI

> >

> > The X server is Debian's xserver-xorg-video-nouveau, version

> > 1:0.0.16+git20110411+8378443-1+b1

> >

> > The good news is that my screen "tearing" problem during system activity

> > appears to be fixed!

> > Hooray. But I still have two other problems I mentioned at the time:

> >

> > 1) The text console, although connected via DVI, appears to be about

> > half a line of text low. Tall characters (^ and $) on the top line

> > have their top row of pixels "stretched" upward, apparently replicated

> > quite a few times.

> > The bottom row of characters is only partially visible.



> Screenshot might be useful.



> >

> > 2) I can't start X. The X server fails to initialize with:

> > [ 6151.976] (II) NOUVEAU(0): Opened GPU channel 1

> > [ 6151.976] (II) NOUVEAU(0): [DRI2] Setup complete

> > [ 6151.976] (II) NOUVEAU(0): [DRI2] DRI driver: nouveau_vieux



> Can you uninstall 3d driver and check how will it behave?



> > [ 6151.977] (EE) NOUVEAU(0): Error allocating scanout buffer: 0

> > [ 6151.977]

> > Fatal server error:

> > [ 6151.977] AddScreen/ScreenInit failed for driver 0

> > [ 6151.977]

> >

> > If I can get problem 2 fixed, problem 1 will become less important.

> >

> > As mentioned in my old email, it's a uniprocessor Athlon XP system,  
> with a

> > Geforce 4 MX video adapter:

> > 04:00.0 VGA compatible controller [0300]: nVidia Corporation NV18  
> [GeForce4 MX - nForce GPU] [10de:01f0] (rev a3)



> FYI, nouveau finds it as NV1F.



> > The display is a 1920x1080 LCD, connected via DVI. No other outputs are  
> connected.



> 1920x1080x4 is almost 8MB and you have only 32MB of VRAM. It might be a  
> problem with memory allocation.

> You could verify it by applying this patch to xf86-video-nouveau and  
> checking xorg.log:



> diff --git a/src/nv_accel_common.cb/src/nv_accel_common.c

> index 735f47f..1eac357 100644

> --- a/src/nv_accel_common.c

> +++ b/src/nv_accel_common.c

> @@ -116,8 +116,10 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int  
> width, int height, int bpp,



> ret = nouveau_bo_new_tile(pNv->dev, flags, 0, *pitch * height,

> tile_mode, tile_flags, bo);

> - if (ret)

> + if (ret) {

> + xf86DrvMsg(scrn->scrnIndex, X_ERROR, "nouveau_bo_new_tile  
> returned: %d, %s\n", ret, strerror(ret));

> return FALSE;

> + }



> return TRUE;

> }



> -



> Lowering bpp/resolution for framebuffer and/or X might help. At least  
> temporarily.

Likely low on VRAM. I don't see why it would be able to create the 1st  
frame buffer for fbcon but not a 2nd for X unless it was tight on memory.

--90e6ba6135a819445204a705242b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On , Marcin Slusarz &lt;marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org&gt; wrote:<br />&gt; On Fr=
i, Jul 01, 2011 at 01:16:49AM -0400, George Spelvin wrote:<br />&gt; <br />=
&gt; &gt; I mentioned these problems back in March, but went back to the nv=
 driver<br />&gt; <br />&gt; &gt; and ignored it. =A0Since I need to reboot=
 for another reason, I gave nouveau a try again,<br />&gt; <br />&gt; &gt;<=
br />&gt; <br />&gt; &gt; This time, I&#39;m using the kernel git tip, off =
of 3.0-rc5:<br />&gt; <br />&gt; &gt; 181888bfeea73b2ec756b83fd590fd3a62d41=
71d: drm/nv50/dp: fix hack to work for macbooks booted via EFI<br />&gt; <b=
r />&gt; &gt;<br />&gt; <br />&gt; &gt; The X server is Debian&#39;s xserve=
r-xorg-video-nouveau, version<br />&gt; <br />&gt; &gt; 1:0.0.16+git2011041=
1+8378443-1+b1<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt; The good=
 news is that my screen &quot;tearing&quot; problem during system activity<=
br />&gt; <br />&gt; &gt; appears to be fixed!<br />&gt; <br />&gt; &gt; Ho=
oray. =A0But I still have two other problems I mentioned at the time:<br />=
&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt; 1) The text console, althoug=
h connected via DVI, appears to be about<br />&gt; <br />&gt; &gt; =A0 =A0h=
alf a line of text low. =A0Tall characters (^ and $) on the top line<br />&=
gt; <br />&gt; &gt; =A0 =A0have their top row of pixels &quot;stretched&quo=
t; upward, apparently replicated<br />&gt; <br />&gt; &gt; =A0 =A0quite a f=
ew times.<br />&gt; <br />&gt; &gt; =A0 =A0The bottom row of characters is =
only partially visible.<br />&gt; <br />&gt; <br />&gt; <br />&gt; Screensh=
ot might be useful.<br />&gt; <br />&gt; <br />&gt; <br />&gt; &gt;<br />&g=
t; <br />&gt; &gt; 2) I can&#39;t start X. =A0The X server fails to initial=
ize with:<br />&gt; <br />&gt; &gt; [ =A06151.976] (II) NOUVEAU(0): Opened =
GPU channel 1<br />&gt; <br />&gt; &gt; [ =A06151.976] (II) NOUVEAU(0): [DR=
I2] Setup complete<br />&gt; <br />&gt; &gt; [ =A06151.976] (II) NOUVEAU(0)=
: [DRI2] =A0 DRI driver: nouveau_vieux<br />&gt; <br />&gt; <br />&gt; <br =
/>&gt; Can you uninstall 3d driver and check how will it behave?<br />&gt; =
<br />&gt; <br />&gt; <br />&gt; &gt; [ =A06151.977] (EE) NOUVEAU(0): Error=
 allocating scanout buffer: 0<br />&gt; <br />&gt; &gt; [ =A06151.977]<br /=
>&gt; <br />&gt; &gt; Fatal server error:<br />&gt; <br />&gt; &gt; [ =A061=
51.977] AddScreen/ScreenInit failed for driver 0<br />&gt; <br />&gt; &gt; =
[ =A06151.977]<br />&gt; <br />&gt; &gt;<br />&gt; <br />&gt; &gt; If I can=
 get problem 2 fixed, problem 1 will become less important.<br />&gt; <br /=
>&gt; &gt;<br />&gt; <br />&gt; &gt; As mentioned in my old email, it&#39;s=
 a uniprocessor Athlon XP system, with a<br />&gt; <br />&gt; &gt; Geforce =
4 MX video adapter:<br />&gt; <br />&gt; &gt; 04:00.0 VGA compatible contro=
ller [0300]: nVidia Corporation NV18 [GeForce4 MX - nForce GPU] [10de:01f0]=
 (rev a3)<br />&gt; <br />&gt; <br />&gt; <br />&gt; FYI, nouveau finds it =
as NV1F.<br />&gt; <br />&gt; <br />&gt; <br />&gt; &gt; The display is a 1=
920x1080 LCD, connected via DVI. =A0No other outputs are connected.<br />&g=
t; <br />&gt; <br />&gt; <br />&gt; 1920x1080x4 is almost 8MB and you have =
only 32MB of VRAM. It might be a problem with memory allocation.<br />&gt; =
<br />&gt; You could verify it by applying this patch to xf86-video-nouveau=
 and checking xorg.log:<br />&gt; <br />&gt; <br />&gt; <br />&gt; diff --g=
it a/src/nv_accel_common.c b/src/nv_accel_common.c<br />&gt; <br />&gt; ind=
ex 735f47f..1eac357 100644<br />&gt; <br />&gt; --- a/src/nv_accel_common.c=
<br />&gt; <br />&gt; +++ b/src/nv_accel_common.c<br />&gt; <br />&gt; @@ -=
116,8 +116,10 @@ nouveau_allocate_surface(ScrnInfoPtr scrn, int width, int =
height, int bpp,<br />&gt; <br />&gt; <br />&gt; <br />&gt;  =A0 =A0 =A0 =
=A0ret =3D nouveau_bo_new_tile(pNv-&gt;dev, flags, 0, *pitch * height,<br /=
>&gt; <br />&gt;  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0tile_mode, tile_flags, bo);<br />&gt; <br />&gt; - =A0 =A0 =A0 i=
f (ret)<br />&gt; <br />&gt; + =A0 =A0 =A0 if (ret) {<br />&gt; <br />&gt; =
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 xf86DrvMsg(scrn-&gt;scrnIndex, X_ERROR, &quot=
;nouveau_bo_new_tile returned: %d, %s\n&quot;, ret, strerror(ret));<br />&g=
t; <br />&gt;  =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return FALSE;<br />&gt; <br /=
>&gt; + =A0 =A0 =A0 }<br />&gt; <br />&gt; <br />&gt; <br />&gt;  =A0 =A0 =
=A0 =A0return TRUE;<br />&gt; <br />&gt; =A0}<br />&gt; <br />&gt; <br />&g=
t; <br />&gt; -<br />&gt; <br />&gt; <br />&gt; <br />&gt; Lowering bpp/res=
olution for framebuffer and/or X might help. At least temporarily.<br /><br=
 />Likely low on VRAM. I don&#39;t see why it would be able to create the 1=
st frame buffer for fbcon but not a 2nd for X unless it was tight on memory=
.
--90e6ba6135a819445204a705242b--

--===============1110918829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1110918829==--
