From: Vincent Pelletier <plr.vincent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Bisect: i2c regression in
	63daa9589cb88617d9cc8a0b0282564682a975b7
Date: Sun, 1 Jan 2012 22:38:25 +0100
Message-ID: <201201012238.25620.plr.vincent@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi.

Updating nouveau module to a newer git revision, I noticed I lost hwmon.

I ran a bisect, which identified 63daa9589cb88617d9cc8a0b0282564682a975b7 as 
being the first bad commit.

Adding printk traces, I saw that probing i2c bus 3 for sensors always failed 
with -EIO (no ack from slave). After reading the code, remembering how i2c 
works and reading sample code on wikipedia, I couldn't identify any 
algorythmic problem.

So I gave a try at changing delays. I doubled T_RISEFALL and T_HOLD, and the 
adt7473 chip could be detected & used again. I haven't tested other 
combination, nor tried to link those delays with any datasheet.

My card is a GTX 280.

Regards,
-- 
Vincent Pelletier
