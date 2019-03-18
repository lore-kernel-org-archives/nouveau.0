From: =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: Request for info on a big problems with nouveau driver
Date: Mon, 18 Mar 2019 16:31:46 -0700
Message-ID: <CADMs+9bd6Hb73L_hKdz=i8T36FW65DYZKDE-ck=Cp3dLkvXGKg@mail.gmail.com>
References: <CAEQFVGZZF362bNcC3tSapDRFbNJ20giP38i-zkwADxpga27Xow@mail.gmail.com>
 <CAAFQd5DvYYnyYoQz8zZOrk-Z5646ihxSsHVdg6HxufWVM1+43A@mail.gmail.com>
 <CADMs+9ZKG57UgtP_TH35N3eBnjUDvaWLS9FxVKnxqUnPz-ZcSw@mail.gmail.com>
 <CAEQFVGaiB4R+f24XEsard=syo7OAy7sMMD_GSJ+5zQmMvY+B6Q@mail.gmail.com>
 <CADMs+9bfG7ZbWQXiXXWWHnR9RLW8KDam7WDo=p70zCe_b2qHRQ@mail.gmail.com>
 <CAEQFVGZ_Z=cdtk8sNu==S4jJ2S__5O6Gm011p-cg7p-9AUidQQ@mail.gmail.com>
 <CADMs+9ZPk+ukzPQyRCK9jRPU-22GEJBTS0gNEPBypTNkDGEezQ@mail.gmail.com>
 <CAEQFVGb=JJZRAhmj4bm+pp0-PHkKs5iWSQvpdYei9h=i5BOcbA@mail.gmail.com>
 <CAEQFVGbANHqwxLJ5c2j_0wEho+YrhL8ERM5x7-7Rv9L9GLSXWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0129198384=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAEQFVGbANHqwxLJ5c2j_0wEho+YrhL8ERM5x7-7Rv9L9GLSXWg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Chih-Wei Huang <cwhuang-/Cx9OjMEmUl75Oa3hH2JBw@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0129198384==
Content-Type: multipart/alternative; boundary="00000000000069ae14058466cbd1"

--00000000000069ae14058466cbd1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 16, 2019 at 12:33 PM Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hi St=C3=A9phane,
>
> the good news is that Kerol Herbst patches are mitigating effectively
> the GPU lockup.
> it would really be a pity to loose and abandon nouveau driver in
> android-x86,
> while intel, radeon and amdgpu are working perfectly.
>
> The Android GUI reboots always the same way when bringing back main scree=
n,
> with home button or using square menu button.
>
> I've collected log with drm.debug level 63
> to see what is happening prior to EGL-MAIN: DRI2: failed to create
> screen/ EGL_NOT_INITIALIZED
>
> Full log and tombstone in the attachment,
> could someone in nouveau team decipher the errors?
>

That's a question more appropriate for the nouveau list, I am CCing the
list.

St=C3=A9phane


> In the logs there is also the DRM ioctl commands happening before the
> DRI screen error
>
> Mauro
>
> 03-16 18:57:03.615     0     0 E         : 00a0 2 base507c_ntfy_set
> 03-16 18:57:03.615     0     0 E         : 00000060
> 03-16 18:57:03.615     0     0 E         : f0000000
> 03-16 18:57:03.615     0     0 E         : 0084 1 base907c_image_set
> 03-16 18:57:03.615     0     0 E         : 00000010
> 03-16 18:57:03.615     0     0 E         : 00c0 1 base907c_image_set
> 03-16 18:57:03.615     0     0 E         : fb0000fe
> 03-16 18:57:03.615     0     0 E         : 0400 5 base907c_image_set
> 03-16 18:57:03.615     0     0 E         : 00010000
> 03-16 18:57:03.615     0     0 E         : 00000000
> 03-16 18:57:03.615     0     0 E         : 04000500
> 03-16 18:57:03.615     0     0 E         : 00005004
> 03-16 18:57:03.615     0     0 E         : 0000cf00
> 03-16 18:57:03.615     0     0 E         : 0080 1 base507c_update
> 03-16 18:57:03.615     0     0 E         : 00000000
> 03-16 18:57:03.616  2729  4165 W EGL-MAIN: DRI2: failed to create dri
> screen
> 03-16 18:57:03.616  2729  4165 W EGL-MAIN: DRI2: failed to create screen
> 03-16 18:57:03.617  2729  4165 W libEGL  : eglInitialize(0xad3ab800)
> failed (EGL_NOT_INITIALIZED)
> 03-16 18:57:03.617  2729  4165 I system_server:
>
> android::hardware::configstore::V1_0::ISurfaceFlingerConfigs::hasWideColo=
rDisplay
> retrieved: 0
> 03-16 18:57:03.617  2729  4165 I OpenGLRenderer: Initialized EGL, version
> 1.4
> 03-16 18:57:03.617  2729  4165 D OpenGLRenderer: Swap behavior 2
> 03-16 18:57:03.617  2729  4165 F OpenGLRenderer: Failed to choose
> config, error =3D EGL_NOT_INITIALIZED
> --------- beginning of crash
> 03-16 18:57:03.617  2729  4165 F libc    : Fatal signal 6 (SIGABRT),
> code -6 in tid 4165 (RenderThread), pid 2729 (system_server)
>
> On Tue, Mar 5, 2019 at 8:55 AM Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > Hi,
> > one of the problems (the Play Store Crash) was resolved with following
> commit:
> >
> http://git.osdn.net/view?p=3Dandroid-x86/frameworks-base.git;a=3Dcommit;h=
=3Dd488a6c2bbedc06fc22942555d0157e7bf09f135
> >
> > Now the remaining one, affecting the dEQP-EGL multithreading tests and
> > RenderThread in general,
> > has been traced in the attached logs.
> >
> > It seams a problem similar to "a second libEGL call failing" when
> > RenderThread is trying to create dri screen
> > which is killed by Android attempt to load EGL config which fails and
> > it is treated as Fatal.
> > We just need to find the root cause of failure.
> >
> > In the logcat there is a clue of what is happening:
> >
> > --------- beginning of crash
> > 03-04 20:50:56.762  1440  1440 E AndroidRuntime: FATAL EXCEPTION: main
> > 03-04 20:50:56.762  1440  1440 E AndroidRuntime: Process:
> > com.android.systemui, PID: 1440
> > 03-04 20:50:56.762  1440  1440 E AndroidRuntime:
> > java.lang.NullPointerException: Attempt to invoke virtual method
> > 'android.graphics.GraphicBuffer
> > android.graphics.Bitmap.createGraphicBufferHandle()' on a null object
> > reference
> > 03-04 20:50:56.762  1440  1440 E AndroidRuntime: at
> >
> com.android.systemui.recents.views.RecentsTransitionHelper.drawViewIntoGr=
aphicBuffer(RecentsTransitionHelper.java:436)
> >
> > Mauro
> >
> > On Tue, Mar 5, 2019 at 1:29 AM St=C3=A9phane Marchesin <marcheu@chromiu=
m.org>
> wrote:
> > >
> > >
> > >
> > > On Sat, Mar 2, 2019 at 12:08 AM Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> > >>
> > >> Hi St=C3=A9phane,
> > >>
> > >> On Fri, Mar 1, 2019 at 11:24 PM St=C3=A9phane Marchesin <
> marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >> >
> > >> >
> > >> >
> > >> > On Fri, Mar 1, 2019 at 4:30 AM Mauro Rossi <issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
> > >> >>
> > >> >> Hi St=C3=A9phane,
> > >> >>
> > >> >> thanks for responding
> > >> >>
> > >> >> On Thu, Feb 28, 2019 at 9:56 PM St=C3=A9phane Marchesin <
> marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
> > >> >> >
> > >> >> >
> > >> >> >
> > >> >> > On Tue, Feb 19, 2019 at 6:54 PM Tomasz Figa <tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
>
> wrote:
> > >> >> >>
> > >> >> >> Hi Mauro,
> > >> >> >>
> > >> >> >> Thanks for your query. I'm not very active in the graphics are=
a
> > >> >> >> anymore, but let me add +St=C3=A9phane Marchesin , who should =
know
> the
> > >> >> >> best.
> > >> >> >>
> > >> >> >> Best regards,
> > >> >> >> Tomasz
> > >> >> >>
> > >> >> >> On Wed, Feb 20, 2019 at 3:00 AM Mauro Rossi <
> issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> > >> >> >> >
> > >> >> >> > Hi Tomasz,
> > >> >> >> >
> > >> >> >> > I wanted to ask some help, even just some information about
> how
> > >> >> >> > nouveau is working with chromeos minigbm stack, because we
> have big
> > >> >> >> > issues with drm_gralloc and gbm_gralloc.
> > >> >> >> >
> > >> >> >> > nouveau gallium driver does not support Multithreading and
> oreo-x86
> > >> >> >> > has introduced additional RenderThread scenarios which cause
> > >> >> >> > instability.
> > >> >> >> >
> > >> >> >> > dEQP-EGL multithreding tests are causing GUI restarts, even
> with
> > >> >> >> > latest Karol Herbst patches with per gl context mutex lockin=
g
> and per
> > >> >> >> > fence mutex locking,
> > >> >> >> > he said there is an additional race condition that may
> require another
> > >> >> >> > major rewrite,
> > >> >> >> > but he did not mention which additional race condition.
> > >> >> >> >
> > >> >> >> > I wanted to ask you just some info, in case you may have
> them, or
> > >> >> >> > suggestions on how to avoid the problem.
> > >> >> >> >
> > >> >> >> > 1) Are you aware of problems with chromeos with nouveau MT
> and how
> > >> >> >> > they were avoided?
> > >> >> >> > At the moment I can boot with minigbm, but the navigation ba=
r
> and menu
> > >> >> >> > bar are trasparent and invisible, so I was not able to check
> if
> > >> >> >> > minigbm has same problems we have.
> > >> >> >> >
> > >> >> >> > 2) We are so stuck with nouveau support that I was thinking
> to explore
> > >> >> >> > another angle,
> > >> >> >> > is it possible to disable additional threads in android-x86
> code base for Oreo?
> > >> >> >> > Do you have some colleagues that may provide indication on
> how to do it?
> > >> >> >> >
> > >> >> >
> > >> >> >
> > >> >> > Hi Mauro,
> > >> >> >
> > >> >> > We don't officially support nouveau on Chrome OS (there are no
> devices which use it). The nouveau minigbm driver was written to be able =
to
> develop Chrome for Chrome OS on top of a Linux workstation with an nvidia
> GPU. In particular, we have never started Android with that configuration=
.
> > >> >> >
> > >> >> > Can you give more details on issue 1, i.e. what is invisible?
> Last I looked Chrome was working. Are you certain this is related to
> threading?
> > >> >> >
> > >> >> > St=C3=A9phane
> > >> >>
> > >> >> [minigbm issue]
> > >> >>
> > >> >> The problem with minigbm was mentioned after trying to exploit
> minigbm
> > >> >> as it is in Chrome OS stack (which supports running Android
> > >> >> applications AFAIK)
> > >> >>
> > >> >> The stock minigbm was not ready to boot in android-x86, lambdadro=
id
> > >> >> added dma fb support and I added some required formats (RGBA, RGB=
X,
> > >> >> RGB565)
> > >> >> to be able to boot:
> > >> >> https://github.com/maurossi/minigbm/commits/minigbm_fb
> > >> >>
> > >> >> Using that version of minigbm with android-x86 (oreo-x86) I see i=
s
> > >> >> that Android GUI top bar, bottom menu bar, icons and cursor are
> > >> >> invisible/not rendered,
> > >> >> even if blind interaction is possible.
> > >> >> Maybe I've done something wrong because the drm format selection =
in
> > >> >> minigbm is not as easy to underdestrand as drm_gralloc and
> gbm_gralloc
> > >> >> ones.
> > >> >
> > >> >
> > >> > Yeah as I said, we never ran any Android with the nouveau minigbm
> driver, not ARC++, even less Android, so I don't know.
> > >> >
> > >> >>
> > >> >>
> > >> >> The GUI transparency (or missing rendering) with minigbm does not
> seem
> > >> >> related to multiple threads using same GL context,
> > >> >> however the GPU lookups and failure of dEQP-EGL multithreading
> tests
> > >> >> happening also with drm_gralloc and gbm_gralloc are certainly
> related.
> > >> >>
> > >> >> [MT issues]
> > >> >>
> > >> >> Since it is already assessed and known that nouveau lacks MT
> support
> > >> >> as per other mesa drivers i965, radeon, amdgpu
> > >> >> and Karol Herbst submitted patches to mesa-dev to bring "per gl
> > >> >> context mutex" and "per fence mutex locking" in nouveau,
> > >> >> I tried to run CTS dEQP-EGL with mesa GLES/EGL built with those
> patches,
> > >> >> the result was that dEQP-EGL multithreading tests failed causing
> GUI
> > >> >> reboots or PC restarts.
> > >> >>
> > >> >
> > >> > I am surprised by that; we have no problem with android on radeon
> which uses gallium which would have the same issues.
> > >>
> > >> We have no problem with radeon too,
> > >> but for nouveau there is an history of GPU lockups with android-x86
> as we speak,
> > >> Ilia Mirkin confirmed in several different bugzilla tickets that
> > >> nouveau does not react well to multiple threads workers on same gl
> > >> context.
> > >
> > >
> > >
> > > Hmm if you get GPU lockups, yes that's a different problem.
> > >
> > >
> > >>
> > >>
> > >> Infact with some prototypal mutex locking patches we had a mitigatio=
n
> > >> for android-x86 releases from lollipop-x86 to nougat-x86
> > >>
> > >> Karol Hebst submitted patches to mesa-dev on last december for that
> > >> exact same problem,
> > >> the patches are not yet up-streamed, so technically the problem is
> still there.
> > >>
> > >> The current Use Case is android-x86, but the first next GUI using
> > >> multiple threads will have problems too.
> > >>
> > >> >
> > >> >
> > >> >> Having contacted Karol Herbst he told that there may be one
> additional
> > >> >> race condition, but he did not clarified which one.
> > >> >>
> > >> >> What about launching dEQP-EGL on platform different from android,
> e.g.
> > >> >> EGL wayland is that possible to see if the tests also fail on Lin=
ux
> > >> >> platform?
> > >> >
> > >> >
> > >> > We use the surfaceless/null backend for deqp. We have upstreamed
> it, you should be able to use that also. Otherwise I have used the glx
> backend successfully as well on my desktop.
> > >>
> > >> Could it be that in your scenario there is only one thread per gl
> > >> context at a time?
> > >>
> > >
> > > In general, most of deqp is one GL context at a time, unless you run
> the parallel deqp stuff. So yes it would probably help. Similarly Chrome =
OS
> is running pretty much in a single GPU process, so we wouldn't see that
> problem either when running nouveau.
> > >
> > >
> > >>
> > >> >
> > >> >
> > >> >>
> > >> >> Are there similar tests in piglit?
> > >> >
> > >> >
> > >> > I'm not aware of any, but I stopped using piglit years ago.
> > >> >
> > >> >>
> > >> >>
> > >> >> [Other issue appeared with Android 8 Oreo hardware bitmaps]
> > >> >>
> > >> >> System UI and Play Store crashes, are happening after successful
> > >> >> android-x86 boot with drm_gralloc and gbm_gralloc,
> > >> >> these crashes seem to be very much related to this path:
> > >> >> CreateHardwareBitmap -> CreateBitmap -> Null Pointer Exception.
> > >> >> CreateHardwareBitmap (introduced in Android Oreo),
> > >> >
> > >> >
> > >> > Seems like you are missing dri extensions?
> > >>
> > >> Checking in the logcat the boot with nouveau has all extensions as p=
er
> > >> other drivers,
> > >> but it has DRI_IMAGE twice, is that bad?
> > >>
> > >> 02-02 10:35:37.176  2489  2489 D vndksupport: Loading
> > >> /vendor/lib/egl/libGLES_mesa.so from current namespace instead of
> > >> sphal namespace.
> > >> 02-02 10:35:37.188  2489  2489 D libEGL  : loaded
> > >> /vendor/lib/egl/libGLES_mesa.so
> > >> 02-02 10:35:37.251  2489  2489 D vndksupport: Loading
> > >> /vendor/lib/hw/gralloc.gbm.so from current namespace instead of spha=
l
> > >> namespace.
> > >> 02-02 10:35:37.253  2489  2489 I EGL-MAIN: found extension DRI_Core
> version 2
> > >> 02-02 10:35:37.253  2489  2489 I EGL-MAIN: found extension
> > >> DRI_IMAGE_DRIVER version 1
> > >> 02-02 10:35:37.253  2489  2489 I EGL-MAIN: found extension
> > >> DRI_ConfigOptions version 2
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension
> > >> DRI_TexBuffer version 2
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension DRI2_Flus=
h
> version 4
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension DRI_IMAGE
> version 17
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension DRI_IMAGE
> version 17
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension
> > >> DRI_RENDERER_QUERY version 1
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension
> > >> DRI_CONFIG_QUERY version 1
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension DRI2_Fenc=
e
> version 2
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension
> > >> DRI2_Interop version 1
> > >> 02-02 10:35:37.257  2489  2489 I EGL-MAIN: found extension
> DRI_NoError version 1
> > >>
> > >
> > > Can you put it in gdb and see where the NULL crash is? One can only
> intuit about what's going on otherwise.
> > >
> > > St=C3=A9phane
> > >
> > >
> > >>
> > >> >
> > >> > St=C3=A9phane
> > >> >
> > >> >
> > >> >>
> > >> >> uses only one copy
> > >> >> of bitmap instead of two, are there some restrictions in nouveau
> with
> > >> >> RGBA/RGBX, BGRA hardware bitmaps?
> > >> >>
> > >> >> Thanks in advance for any info, suggestions
> > >> >> I am available and ready to support testing/verifications to see
> the
> > >> >> MT and HardwareBitmap issues solved.
> > >> >>
> > >> >> Mauro
> > >> >>
> > >> >>
> > >> >>
> > >> >> >
> > >> >> >
> > >> >> >>
> > >> >> >> > Mauro
>

--00000000000069ae14058466cbd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 16, 2019 at 12:33 PM Maur=
o Rossi &lt;<a href=3D"mailto:issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
i St=C3=A9phane,<br>
<br>
the good news is that Kerol Herbst patches are mitigating effectively<br>
the GPU lockup.<br>
it would really be a pity to loose and abandon nouveau driver in android-x8=
6,<br>
while intel, radeon and amdgpu are working perfectly.<br>
<br>
The Android GUI reboots always the same way when bringing back main screen,=
<br>
with home button or using square menu button.<br>
<br>
I&#39;ve collected log with drm.debug level 63<br>
to see what is happening prior to EGL-MAIN: DRI2: failed to create<br>
screen/ EGL_NOT_INITIALIZED<br>
<br>
Full log and tombstone in the attachment,<br>
could someone in nouveau team decipher the errors?<br></blockquote><div><br=
></div><div>That&#39;s a question more appropriate for the nouveau list, I =
am CCing the list.</div><div><br></div><div>St=C3=A9phane</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
In the logs there is also the DRM ioctl commands happening before the<br>
DRI screen error<br>
<br>
Mauro<br>
<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00a0 2 base507c_ntfy_set<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00000060<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: f0000000<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 0084 1 base907c_image_set<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00000010<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00c0 1 base907c_image_set<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: fb0000fe<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 0400 5 base907c_image_set<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00010000<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00000000<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 04000500<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00005004<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 0000cf00<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 0080 1 base507c_update<br>
03-16 18:57:03.615=C2=A0 =C2=A0 =C2=A00=C2=A0 =C2=A0 =C2=A00 E=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0: 00000000<br>
03-16 18:57:03.616=C2=A0 2729=C2=A0 4165 W EGL-MAIN: DRI2: failed to create=
 dri screen<br>
03-16 18:57:03.616=C2=A0 2729=C2=A0 4165 W EGL-MAIN: DRI2: failed to create=
 screen<br>
03-16 18:57:03.617=C2=A0 2729=C2=A0 4165 W libEGL=C2=A0 : eglInitialize(0xa=
d3ab800)<br>
failed (EGL_NOT_INITIALIZED)<br>
03-16 18:57:03.617=C2=A0 2729=C2=A0 4165 I system_server:<br>
android::hardware::configstore::V1_0::ISurfaceFlingerConfigs::hasWideColorD=
isplay<br>
retrieved: 0<br>
03-16 18:57:03.617=C2=A0 2729=C2=A0 4165 I OpenGLRenderer: Initialized EGL,=
 version 1.4<br>
03-16 18:57:03.617=C2=A0 2729=C2=A0 4165 D OpenGLRenderer: Swap behavior 2<=
br>
03-16 18:57:03.617=C2=A0 2729=C2=A0 4165 F OpenGLRenderer: Failed to choose=
<br>
config, error =3D EGL_NOT_INITIALIZED<br>
--------- beginning of crash<br>
03-16 18:57:03.617=C2=A0 2729=C2=A0 4165 F libc=C2=A0 =C2=A0 : Fatal signal=
 6 (SIGABRT),<br>
code -6 in tid 4165 (RenderThread), pid 2729 (system_server)<br>
<br>
On Tue, Mar 5, 2019 at 8:55 AM Mauro Rossi &lt;<a href=3D"mailto:issor.orua=
m@gmail.com" target=3D"_blank">issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt; one of the problems (the Play Store Crash) was resolved with following=
 commit:<br>
&gt; <a href=3D"http://git.osdn.net/view?p=3Dandroid-x86/frameworks-base.gi=
t;a=3Dcommit;h=3Dd488a6c2bbedc06fc22942555d0157e7bf09f135" rel=3D"noreferre=
r" target=3D"_blank">http://git.osdn.net/view?p=3Dandroid-x86/frameworks-ba=
se.git;a=3Dcommit;h=3Dd488a6c2bbedc06fc22942555d0157e7bf09f135</a><br>
&gt;<br>
&gt; Now the remaining one, affecting the dEQP-EGL multithreading tests and=
<br>
&gt; RenderThread in general,<br>
&gt; has been traced in the attached logs.<br>
&gt;<br>
&gt; It seams a problem similar to &quot;a second libEGL call failing&quot;=
 when<br>
&gt; RenderThread is trying to create dri screen<br>
&gt; which is killed by Android attempt to load EGL config which fails and<=
br>
&gt; it is treated as Fatal.<br>
&gt; We just need to find the root cause of failure.<br>
&gt;<br>
&gt; In the logcat there is a clue of what is happening:<br>
&gt;<br>
&gt; --------- beginning of crash<br>
&gt; 03-04 20:50:56.762=C2=A0 1440=C2=A0 1440 E AndroidRuntime: FATAL EXCEP=
TION: main<br>
&gt; 03-04 20:50:56.762=C2=A0 1440=C2=A0 1440 E AndroidRuntime: Process:<br=
>
&gt; com.android.systemui, PID: 1440<br>
&gt; 03-04 20:50:56.762=C2=A0 1440=C2=A0 1440 E AndroidRuntime:<br>
&gt; java.lang.NullPointerException: Attempt to invoke virtual method<br>
&gt; &#39;android.graphics.GraphicBuffer<br>
&gt; android.graphics.Bitmap.createGraphicBufferHandle()&#39; on a null obj=
ect<br>
&gt; reference<br>
&gt; 03-04 20:50:56.762=C2=A0 1440=C2=A0 1440 E AndroidRuntime: at<br>
&gt; com.android.systemui.recents.views.RecentsTransitionHelper.drawViewInt=
oGraphicBuffer(RecentsTransitionHelper.java:436)<br>
&gt;<br>
&gt; Mauro<br>
&gt;<br>
&gt; On Tue, Mar 5, 2019 at 1:29 AM St=C3=A9phane Marchesin &lt;<a href=3D"=
mailto:marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" target=3D"_blank">marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org</a>&gt;=
 wrote:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Sat, Mar 2, 2019 at 12:08 AM Mauro Rossi &lt;<a href=3D"mailto=
:issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt; wro=
te:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hi St=C3=A9phane,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Fri, Mar 1, 2019 at 11:24 PM St=C3=A9phane Marchesin &lt;<=
a href=3D"mailto:marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" target=3D"_blank">marcheu@chromium.o=
rg</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; On Fri, Mar 1, 2019 at 4:30 AM Mauro Rossi &lt;<a href=
=3D"mailto:issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</=
a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Hi St=C3=A9phane,<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; thanks for responding<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; On Thu, Feb 28, 2019 at 9:56 PM St=C3=A9phane Marche=
sin &lt;<a href=3D"mailto:marcheu-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" target=3D"_blank">marcheu@c=
hromium.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; On Tue, Feb 19, 2019 at 6:54 PM Tomasz Figa &lt=
;<a href=3D"mailto:tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" target=3D"_blank">tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org=
</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; Hi Mauro,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; Thanks for your query. I&#39;m not very act=
ive in the graphics area<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; anymore, but let me add +St=C3=A9phane Marc=
hesin , who should know the<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; best.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; Best regards,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; Tomasz<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; On Wed, Feb 20, 2019 at 3:00 AM Mauro Rossi=
 &lt;<a href=3D"mailto:issor.oruam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">issor.oruam=
@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Hi Tomasz,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; I wanted to ask some help, even just s=
ome information about how<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; nouveau is working with chromeos minig=
bm stack, because we have big<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; issues with drm_gralloc and gbm_grallo=
c.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; nouveau gallium driver does not suppor=
t Multithreading and oreo-x86<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; has introduced additional RenderThread=
 scenarios which cause<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; instability.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; dEQP-EGL multithreding tests are causi=
ng GUI restarts, even with<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; latest Karol Herbst patches with per g=
l context mutex locking and per<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; fence mutex locking,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; he said there is an additional race co=
ndition that may require another<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; major rewrite,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; but he did not mention which additiona=
l race condition.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; I wanted to ask you just some info, in=
 case you may have them, or<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; suggestions on how to avoid the proble=
m.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; 1) Are you aware of problems with chro=
meos with nouveau MT and how<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; they were avoided?<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; At the moment I can boot with minigbm,=
 but the navigation bar and menu<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; bar are trasparent and invisible, so I=
 was not able to check if<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; minigbm has same problems we have.<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; 2) We are so stuck with nouveau suppor=
t that I was thinking to explore<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; another angle,<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; is it possible to disable additional t=
hreads in android-x86 code base for Oreo?<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Do you have some colleagues that may p=
rovide indication on how to do it?<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Hi Mauro,<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; We don&#39;t officially support nouveau on Chro=
me OS (there are no devices which use it). The nouveau minigbm driver was w=
ritten to be able to develop Chrome for Chrome OS on top of a Linux worksta=
tion with an nvidia GPU. In particular, we have never started Android with =
that configuration.<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Can you give more details on issue 1, i.e. what=
 is invisible? Last I looked Chrome was working. Are you certain this is re=
lated to threading?<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; St=C3=A9phane<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; [minigbm issue]<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; The problem with minigbm was mentioned after trying =
to exploit minigbm<br>
&gt; &gt;&gt; &gt;&gt; as it is in Chrome OS stack (which supports running =
Android<br>
&gt; &gt;&gt; &gt;&gt; applications AFAIK)<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; The stock minigbm was not ready to boot in android-x=
86, lambdadroid<br>
&gt; &gt;&gt; &gt;&gt; added dma fb support and I added some required forma=
ts (RGBA, RGBX,<br>
&gt; &gt;&gt; &gt;&gt; RGB565)<br>
&gt; &gt;&gt; &gt;&gt; to be able to boot:<br>
&gt; &gt;&gt; &gt;&gt; <a href=3D"https://github.com/maurossi/minigbm/commi=
ts/minigbm_fb" rel=3D"noreferrer" target=3D"_blank">https://github.com/maur=
ossi/minigbm/commits/minigbm_fb</a><br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Using that version of minigbm with android-x86 (oreo=
-x86) I see is<br>
&gt; &gt;&gt; &gt;&gt; that Android GUI top bar, bottom menu bar, icons and=
 cursor are<br>
&gt; &gt;&gt; &gt;&gt; invisible/not rendered,<br>
&gt; &gt;&gt; &gt;&gt; even if blind interaction is possible.<br>
&gt; &gt;&gt; &gt;&gt; Maybe I&#39;ve done something wrong because the drm =
format selection in<br>
&gt; &gt;&gt; &gt;&gt; minigbm is not as easy to underdestrand as drm_grall=
oc and gbm_gralloc<br>
&gt; &gt;&gt; &gt;&gt; ones.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Yeah as I said, we never ran any Android with the nouvea=
u minigbm driver, not ARC++, even less Android, so I don&#39;t know.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; The GUI transparency (or missing rendering) with min=
igbm does not seem<br>
&gt; &gt;&gt; &gt;&gt; related to multiple threads using same GL context,<b=
r>
&gt; &gt;&gt; &gt;&gt; however the GPU lookups and failure of dEQP-EGL mult=
ithreading tests<br>
&gt; &gt;&gt; &gt;&gt; happening also with drm_gralloc and gbm_gralloc are =
certainly related.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; [MT issues]<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Since it is already assessed and known that nouveau =
lacks MT support<br>
&gt; &gt;&gt; &gt;&gt; as per other mesa drivers i965, radeon, amdgpu<br>
&gt; &gt;&gt; &gt;&gt; and Karol Herbst submitted patches to mesa-dev to br=
ing &quot;per gl<br>
&gt; &gt;&gt; &gt;&gt; context mutex&quot; and &quot;per fence mutex lockin=
g&quot; in nouveau,<br>
&gt; &gt;&gt; &gt;&gt; I tried to run CTS dEQP-EGL with mesa GLES/EGL built=
 with those patches,<br>
&gt; &gt;&gt; &gt;&gt; the result was that dEQP-EGL multithreading tests fa=
iled causing GUI<br>
&gt; &gt;&gt; &gt;&gt; reboots or PC restarts.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I am surprised by that; we have no problem with android =
on radeon which uses gallium which would have the same issues.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; We have no problem with radeon too,<br>
&gt; &gt;&gt; but for nouveau there is an history of GPU lockups with andro=
id-x86 as we speak,<br>
&gt; &gt;&gt; Ilia Mirkin confirmed in several different bugzilla tickets t=
hat<br>
&gt; &gt;&gt; nouveau does not react well to multiple threads workers on sa=
me gl<br>
&gt; &gt;&gt; context.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Hmm if you get GPU lockups, yes that&#39;s a different problem.<b=
r>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Infact with some prototypal mutex locking patches we had a mi=
tigation<br>
&gt; &gt;&gt; for android-x86 releases from lollipop-x86 to nougat-x86<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Karol Hebst submitted patches to mesa-dev on last december fo=
r that<br>
&gt; &gt;&gt; exact same problem,<br>
&gt; &gt;&gt; the patches are not yet up-streamed, so technically the probl=
em is still there.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The current Use Case is android-x86, but the first next GUI u=
sing<br>
&gt; &gt;&gt; multiple threads will have problems too.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; Having contacted Karol Herbst he told that there may=
 be one additional<br>
&gt; &gt;&gt; &gt;&gt; race condition, but he did not clarified which one.<=
br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; What about launching dEQP-EGL on platform different =
from android, e.g.<br>
&gt; &gt;&gt; &gt;&gt; EGL wayland is that possible to see if the tests als=
o fail on Linux<br>
&gt; &gt;&gt; &gt;&gt; platform?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; We use the surfaceless/null backend for deqp. We have up=
streamed it, you should be able to use that also. Otherwise I have used the=
 glx backend successfully as well on my desktop.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Could it be that in your scenario there is only one thread pe=
r gl<br>
&gt; &gt;&gt; context at a time?<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; In general, most of deqp is one GL context at a time, unless you =
run the parallel deqp stuff. So yes it would probably help. Similarly Chrom=
e OS is running pretty much in a single GPU process, so we wouldn&#39;t see=
 that problem either when running nouveau.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Are there similar tests in piglit?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I&#39;m not aware of any, but I stopped using piglit yea=
rs ago.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; [Other issue appeared with Android 8 Oreo hardware b=
itmaps]<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; System UI and Play Store crashes, are happening afte=
r successful<br>
&gt; &gt;&gt; &gt;&gt; android-x86 boot with drm_gralloc and gbm_gralloc,<b=
r>
&gt; &gt;&gt; &gt;&gt; these crashes seem to be very much related to this p=
ath:<br>
&gt; &gt;&gt; &gt;&gt; CreateHardwareBitmap -&gt; CreateBitmap -&gt; Null P=
ointer Exception.<br>
&gt; &gt;&gt; &gt;&gt; CreateHardwareBitmap (introduced in Android Oreo),<b=
r>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Seems like you are missing dri extensions?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Checking in the logcat the boot with nouveau has all extensio=
ns as per<br>
&gt; &gt;&gt; other drivers,<br>
&gt; &gt;&gt; but it has DRI_IMAGE twice, is that bad?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 02-02 10:35:37.176=C2=A0 2489=C2=A0 2489 D vndksupport: Loadi=
ng<br>
&gt; &gt;&gt; /vendor/lib/egl/libGLES_mesa.so from current namespace instea=
d of<br>
&gt; &gt;&gt; sphal namespace.<br>
&gt; &gt;&gt; 02-02 10:35:37.188=C2=A0 2489=C2=A0 2489 D libEGL=C2=A0 : loa=
ded<br>
&gt; &gt;&gt; /vendor/lib/egl/libGLES_mesa.so<br>
&gt; &gt;&gt; 02-02 10:35:37.251=C2=A0 2489=C2=A0 2489 D vndksupport: Loadi=
ng<br>
&gt; &gt;&gt; /vendor/lib/hw/<a href=3D"http://gralloc.gbm.so" rel=3D"noref=
errer" target=3D"_blank">gralloc.gbm.so</a> from current namespace instead =
of sphal<br>
&gt; &gt;&gt; namespace.<br>
&gt; &gt;&gt; 02-02 10:35:37.253=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension DRI_Core version 2<br>
&gt; &gt;&gt; 02-02 10:35:37.253=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension<br>
&gt; &gt;&gt; DRI_IMAGE_DRIVER version 1<br>
&gt; &gt;&gt; 02-02 10:35:37.253=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension<br>
&gt; &gt;&gt; DRI_ConfigOptions version 2<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension<br>
&gt; &gt;&gt; DRI_TexBuffer version 2<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension DRI2_Flush version 4<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension DRI_IMAGE version 17<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension DRI_IMAGE version 17<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension<br>
&gt; &gt;&gt; DRI_RENDERER_QUERY version 1<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension<br>
&gt; &gt;&gt; DRI_CONFIG_QUERY version 1<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension DRI2_Fence version 2<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension<br>
&gt; &gt;&gt; DRI2_Interop version 1<br>
&gt; &gt;&gt; 02-02 10:35:37.257=C2=A0 2489=C2=A0 2489 I EGL-MAIN: found ex=
tension DRI_NoError version 1<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Can you put it in gdb and see where the NULL crash is? One can on=
ly intuit about what&#39;s going on otherwise.<br>
&gt; &gt;<br>
&gt; &gt; St=C3=A9phane<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; St=C3=A9phane<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; uses only one copy<br>
&gt; &gt;&gt; &gt;&gt; of bitmap instead of two, are there some restriction=
s in nouveau with<br>
&gt; &gt;&gt; &gt;&gt; RGBA/RGBX, BGRA hardware bitmaps?<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Thanks in advance for any info, suggestions<br>
&gt; &gt;&gt; &gt;&gt; I am available and ready to support testing/verifica=
tions to see the<br>
&gt; &gt;&gt; &gt;&gt; MT and HardwareBitmap issues solved.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Mauro<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;&gt; &gt; Mauro<br>
</blockquote></div></div>

--00000000000069ae14058466cbd1--

--===============0129198384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0129198384==--
