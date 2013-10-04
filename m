From: Christoph Rudorff <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/fb: fix suspend/resume fbcon
Date: Fri, 04 Oct 2013 02:54:59 +0200
Message-ID: <1380848099.8990.15.camel@localhost>
References: <1380811312.8640.6.camel@localhost> <524DF4CF.6040907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <524DF4CF.6040907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Am Donnerstag, den 03.10.2013, 23:50 +0100 schrieb Emil Velikov:
> I'm not entirely sure this is correct. One needs to save and disable
> accleration before suspending the fb. Please try the following
> 
> -	if (state == 0)
> +	if (state == 1)
> 		nouveau_fbcon_save_disable_accel(dev);
> 	fb_set_suspend(drm->fbcon->helper.fbdev, state);
> -	if (state == 1)
> +	if (state == 0)
> 		nouveau_fbcon_restore_accel(dev);
> 	console_unlock();
> 
> Cheers,
> Emil

Hi!

That was my first try! I guessed the same but I got exactly one trap
message on resume.

So it's about first put the bucket and then open the water tap.

;)

chris

ps: just found these macros for the state in fb.h:

FBINFO_STATE_RUNNING = 0
FBINFO_STATE_SUSPENDED = 1
