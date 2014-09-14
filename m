From: Roy Spliet <seven-FA6nBp6kBxZzu6KWmfFNGwC/G2K4zDHf@public.gmane.org>
Subject: Re: VGA resume & thaw (wake up from S3 & S4) broken -
 kernel(nouveau) exclusively
Date: Sun, 14 Sep 2014 11:53:16 +0200
Message-ID: <5415658C.2080501@nimrod-online.com>
References: <5413CEA5.3060403@gmail.com>	<5413CFD1.4020300@gmail.com>	<5414AEA4.4020707@gmail.com>
 <CAKb7UviW9YTxHiJN6wjE122QF4r2Z2zx1Q8D+Uvk2GYtXsxtrQ@mail.gmail.com>
 <5414B64D.4080801@gmail.com> <5414BAFF.1030104@nimrod-online.com>
 <5415527A.7090502@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5415527A.7090502-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Mailing-List fedora-kernel <kernel-TuqUDEhatI4ANWPb/1PvSmm0pvjS0E/A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Op 14-09-14 om 10:31 schreef poma:
> On 13.09.2014 23:45, Roy Spliet wrote:
>> Dear Poma,
>>
>> Don't get anyone wrong, your input is greatly valued. The reason why
>> "we" (nouveau developers) generally ask for a git bisection is because
>> we don't know or track specific distributions. Although your search has
>> narrowed the problem down (thanks for that!), we don't know how big the
>> difference is between kernel-3.16.0-0.rc0.git9.1.fc21 and
>> kernel-3.16.0-0.rc0.git10.1.fc21. Is the difference literally just that
>> one patch? Or were there more patches to nouveau or drm that might have
>> been the culprit? So far I haven't succeeded in finding the exact
>> differences between the two kernels. Git bisect on the upstream kernel
>> on the other hand will always point at the precise patch that broke the
>> kernel, narrowing down the search space of the bug for developers thus
>> reducing the time it takes to fix your issue. Unless developers can
>> reproduce your issue, Unfortunately the user is the person who has to do
>> the bisecting.
>> So in short: narrowing down the search space often saves a lot of time
>> of the developer, reducing the time it takes to fix your issue!
>> Thus, if you can find the time to perform a git bisect (with the right
>> good/bad markers it really should not take that many kernels to build),
>> or if you can validate that the patch you mention *really* is the only
>> difference between the two kernels, it'd be greatly appreciated.
>> Thanks! Yours,
>>
>> Roy
>>
> Are you saying Fedora kernels aren't valid for testing purposes!?
No, that's not what I'm saying. You used a Fedora kernel which is fairly =

recent and found a bug. However, they're less useful for pinpointing =

your problem to  the offending bit of code, as you demonstrate below.
> Madre m=EDa!
Salud...
>
> Moreover, this regression is not just for my device.
> Apart from Ben, in "Red Fedora" there are several skilled kernel develope=
rs.
> Why they do not help!?
> Everything is on the user's back, really?
>
>
> WORKING VIDEO RESUME/THAW KERNEL:
>
> $ ls -1 kernel-3.16.0-0.rc0.git9.1.fc21.src/*.xz
> kernel-3.16.0-0.rc0.git9.1.fc21.src/linux-3.15.tar.xz
> kernel-3.16.0-0.rc0.git9.1.fc21.src/patch-3.15-git9.xz
>
> $ xzgrep -P '(?=3D.*^diff)(?=3D.*nouveau)' kernel-3.16.0-0.rc0.git9.1.fc2=
1.src/patch-3.15-git9.xz
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
>
> $ grep nouveau kernel-3.16.0-0.rc0.git9.1.fc21.src/*.patch
> kernel-3.16.0-0.rc0.git9.1.fc21.src/acpi-video-Add-use-native-backlight-q=
uirk-for-the-Th.patch:"nouveau: Don't check acpi_video_backlight_support() =
before registering backlight"
>
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> BROKEN VIDEO RESUME/THAW KERNEL:
>
> $ ls -1 kernel-3.16.0-0.rc0.git10.1.fc21.src/*.xz
> kernel-3.16.0-0.rc0.git10.1.fc21.src/linux-3.15.tar.xz
> kernel-3.16.0-0.rc0.git10.1.fc21.src/patch-3.15-git10.xz
>
> $ xzgrep -P '(?=3D.*^diff)(?=3D.*nouveau)' kernel-3.16.0-0.rc0.git10.1.fc=
21.src/patch-3.15-git10.xz
> diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/M=
akefile
> diff --git a/drivers/gpu/drm/nouveau/core/core/event.c b/drivers/gpu/drm/=
nouveau/core/core/event.c
> diff --git a/drivers/gpu/drm/nouveau/core/core/object.c b/drivers/gpu/drm=
/nouveau/core/core/object.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/gm100.c b/drivers=
/gpu/drm/nouveau/core/engine/device/gm100.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv04.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nv04.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv10.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nv10.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv20.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nv20.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv30.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nv30.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv40.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nv40.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nv50.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nvc0.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/device/nve0.c b/drivers/=
gpu/drm/nouveau/core/engine/device/nve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/base.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/conn.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/conn.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/conn.h b/drivers/gp=
u/drm/nouveau/core/engine/disp/conn.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dport.c b/drivers/g=
pu/drm/nouveau/core/engine/disp/dport.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/dport.h b/drivers/g=
pu/drm/nouveau/core/engine/disp/dport.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/gm107.c b/drivers/g=
pu/drm/nouveau/core/engine/disp/gm107.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv04.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nv04.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.h b/drivers/gp=
u/drm/nouveau/core/engine/disp/nv50.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv84.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nv84.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv94.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nv94.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nva0.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nva0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nva3.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nva3.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nvd0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nve0.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvf0.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/nvf0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/outp.c b/drivers/gp=
u/drm/nouveau/core/engine/disp/outp.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/outp.h b/drivers/gp=
u/drm/nouveau/core/engine/disp/outp.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/outpdp.c b/drivers/=
gpu/drm/nouveau/core/engine/disp/outpdp.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/outpdp.h b/drivers/=
gpu/drm/nouveau/core/engine/disp/outpdp.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/piornv50.c b/driver=
s/gpu/drm/nouveau/core/engine/disp/piornv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/priv.h b/drivers/gp=
u/drm/nouveau/core/engine/disp/priv.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c b/drivers=
/gpu/drm/nouveau/core/engine/disp/sornv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/sornv94.c b/drivers=
/gpu/drm/nouveau/core/engine/disp/sornv94.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/sornvd0.c b/drivers=
/gpu/drm/nouveau/core/engine/disp/sornvd0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/base.c b/drivers/gp=
u/drm/nouveau/core/engine/fifo/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/gk20a.c b/drivers/g=
pu/drm/nouveau/core/engine/fifo/gk20a.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv04.c b/drivers/gp=
u/drm/nouveau/core/engine/fifo/nv04.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nv84.c b/drivers/gp=
u/drm/nouveau/core/engine/fifo/nv84.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nvc0.c b/drivers/gp=
u/drm/nouveau/core/engine/fifo/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.c b/drivers/gp=
u/drm/nouveau/core/engine/fifo/nve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/fifo/nve0.h b/drivers/gp=
u/drm/nouveau/core/engine/fifo/nve0.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxgk20a.c b/drive=
rs/gpu/drm/nouveau/core/engine/graph/ctxgk20a.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnv108.c b/drive=
rs/gpu/drm/nouveau/core/engine/graph/ctxnv108.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.h b/driver=
s/gpu/drm/nouveau/core/engine/graph/ctxnvc0.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnve4.c b/driver=
s/gpu/drm/nouveau/core/engine/graph/ctxnve4.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvf0.c b/driver=
s/gpu/drm/nouveau/core/engine/graph/ctxnvf0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/gk20a.c b/drivers/=
gpu/drm/nouveau/core/engine/graph/gk20a.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nv50.c b/drivers/g=
pu/drm/nouveau/core/engine/graph/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/g=
pu/drm/nouveau/core/engine/graph/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.h b/drivers/g=
pu/drm/nouveau/core/engine/graph/nvc0.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nve4.c b/drivers/g=
pu/drm/nouveau/core/engine/graph/nve4.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nv50.c b/driver=
s/gpu/drm/nouveau/core/engine/software/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nv50.h b/driver=
s/gpu/drm/nouveau/core/engine/software/nv50.h
> diff --git a/drivers/gpu/drm/nouveau/core/engine/software/nvc0.c b/driver=
s/gpu/drm/nouveau/core/engine/software/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/class.h b/drivers/=
gpu/drm/nouveau/core/include/core/class.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/core/event.h b/drivers/=
gpu/drm/nouveau/core/include/core/event.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/engine/disp.h b/drivers=
/gpu/drm/nouveau/core/include/engine/disp.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/engine/fifo.h b/drivers=
/gpu/drm/nouveau/core/include/engine/fifo.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/engine/graph.h b/driver=
s/gpu/drm/nouveau/core/include/engine/graph.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bios/conn.h b/dr=
ivers/gpu/drm/nouveau/core/include/subdev/bios/conn.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/bios/dp.h b/driv=
ers/gpu/drm/nouveau/core/include/subdev/bios/dp.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/clock.h b/driver=
s/gpu/drm/nouveau/core/include/subdev/clock.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/fb.h b/drivers/g=
pu/drm/nouveau/core/include/subdev/fb.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/gpio.h b/drivers=
/gpu/drm/nouveau/core/include/subdev/gpio.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/i2c.h b/drivers/=
gpu/drm/nouveau/core/include/subdev/i2c.h
> diff --git a/drivers/gpu/drm/nouveau/core/include/subdev/ibus.h b/drivers=
/gpu/drm/nouveau/core/include/subdev/ibus.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/base.c b/drivers/gpu=
/drm/nouveau/core/subdev/bar/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c b/drivers/gpu=
/drm/nouveau/core/subdev/bar/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/base.c b/drivers/gp=
u/drm/nouveau/core/subdev/bios/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/conn.c b/drivers/gp=
u/drm/nouveau/core/subdev/bios/conn.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/dp.c b/drivers/gpu/=
drm/nouveau/core/subdev/bios/dp.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/init.c b/drivers/gp=
u/drm/nouveau/core/subdev/bios/init.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/base.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nv04.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nv04.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nv40.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nv40.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nv50.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nva3.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nva3.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvaa.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nvaa.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nvc0.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/clock/nve0.c b/drivers/g=
pu/drm/nouveau/core/subdev/clock/nve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/gk20a.c b/drivers/gpu=
/drm/nouveau/core/subdev/fb/gk20a.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/priv.h b/drivers/gpu/=
drm/nouveau/core/subdev/fb/priv.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/=
gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnv50.c b/drivers/g=
pu/drm/nouveau/core/subdev/fb/ramnv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnva3.c b/drivers/g=
pu/drm/nouveau/core/subdev/fb/ramnva3.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnvc0.c b/drivers/g=
pu/drm/nouveau/core/subdev/fb/ramnvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramnve0.c b/drivers/g=
pu/drm/nouveau/core/subdev/fb/ramnve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/base.c b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv10.c b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/nv10.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv50.c b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nv92.c b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/nv92.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nvd0.c b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/nvd0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/nve0.c b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/nve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/gpio/priv.h b/drivers/gp=
u/drm/nouveau/core/subdev/gpio/priv.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/anx9805.c b/drivers/=
gpu/drm/nouveau/core/subdev/i2c/anx9805.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/aux.c b/drivers/gpu/=
drm/nouveau/core/subdev/i2c/aux.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/base.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/base.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/bit.c b/drivers/gpu/=
drm/nouveau/core/subdev/i2c/bit.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv04.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nv04.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv4e.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nv4e.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv50.h b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nv50.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nv94.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nv94.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nvd0.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nvd0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/nve0.c b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/nve0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/pad.c b/drivers/gpu/=
drm/nouveau/core/subdev/i2c/pad.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/pad.h b/drivers/gpu/=
drm/nouveau/core/subdev/i2c/pad.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/padnv04.c b/drivers/=
gpu/drm/nouveau/core/subdev/i2c/padnv04.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/padnv94.c b/drivers/=
gpu/drm/nouveau/core/subdev/i2c/padnv94.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/port.h b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/port.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/i2c/priv.h b/drivers/gpu=
/drm/nouveau/core/subdev/i2c/priv.h
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/ibus/gk20a.c b/drivers/g=
pu/drm/nouveau/core/subdev/ibus/gk20a.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nv50.c b/drivers/gpu/=
drm/nouveau/core/subdev/mc/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nv98.c b/drivers/gpu/=
drm/nouveau/core/subdev/mc/nv98.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mc/nvc0.c b/drivers/gpu/=
drm/nouveau/core/subdev/mc/nvc0.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/mxm/nv50.c b/drivers/gpu=
/drm/nouveau/core/subdev/mxm/nv50.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/ic.c b/drivers/gpu=
/drm/nouveau/core/subdev/therm/ic.c
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nva3.c b/drivers/g=
pu/drm/nouveau/core/subdev/therm/nva3.c
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nou=
veau/dispnv04/dac.c
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nou=
veau/dispnv04/dfp.c
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/no=
uveau/dispnv04/disp.c
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/=
nouveau/dispnv04/tvnv04.c
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/=
nouveau/dispnv04/tvnv17.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/dr=
m/nouveau/nouveau_backlight.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/dr=
m/nouveau/nouveau_connector.h
> diff --git a/drivers/gpu/drm/nouveau/nouveau_crtc.h b/drivers/gpu/drm/nou=
veau/nouveau_crtc.h
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouve=
au/nouveau_dp.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/=
nouveau/nouveau_encoder.h
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/no=
uveau/nouveau_fence.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/no=
uveau/nouveau_ioc32.c
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouv=
eau/nouveau_vga.c
> diff --git a/drivers/gpu/drm/nouveau/nv50_display.c b/drivers/gpu/drm/nou=
veau/nv50_display.c
>
> $ grep nouveau kernel-3.16.0-0.rc0.git10.1.fc21.src/*.patch
> kernel-3.16.0-0.rc0.git10.1.fc21.src/acpi-video-Add-use-native-backlight-=
quirk-for-the-Th.patch:"nouveau: Don't check acpi_video_backlight_support()=
 before registering backlight"
This is precisely why the user is often asked to perform a git bisect. =

There's a mountain of files touched between the two Fedora kernels =

(xzgrep output), corresponding witk something like 20 patches. Any of =

those could be the offender. We don't know, and now the search space =

still is 20 patches. Git bisect is nothing more than taking a kernel, =

marking a good and a bad kernel in terms of patches in the git history =

(like you requested below), and compiling and testing a few. Git makes =

sure that every kernel you try roughly halves the search space, so =

you'll have the offender in 5 steps.
It's not that we hate you and want you to suffer on complex procedures =

preferably including kernel compiles, but this process just gives more =

precise information to the developers... and I bet it takes less time =

than trying random kernels from Koji to narrow down the search space.
Anyway, we're not forcing you to do a bisect. If you don't, that's fine, =

but it probably takes longer to find the specific bug. We'd be grateful =

if you do though, as it'll save a lot of time from the hard-working =

developers that rather want to focus their attention on problems like =

reclocking and getting the latest generations of cards to work.
> http://git.linuxtv.org/cgit.cgi/media_build.git
> Whether the nouveau project has something like this?
We do, it's right here: =

http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=3Dlinux-3.16 . =

Problem is that it's not aligned with distributions' kernels, so it =

doesn't tell you a lot.
To come back to putting all the burden on the user: bugs don't always =

trigger for everyone. I've never seen this bug before. Most often it's a =

software error that only hits on one or several video cards in very =

specific configurations (like dual monitor, specific output port, =

optimus, VRAM), and developers don't always have this configuration =

available for testing. If developers can't reproduce and they don't know =

where to look, they're not going to be able to fix a bug.

Roy
> poma
>
