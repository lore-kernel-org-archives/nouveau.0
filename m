From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: low memory
Date: Fri, 8 Jan 2010 16:15:26 +0100
Message-ID: <91752841001080715g75b63da6kaff2485127b4c431@mail.gmail.com>
References: <91752840912111111q222602f8g87b1727c24bd06ba@mail.gmail.com>
	<6d4bc9fc0912111604oca0be3dm7f001bb05e85084@mail.gmail.com>
	<6d4bc9fc0912121350x54cde8b5yf72552c2d89ca2ab@mail.gmail.com>
	<91752840912131235v7e2a289ap32e92ef95574ce8b@mail.gmail.com>
	<91752841001071551i22069238of23551dc4b67cf39@mail.gmail.com>
	<1262909650.7007.1.camel@araqiel>
	<91752841001071650t4a9ecb3cm5c922105a668771a@mail.gmail.com>
	<91752841001080655g1ceb4bb4v8df9ccb467c53084@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <91752841001080655g1ceb4bb4v8df9ccb467c53084-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jan 8, 2010 at 3:55 PM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Fri, Jan 8, 2010 at 1:50 AM, Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Strange, I am 99% sure I did update libdrm , and before updating ddx.
>> I will double-check tomorrow.
>>
>> And I indeed found this commit :
>> http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3Dbb19=
47831d9a4e080b8d1e9dba086af6527ef479
>> So I assume the libdrm one is this one on the same day :
>> http://cgit.freedesktop.org/mesa/drm/commit/?id=3Df1660c249198b5cc14ebbb=
75107da7bcb6972033
>>
>> So by playing with these two commits, I should also be able to provide
>> more information. Thanks !
>>
>
> So it more looks like a drm/ttm problem.
> With a recent drm/ttm (after 98ba9c1322), firefox just displays a
> black box instead of the picture, the system lags a bit, and I get the
> following in dmesg :
> [ =A0 75.800986] [drm] nouveau 0000:03:00.0: validate: -12
> [ =A0 75.801365] [drm] nouveau 0000:03:00.0: validate: -12
> [ =A0 80.772360] reserve_ram_pages_type failed 0xc403000-0xc404000,
> track 0x8, req 0x10
>
> If I go before the drm/ttm merge, it still works fine. commit b5d1f52b
> or earlier.
>
> If I try to go somewhere between b5d1f52b and 98ba9c1322, I get the
> attached bug. But that might be because some important bugfix has been
> made at the end of that range, like "drm/nouveau: Fix "general
> protection fault" in the flipd/flips eviction path."
>
> Here is the commit range I mentioned :
>

I restricted the commit range to 2 relevant commits.
b5d1f52b works.
1e6cb7f causes the NULL pointer dereference in ttm_bo_mem_space+0x1e5/0x37b
162c700 fixes the NULL pointer dereference but I get the "validate: -12" er=
ror.

I am afraid this does not shed any light on the matter, and that the
real problem came earlier (probably in the huge ttm rework) but that
it was not apparent before these two ttm/nouveau fixes.

commit 162c70052890d24e7508a3c41212a8f87f17f39f
Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Date:   Wed Dec 16 19:05:00 2009 +0100

    drm/nouveau: Fix "general protection fault" in the flipd/flips
eviction path.

    Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>

commit 1e6cb7f7e94360d06ffff481a2980cf00a8a968e
Author: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Mon Dec 14 14:51:35 2009 +1000

    drm/ttm: fix two bugs in new placement routines.

    a) the loops were going to <=3D not <, leading to illegal memory access
    b) the busy placement checks were using the placement arrays not the
       busy placement ones.

    Acked-by: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

commit b5d1f52b73059bd34355e35654abc91015e03bb5
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Wed Dec 16 16:22:42 2009 +1000

    drm/nouveau: fix bug causing pinned buffers to lose their NO_EVICT flag

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
