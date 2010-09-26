From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: [PATCH] drm/nouveau/kms: Implement KDB debug
 hooks for nouveau KMS.
Date: Sun, 26 Sep 2010 06:20:46 -0500
Message-ID: <4C9F2C8E.5050700@windriver.com>
References: <m3iq9yqd7w.fsf@pullcord.laptop.org><4C5ACF3F.8050409@windriver.com><m3hbj0fju3.fsf_-_@pullcord.laptop.org><m3aaoimqrp.fsf_-_@pullcord.laptop.org>
	<87eidsemcf.fsf@riseup.net> <m3k4nhqcia.fsf_-_@pullcord.laptop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kgdb-bugreport-bounces@lists.sourceforge.net>
In-Reply-To: <m3k4nhqcia.fsf_-_@pullcord.laptop.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>,
	<mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net
To: Chris Ball <cjb@laptop.org>
Cc: David Airlie <airlied@linux.ie>, kgdb-bugreport@lists.sourceforge.net, Francisco Jerez <currojerez@riseup.net>, Jesse Barnes <jbarnes@virtuousgeek.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On 08/23/2010 03:50 PM, Chris Ball wrote:
> Hi Francisco,
>
>    > There is a problem with this on pre-nv20 cards. Fbcon
>    > acceleration won't work properly with IRQs disabled because you
>    > miss the context switching interrupts: You'll get a locked up
>    > fbcon if you hit sysrq-g when there's some process using the GPU.
>    > 
>    > I'd suggest disabling acceleration while in debug mode
>    > (e.g. using nouveau_fbcon_save_disable_accel()). That aside the
>    > patch looks good to me.
>
> Thanks very much for this.  Here's a (only compile-tested) patch for
> this, on top of jwessel's current kgdb-next branch.  Jason, would you
> mind testing on pre-nv20 and applying?
>
>   
Thanks Chris,

This is applied to the kgdb tree, and I'll send the whole atomic
modesetting series over to dri-devel as soon as it passes the regression
tests as that should be the place it is merged from unless we receive
sign-off from Jesse Barnes and Dave Airlie in which case I'll put it in
a future pull request.

It was pretty cool to see the kdb/kms feature finally working on the
laptop I use the most.

Thanks,
Jason.

------------------------------------------------------------------------------
Start uncovering the many advantages of virtual appliances
and start using them to simplify application deployment and
accelerate your shift to cloud computing.
http://p.sf.net/sfu/novell-sfdev2dev
