From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/3] drm/gk20a: support for reclocking
Date: Tue, 5 Aug 2014 11:26:22 +0900
Message-ID: <CAAVeFu+_2nDeL3nuZ2M8h-v-+ws+u7xQk2FVvxUN4n0h56kizw@mail.gmail.com>
References: <1406367701-9155-1-git-send-email-gnurou@gmail.com>
 <CACAvsv7mLcaWmZsaQz95GBktxcCf22Nkh9y+UyeHTcY78TPY2w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv7mLcaWmZsaQz95GBktxcCf22Nkh9y+UyeHTcY78TPY2w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Aug 5, 2014 at 8:55 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sat, Jul 26, 2014 at 7:41 PM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Second version of the gk20a clock patches. I have tried to keep the therm and
>> volt devices mandatory in the clock driver, but unfortunately they are too tied
>> to bios to allow this, at least for the moment. Consequently this version is
>> mostly a port of the first version to Ben's tree.
> I've merged the series, thanks Alex.

Great, thanks to you!

>
>>
>> Ben, please let me know what I have done wrong in terms of integration to your
>> tree, as the main purpose of writing patches against it instead of the kernel
>> is to make your life easier. :)
> I honestly don't mind at all if you completely ignore the non-DRM
> build and leave it to me to fix up.  I personally use the userspace
> build quite a lot for dev/testing, but don't at all expect others to,
> or to maintain it.  But thank you for bothering :)
>
> In any case, it was *almost* (clk_get_rate() was missing) fine.  I
> left a patch in the tree of what I changed, and I'll squash it before
> it goes to -staging.

Oh I see. I probably omitted to do a test build after committing some
last changes - sorry about that.

Thanks again,
Alex.
