From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50: laptop screen goes from black to white
Date: Thu, 30 Jul 2009 18:48:02 +1000
Message-ID: <1248943682.3178.4.camel@keine.ath.cx>
References: <bug-22179-8800@http.bugs.freedesktop.org/>
	<20090729151047.309BC13005B@annarchy.freedesktop.org>
	<4A715A93.4060500@mail.ru>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A715A93.4060500-JGs/UdohzUI@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: "provider.spb-JGs/UdohzUI@public.gmane.org" <provider.spb-JGs/UdohzUI@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2009-07-30 at 12:32 +0400, provider.spb-JGs/UdohzUI@public.gmane.org wrote:
> I have same issue with GF 8600M GS (G86) on my laptop - black screen 
> with KMS enabled, sometimes with colorful lines, somteimes slowly turns 
> to white. When i connect external LCD monitor, there is pretty image on 
> it, all works, but laptop internal screen still not work. Fixed by 
> adding uscript_lvds=1 to kernel command line. And now i have problems 
> only with EXAPixmaps option - few 2D corruptions and lockups about 15-20 
> seconds.
Hey, thanks for the report.

There were some fixes today that may help with some of the driver
pixmaps corruption, but there's likely more issues there to resolve.

For your panel issue, I'm still not sure exactly how NVIDIA decide which
set of scripts to run.  I'd be very interested in seeing the output of
"dmesg" with nouveau running on that machine, hopefully with enough data
we'll be able to track this down soon.

Thanks!
Ben.
> P.S. Thank you all! It's greatest work!
> -------------------------------------
> Dmitriy Vasin
> Gigzbyte Security Group
> 
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
