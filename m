From: Sven Joachim <svenjoac-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Fix for vblank on nvc0
Date: Thu, 15 Nov 2012 16:40:16 +0100
Message-ID: <87vcd6euxr.fsf@turtle.gmx.de>
References: <CAES2CiZRdkaOwYUbtp28ZMKu+DqtPOoKRwHPpLWaF2WeB6F8+g@mail.gmail.com>
	<50995728.8080305@canonical.com> <20121111182617.GA15689@joi.lan>
	<20121111183519.GA2959@joi.lan> <50A009B8.2080107@canonical.com>
	<CAES2CiYwSChUaDp1Z=5W0t34D54D7HfqH2cqvWXuWxUW69szTw@mail.gmail.com>
	<50A16FA6.5040002@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50A16FA6.5040002-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> (Maarten Lankhorst's message of
	"Mon, 12 Nov 2012 22:52:38 +0100")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 2012-11-12 22:52 +0100, Maarten Lankhorst wrote:

> Op 12-11-12 22:30, Kelly Doran schreef:
>> I had Sven test this patch... he said it works.  I think chipset
>> number test was executing code that we thought was only either 0x50 or
>> 0xc0, but was actually more specific with things like 0x92.
>>
> Oh right vblank is busted anyway... needs to be nv_device(priv-)>card_type == NV_50 to work.
>
> Your patch is the correct fix.

The patch has landed in the nouveau/master branch now, but not in
drm-nouveau-fixes where it is also needed.

Cheers,
       Sven
