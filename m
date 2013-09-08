From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: 3.12rc1-pre Nouveau? oops
Date: Mon, 9 Sep 2013 08:29:05 +1000
Message-ID: <CAPM=9twkyQGbnPEerqCpJNfXxSRo1pw7MBvGMuz8zs1pQ+Fcng@mail.gmail.com>
References: <CAKb7UviRb_ao_nB8Q3pa9ePm+yUGd8u7PDREv5wNfCheyGTZjQ@mail.gmail.com>
	<1378675264-3005-1-git-send-email-tobias.johannes.klausmann@mni.thm.de>
	<CAPM=9tyCOdzC1NYy7jt+zh3WOuzubaO3b8vwFVast9ec=BWOkA@mail.gmail.com>
	<522CF3D1.2020303@mni.thm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <522CF3D1.2020303-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 9, 2013 at 8:01 AM, Tobias Klausmann
<tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:
>
> On 08.09.2013 23:33, Dave Airlie wrote:
>>>>
>>>> Looks like you have Optimus (intel + nvidia), and the backtrace has
>>>> runtime pm in it, which is something new Dave added for 3.12, adding
>>>> him in explicitly. The simplest explanation is that disp->init is
>>>> NULL. And it seems like there are no outputs from the earlier nouveau
>>>> init prints. I guess that the call to nouveau_display_resume from
>>>> nouveau_pmops_runtime_resume should be guarded by a if
>>>> (dev->mode_config.num_crtc) like it is everywhere else.
>>>>
>>>>    -ilia
>>>
>>> Your guess was right, this (hopefully attached patch) fixes it for me!
>>
>> Does it look like this one?
>>
>> Dave.
>
> No, mine was quick and dirty, reverted it and took yours. But i'm a little
> bit confused that this is a suspend/resume problem, i booted the kernel for
> the first time while seeing the oops. But anyway i tested it and it works.

It's runtime suspend/resume - so it turns the nvidia gpu off at boot since it
isn't being used.

you should see longer battery life.
Dave.
