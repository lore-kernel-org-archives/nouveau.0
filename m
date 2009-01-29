From: "Yan Seiner" <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Subject: Re: git compile failure
Date: Thu, 29 Jan 2009 13:34:17 -0800 (PST)
Message-ID: <711ae0646673afc21d4bd28da34dad02.squirrel@www.datavault.us>
References: <141d1c48884ed68f7e91236a287d48a9.squirrel@www.datavault.us>
	<20090129231559.302a708e@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090129231559.302a708e-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


On Thu, January 29, 2009 1:15 pm, Pekka Paalanen wrote:
> On Thu, 29 Jan 2009 09:10:24 -0800 (PST)
> "Yan Seiner" <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
>
>> I'm trying to build nouveau form git. The compile fails with:
>>
>> gcc -DHAVE_CONFIG_H -I. -I.. -D_XOPEN_SOURCE=3D500 -I
>> -I/usr/include/pixman-1 -I/usr/include/drm -I/usr/include/X11/dri -g -O2
>> -Wall -minline-all-stringops -D_XOPEN_SOURCE=3D500 -I
>> -I/usr/include/pixman-1 -I/usr/include/drm -I/usr/include/X11/dri -MT
>> nouveau_device.lo -MD -MP -MF .deps/nouveau_device.Tpo -c
>> nouveau_device.c -fPIC -DPIC -o .libs/nouveau_device.o
>> In file included from nouveau_device.c:27:
>> nouveau_drmif.h:47: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=E2=
=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99
>> or
>> =E2=80=98__attribute__=E2=80=99 before =E2=80=98int=E2=80=99
>
> I've no idea how that happens. It compiles fine for me, just tried.
> You might try something like
> $ git remote update
> $ make distclean
> $ git rebase origin/master
> $ ./autogen.sh
> $ make

Thanks.

I'll try this when I get access again.  For now, I've traced it to
X11/Xfuncproto.h not being #included.  I suspect it has to do with the way
debian packages its #includes.

Anyway, the missing #define is in X11/Xfuncproto.h; now I need to figure
out where to stick it.

Anmyone out there using debian .debs for the build deps?

--Yan

>
> ...
>> nouveau_device.c: In function =E2=80=98nouveau_device_open_existing=E2=
=80=99:
>> nouveau_device.c:53: warning: implicit declaration of function
>> =E2=80=98nouveau_device_get_param=E2=80=99
>> make[2]: *** [nouveau_device.lo] Error 1
>> make[2]: Leaving directory `/usr/src/nouveau/xf86-video-nouveau/src'
>>
>>
>> The first offending line is here:
>>
>> NOUVEAU_PRIVATE int
>> nouveau_device_open_existing(struct nouveau_device **, int close,
>> int fd, drm_context_t ctx);
>
> ./src/nouveau_local.h:29:#define NOUVEAU_PRIVATE _X_HIDDEN
>
> --
> Pekka Paalanen
> http://www.iki.fi/pq/
>
> !DSPAM:49821ca3160401804284693!
>
>


-- =

  o__
  ,>/'_          o__
  (_)\(_)        ,>/'_        o__
Yan Seiner      (_)\(_)       ,>/'_     o__
       Personal Trainer      (_)\(_)    ,>/'_        o__
             Professional Engineer     (_)\(_)       ,>/'_
Who says engineers have to be pencil necked geeks?  (_)\(_)

You are an adult when you realize that everyone's an idiot sometimes. You
are wise when you include yourself.
