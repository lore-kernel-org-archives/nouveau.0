From: Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: fix a bit shift error
 introduced by 457e77b
Date: Sun, 20 Apr 2014 15:25:10 +0200
Message-ID: <CABikg9zykNW7Qv9B2ffk1XipiieQxrEs+fL-Y1a76PkfvHKkKQ@mail.gmail.com>
References: <1397596717-6862-1-git-send-email-saproj@gmail.com>
 <CABikg9yL9y49ws5yJq9R0LV7++ysgPD0wwAeoNd3g8Tm34ysHg@mail.gmail.com>
 <5352D943.407@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5352D943.407-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 19 April 2014 22:14, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 15/04/14 22:49, Sergei Antonov wrote:
>> On 15 April 2014 23:18, Sergei Antonov <saproj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Commit 457e77b26428ab4a24998eecfb99f27fa4195397 added two checks applied to a
>>> value received from nv_rd32(bios, 0x619f04). But after this new piece of code
>>> is executed, the addr local variable does not hold the same value it used to
>>> hold before the commit. Here is what is was assigned in the original code:
>>>         (u64)(nv_rd32(bios, 0x619f04) & 0xffffff00) << 8
>>> in the committed code it ends up with this value:
>>>         (u64)(nv_rd32(bios, 0x619f04) >> 8) << 8
>>> These expressions are obviously not equivalent.
>>>
>>> My Nvidia video card does not show anything on the display when I boot a
>>> kernel containing this commit.
>>>
>>> The patch fixes the code so that the new checks are still done, but the
>>> side effect of an incorrect addr value is gone.
>>>
> Hi Sergei
>
> A similar patch [1] has been sent a few days prior to yours, and I'm assuming
> it will be queued/merged shortly. Just letting you know.
>
> Cheers
> -Emil
>
> [1] http://lists.freedesktop.org/archives/dri-devel/2014-April/057318.html

Thanks! I didn't know about this patch. Sorry for accidentally
creating a race condition.
My patch has been merged today (included in "drm fixes" from Dave Airlie).
