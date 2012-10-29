From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: Re: Nouveau soft lockup after switcheroo'd...
Date: Mon, 29 Oct 2012 22:09:07 +0800
Message-ID: <CAMVG2sujgx=UP5VkwDP-udZzzFPY9CcxoLDk5-T-gq4jTKrttQ@mail.gmail.com>
References: <CAMVG2sum1Ch5JKyCM5=baSFxvSb-THFM4QWHTHH=3upi3fXnUA@mail.gmail.com>
	<20121024180746.GA26891@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121024180746.GA26891-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 25 October 2012 02:07, Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Oct 24, 2012 at 01:54:43PM +0800, Daniel J Blueman wrote:
>> On 13 October 2012 15:12, Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org> wrote:
[...]
>> echo IGD >/sys/kernel/debug/vgaswitcheroo/switch
>> echo OFF >/sys/kernel/debug/vgaswitcheroo/switch
>>
>> after boot+40s:
>>
>> BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1703]
[...]\
>>  [<ffffffffa037c538>] nv04_timer_read+0x28/0x70 [nouveau]
>>  [<ffffffffa037bfec>] nouveau_timer_wait_eq+0x7c/0xe0 [nouveau]
>>  [<ffffffffa03f4f4e>] nvd0_sor_dpms+0xde/0x1a0 [nouveau]
>>  [<ffffffff813871d9>] ? fb_set_var+0xe9/0x3a0
>>  [<ffffffff811554a9>] ? __pte_alloc+0xa9/0x160
>>  [<ffffffffa03f4e70>] ? nvd0_sor_dp_link_set+0x2c0/0x2c0 [nouveau]
>>  [<ffffffffa00b2a5c>] drm_helper_connector_dpms+0xbc/0x100 [drm_kms_helper]
>>  [<ffffffffa00b1665>] drm_fb_helper_dpms.isra.13+0xa5/0xf0 [drm_kms_helper]
>>  [<ffffffffa00b16f9>] drm_fb_helper_blank+0x49/0x80 [drm_kms_helper]
>>  [<ffffffff81386e16>] fb_blank+0x56/0xc0
>>  [<ffffffff813887bb>] do_fb_ioctl+0x59b/0x5f0
>>  [<ffffffff81152883>] ? vma_interval_tree_insert+0x83/0x90
>>  [<ffffffff81388af5>] fb_ioctl+0x45/0x50
>>  [<ffffffff8119adda>] do_vfs_ioctl+0x8a/0x340
>>  [<ffffffff8119b121>] sys_ioctl+0x91/0xb0
>>  [<ffffffff81189862>] ? sys_read+0x52/0xa0

> In case it's not obvious: Xorg tries to blank monitor connected to nvidia
> card, but hangs because card is already powered down.
>
> Did it ever work? If yes, can you bisect it?
> Does it work if you power down nvidia card while X is not running?

Thanks for your reply Marcin! I wasn't able to boot kernels earlier
than 3.6 on this Macbook Pro retina due to various issues, and it
occurs on kernels between and including 3.6 and 3.7-rc3.

As we see read being called, I've taken the lsof output [1].

Should the DPMS functions be deregistered prior the hardware being
placed in D3, or is it more that the functions should check if the
card was put into D3 and just return?

Thanks,
  Daniel

--- [1]

# lsof -p 2064
[...]
Xorg    2064 root    0w      REG                8,2     7492
265392 /var/log/Xorg.failsafe.log
Xorg    2064 root    1u     IPv6              11902      0t0
TCP *:x11 (LISTEN)
Xorg    2064 root    2u      CHR              136,1      0t0
4 /dev/pts/1
Xorg    2064 root    3u     IPv4              11903      0t0
TCP *:x11 (LISTEN)
Xorg    2064 root    4u     unix 0xffff880261904780      0t0
11904 @/tmp/.X11-unix/X0
Xorg    2064 root    5u     unix 0xffff880261900d00      0t0
11905 /tmp/.X11-unix/X0
Xorg    2064 root    6r      REG                8,2    31246
661523 /usr/lib/xorg/protocol.txt
Xorg    2064 root    7u  netlink                         0t0
11908 KOBJECT_UEVENT
Xorg    2064 root    8w      REG                0,3        0
4026531957 /proc/mtrr
Xorg    2064 root    9w      REG                0,3        0
4026531957 /proc/mtrr
Xorg    2064 root   10u     unix 0xffff880261907500      0t0      11909 socket
Xorg    2064 root   11u      CHR                4,8      0t0
1051 /dev/tty8
Xorg    2064 root   12u      CHR              10,63      0t0
1026 /dev/vga_arbiter
Xorg    2064 root   13u      CHR               29,0      0t0      10527 /dev/fb0
-- 
Daniel J Blueman
