From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: REGRESSION: Kernel PANIC
 8777c5c11764d8336d8270f96778158c34c92108 - drm/nouveau/dp: probe dpcd to
 determine connectedness
Date: Tue, 17 Jun 2014 15:40:37 +1000
Message-ID: <CACAvsv7WVPVE_axXU9MS07DVRsn9DaZ+NF5A+9yYr5XxKWYe3A@mail.gmail.com>
References: <20140613095820.GA21162@glanzmann.de>
 <CACAvsv5dVMKcF67SO1qT=Foh4F0DkHeWNUztf8sQf++8GF-eMw@mail.gmail.com>
 <20140617053332.GA9117@glanzmann.de>
 <CACAvsv6nyu4cw6Yc1r5L8XNbS_Dyrka7o1JH=2Kc6URUWVcxjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6nyu4cw6Yc1r5L8XNbS_Dyrka7o1JH=2Kc6URUWVcxjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jun 17, 2014 at 3:39 PM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Jun 17, 2014 at 3:33 PM, Thomas Glanzmann <thomas-U3NvvseaQwJn68oJJulU0Q@public.gmane.org> wrote:
>> Hello Ben,
>>
>>> Are you able to double-check that bisect?  I'm not at all sure how
>>> that particular commit could trigger the issue you're seeing.  Some of
>>> the others, certainly.  It might be worth trying a couple of times
>>> before marking something as "good", in case there's a timing aspect to
>>> the problem.
>>
>> please CC me, otherwise I might not see your message. The bug is very
>> clear, I boot my machine, the screen turns black as soon as the X server
>> is booted and the system does not ping anymore. I rebooted several times
>> before the bisect and the bug always hit me. For my taste the offending
>> commit is to large. So maybe I can split it in multiple smaller commits
>> and than debug it. However I'm currently out of the office, so maybe
>> tomorrow. If you do any progress on this, please CC me in order to avoid
>> duplicate effort.
> 8777c5c11764d8336d8270f96778158c34c92108 (which is mentioned as the
> first bad commit above...) is a tiny commit, so I have no idea what
> you mean by "too large for your taste".
>
> In any case, I encountered the oops myself earlier (absolutely nothing
> to do with that commit) and fixed it here.  I've sent it onto Dave for
> the next -fixes merge, so hopefully it'll help your case too.
I have no idea why gmail doesn't auto-add you to the Cc list on reply
all.. But.. Done :)

>
> Thanks,
> Ben.
>
>>
>> Cheers,
>>         Thomas
