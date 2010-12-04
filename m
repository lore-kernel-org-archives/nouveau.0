From: Roger <rogerx.oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Display goes off when framebuffer enabled and Kernel
 Panic with fbset
Date: Fri, 3 Dec 2010 22:59:25 -0900
Message-ID: <20101204075925.GB4170@localhost2.local>
References: <20101204072803.GA4170@localhost2.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101204072803.GA4170-bi+AKbBUZKbUbxaO3c2PGA@public.gmane.org>
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
List-Id: nouveau.vger.kernel.org

I yanked the compiled in nouveau-drm from kernel 2.6.35 and reinstalled the
snapshot =x11-base/nouveau-drm-20100811 package providing kernel drivers.

Framebuffer mode works fine and dandy along with fbset -i:
mode "1680x1050"
    geometry 1680 1050 1680 1050 32
    timings 0 0 0 0 0 0 0
    rgba 8/16,8/8,8/0,0/0
endmode

Frame buffer device information:
    Name        : nouveaufb
    Address     : 0xd0048000
    Size        : 7258112
    Type        : PACKED PIXELS
    Visual      : TRUECOLOR
    XPanStep    : 1
    YPanStep    : 1
    YWrapStep   : 0
    LineLength  : 6912
    MMIO Address: 0xd0000000
    MMIO Size   : 134217728
    Accelerator : No


Looks like I have some newer masked 2.6.36 kernel versions I can try, to see if
this bug still exists?


On Fri, Dec 03, 2010 at 10:28:03PM -0900, Roger wrote:
>Kernel 2.6.35 (gentoo sources)
>
>I get a LCD Display with initial console output, but when Nouveau starts and
>framebuffer is initiated, the LCD display powers off.
>
>
>I then get the following panic when using fbset -i/-a:
># cat /proc/kmsg
><1>BUG: unable to handle kernel NULL pointer dereference at (null)
><1>IP: [<c126e717>] fb_open+0x67/0x140
><4>*pde = 00000000

-- 
Roger
http://rogerx.freeshell.org/
