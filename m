From: Christoph Rudorff <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/fb: fix suspend/resume fbcon
Date: Sun, 17 Nov 2013 19:30:17 +0100
Message-ID: <52890B39.30700@rudorff.com>
References: <1380811312.8640.6.camel@localhost> <524DF4CF.6040907@gmail.com>
	<1380848099.8990.15.camel@localhost> <5287FE3D.7070708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5287FE3D.7070708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 17.11.2013 00:22, Emil Velikov wrote:
> On 04/10/13 01:54, Christoph Rudorff wrote:
>> Am Donnerstag, den 03.10.2013, 23:50 +0100 schrieb Emil Velikov:
>>> I'm not entirely sure this is correct. One needs to save and disable
>>> accleration before suspending the fb. Please try the following
>>>
>>> -	if (state == 0)
>>> +	if (state == 1)
>>> 		nouveau_fbcon_save_disable_accel(dev);
>>> 	fb_set_suspend(drm->fbcon->helper.fbdev, state);
>>> -	if (state == 1)
>>> +	if (state == 0)
>>> 		nouveau_fbcon_restore_accel(dev);
>>> 	console_unlock();
>>>
>>> Cheers,
>>> Emil
>>
>> Hi!
>>
>> That was my first try! I guessed the same but I got exactly one trap
>> message on resume.
>>
> Hi Chris,
> 

Hi Emil!

> Just got around to playing with s2disk on my laptop(nv96) and AFAICS
> it seems to be OK without either patch.

That does not make me wonder.

The "nouveau_fbcon_restore_accel" is restoring from uninitialized memory.
So the resulting behavior is undefined. It must not fail.

(My experience with vga-drivers is, it may makes a difference if u just
reboot or power down the machine when testing another kernel!
And I do believe we can't catch the remaining bugs just with testing.)

> Can you provide some more context regarding the issue ?
> * What hardware are you running

A MacBookPro6,2 with GT216 [GeForce GT 330M]
Debian 6
Boot via UEFI, not using pc-bios emulation.

It's my working horse and usually an uptime monster thanks to s2disk.
So I can't test that much and only during a mandatory kernel upgrade.

> * Which kernel are you having problems with

That's the fun part. I was stuck with 3.6.9 which was fine and later
kernels were a mess. I did not upgrade any more until longterm 3.10 came
out. However, this bug was already in 3.6.9, but it did not trigger:

3.6.9  ok
3.6.10 problems  *)
3.7.1  problems
... never touch a running system ... until
3.10.13 ok
3.10.14 problems
...

*) There were no changes below drivers/gpu/drm/nouveau !

I think the difference is, that the kernel size increased so memory
allocations were just shifted ... so we may get an used memory page, no?
It's a race condition.

> * Can you resume from s2disk correctly if you never start X

The machine never locked up and X was also fine. The console gets messed:
just snow. A s2ram clears it up. I may test this later.

> * Do you have the problem with s2ram

No.

> * dmesg without and with either patch

Blame me. I didn't kept them. But I remember I diffed them but that did
not gave any hint. I found it by reading the source code.

> 
> It might be useful if you can open a bug report and attach the
> information in there [1]

I didn't opened a report because there are already many reports about
garbled console.

I just thought that the actual nouveau_fbcon_set_suspend() is obviously
doing the wrong thing and the fix is too easy.

And the remaining snow on the console, which other users get, are other
causes.

Actually reproducible is this (also with my patch):

1. Fresh boot up, run mplayer (-vo xv), switch to fullscreen: GPU lockup.
If I do a s2ram before, it works.

https://bugs.freedesktop.org/show_bug.cgi?id=68037
^^ same issue?! Are we missing some initialization?

2. Try a sysrq-"space"-key on console: The help text, which should appear,
is just snow (Can you reproduce this?).

3. On boot up, I'll still get some snow just before X start, _sometimes_,
not always: 3-4 lines of
nouveau E[     PFB][0000:01:00.0] trapped write at 0x0000710540 on channel
0x0000fee0 [unknown] BAR/PFIFO_WRITE/FB reason: PAGE_NOT_PRESENT

greets,

chris


> 
> Cheers,
> Emil
> 
> [1] http://nouveau.freedesktop.org/wiki/Bugs/
> 
>> So it's about first put the bucket and then open the water tap.
>>
>> ;)
>>
>> chris
>>
>> ps: just found these macros for the state in fb.h:
>>
>> FBINFO_STATE_RUNNING = 0
>> FBINFO_STATE_SUSPENDED = 1
>>
>>
> 
