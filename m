From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] fbmem: fix aperture overlapping check
Date: Tue, 13 Apr 2010 08:32:29 +1000
Message-ID: <n2t21d7e9971004121532y394d2f29rf018d8f33769ba57@mail.gmail.com>
References: <1270929334-3742-1-git-send-email-marcin.slusarz@gmail.com>
	<1271030068.3554.1.camel@localhost> <20100412113438.GB2789@joi.lan>
	<1271104101.5726.3.camel@t60prh> <20100412213327.GA4463@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100412213327.GA4463-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Peter Jones <pjones-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
List-Id: nouveau.vger.kernel.org

>
> Ok, thanks for explanation. I'll drop this patch and rebase the others.

Cool,

>> You won't be able to make this work for vga16fb from what I can see
>> since it access 0xa000 directly, not via any of the defined apertures
>> that vesafb/offb use. vga16fb will need a different approach I suspect.
>
> Yeah, there's an idea to claim 0xa0000 as an aperture of vga16fb and then
> do the same in KMS driver but only if it's the primary card.
> (You hinted to use SHADOW resource bit to check whether card is primary)
> I think I'll try this approach soon.

Yeah as long as we kick it off once, certain things like vga switcheroo change
who the primary gpu is at runtime.

but it should be okay if both drivers have the kickoff paths.

Dave.
