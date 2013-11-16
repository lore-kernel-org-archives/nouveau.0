From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/fb: fix suspend/resume fbcon
Date: Sat, 16 Nov 2013 23:22:37 +0000
Message-ID: <5287FE3D.7070708@gmail.com>
References: <1380811312.8640.6.camel@localhost> <524DF4CF.6040907@gmail.com>
	<1380848099.8990.15.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1380848099.8990.15.camel@localhost>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Christoph Rudorff <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 04/10/13 01:54, Christoph Rudorff wrote:
> Am Donnerstag, den 03.10.2013, 23:50 +0100 schrieb Emil Velikov:
>> I'm not entirely sure this is correct. One needs to save and disable
>> accleration before suspending the fb. Please try the following
>>
>> -	if (state == 0)
>> +	if (state == 1)
>> 		nouveau_fbcon_save_disable_accel(dev);
>> 	fb_set_suspend(drm->fbcon->helper.fbdev, state);
>> -	if (state == 1)
>> +	if (state == 0)
>> 		nouveau_fbcon_restore_accel(dev);
>> 	console_unlock();
>>
>> Cheers,
>> Emil
> 
> Hi!
> 
> That was my first try! I guessed the same but I got exactly one trap
> message on resume.
> 
Hi Chris,

Just got around to playing with s2disk on my laptop(nv96) and AFAICS
it seems to be OK without either patch.

Can you provide some more context regarding the issue ?
* What hardware are you running
* Which kernel are you having problems with
* Can you resume from s2disk correctly if you never start X
* Do you have the problem with s2ram
* dmesg without and with either patch

It might be useful if you can open a bug report and attach the
information in there [1]

Cheers,
Emil

[1] http://nouveau.freedesktop.org/wiki/Bugs/

> So it's about first put the bucket and then open the water tap.
> 
> ;)
> 
> chris
> 
> ps: just found these macros for the state in fb.h:
> 
> FBINFO_STATE_RUNNING = 0
> FBINFO_STATE_SUSPENDED = 1
> 
> 
