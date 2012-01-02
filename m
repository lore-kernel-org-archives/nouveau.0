From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Bisect: i2c regression in
 63daa9589cb88617d9cc8a0b0282564682a975b7
Date: Tue, 03 Jan 2012 08:40:10 +1000
Message-ID: <1325544010.8507.1.camel@nisroch>
References: <201201012238.25620.plr.vincent@gmail.com>
Reply-To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201201012238.25620.plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 2012-01-01 at 22:38 +0100, Vincent Pelletier wrote:
> Hi.
Hey,

> 
> Updating nouveau module to a newer git revision, I noticed I lost hwmon.
> 
> I ran a bisect, which identified 63daa9589cb88617d9cc8a0b0282564682a975b7 as 
> being the first bad commit.
> 
> Adding printk traces, I saw that probing i2c bus 3 for sensors always failed 
> with -EIO (no ack from slave). After reading the code, remembering how i2c 
> works and reading sample code on wikipedia, I couldn't identify any 
> algorythmic problem.
> 
> So I gave a try at changing delays. I doubled T_RISEFALL and T_HOLD, and the 
> adt7473 chip could be detected & used again. I haven't tested other 
> combination, nor tried to link those delays with any datasheet.
Apologies for the breakage, and thanks for looking into the cause!
Could you identify whether both timeouts needed doubling, or just one of
them?

Thanks,
Ben.

> 
> My card is a GTX 280.
> 
> Regards,
