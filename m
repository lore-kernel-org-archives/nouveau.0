From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau soft lockup after switcheroo'd...
Date: Wed, 24 Oct 2012 20:07:46 +0200
Message-ID: <20121024180746.GA26891@joi.lan>
References: <CAMVG2sum1Ch5JKyCM5=baSFxvSb-THFM4QWHTHH=3upi3fXnUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMVG2sum1Ch5JKyCM5=baSFxvSb-THFM4QWHTHH=3upi3fXnUA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Oct 24, 2012 at 01:54:43PM +0800, Daniel J Blueman wrote:
> On 13 October 2012 15:12, Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org> wrote:
> > On my Macbook Retina, when switching to the integrated GPU, we see a
> > ioread32 issued to the discrete GPU, which hangs as it is in D3 [1]
> > (drm.debug is set to 14 here).
> >
> > Full kernel 3.6.2 boot logs with drm.debug=5 are at:
> > http://quora.org/2012/mbp-i915-panel.txt
> >
> > What additional information will help debug this?
> 
> I'm seeing this on 3.7-rc2 also:
> 
> cat /sys/kernel/debug/vgaswitcheroo/switch
> 0:DIS:+:Pwr:0000:01:00.0
> 1:IGD: :Pwr:0000:00:02.0
> 2:DIS-Audio: :Pwr:0000:01:00.1
> 
> echo IGD >/sys/kernel/debug/vgaswitcheroo/switch
> echo OFF >/sys/kernel/debug/vgaswitcheroo/switch
> 
> after boot+40s:
> 
> BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1703]
> Modules linked in: dm_crypt snd_hda_codec_hdmi bnep rfcomm parport_pc
> ppdev nfsd nfs_acl auth_rpcgss nfs binfmt_misc fscache lockd sunrpc
> joydev arc4 coretemp kvm_intel b43 kvm mac80211 cfg80211 ssb btusb
> snd_hda_codec_cirrus applesmc input_polldev microcode bluetooth
> bcm5974 snd_hda_intel snd_hda_codec nouveau snd_seq_midi snd_rawmidi
> snd_hwdep bcma lpc_ich snd_seq_midi_event snd_pcm mei snd_seq
> snd_timer snd_seq_device ttm mxm_wmi wmi snd soundcore snd_page_alloc
> nls_iso8859_1 apple_gmux mac_hid apple_bl lp parport hid_generic
> hid_apple usbhid hid btrfs zlib_deflate libcrc32c ghash_clmulni_intel
> aesni_intel ablk_helper cryptd lrw aes_x86_64 xts gf128mul i915
> drm_kms_helper sdhci_pci sdhci drm i2c_algo_bit tg3 video
> CPU 0
> Pid: 1703, comm: Xorg Not tainted 3.7.0-030700rc2-generic
> #201210201535 Apple Inc. MacBookPro10,1/Mac-C3EC7CD22292981F
> RIP: 0010:[<ffffffff813469fa>] [<ffffffff813469fa>] ioread32+0x3a/0x40
> RSP: 0018:ffff880260577b28 EFLAGS: 00000296
> RAX: 00000000ffffffff RBX: ffff880260577b90 RCX: 0000000080000000
> RDX: 0000000010000000 RSI: 0000000077359400 RDI: ffffc9001d909410
> RBP: ffff880260577b28 R08: 0000000000000000 R09: ffff880263d63798
> R10: 0000000000000000 R11: 0000000000000246 R12: ffff88026f3d0968
> R13: 0000000000000000 R14: ffffffff81049dc0 R15: ffff880260577ac8
> FS: 00007f912f03e880(0000) GS:ffff88026f200000(0000) knlGS:0000000000000000
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f9131bf7d00 CR3: 0000000264192000 CR4: 00000000001407f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> Process Xorg (pid: 1703, threadinfo ffff880260576000, task ffff8802605bc4a0)
> Stack:
>  ffff880260577b58 ffffffffa037c538 0000000000000296 ffff8802612a3000
>  0000000077359400 000000000061d004 ffff880260577bb8 ffffffffa037bfec
>  ffff8802605bc4a0 000000000061d004 ffffffffffffffff 0000000081172756
> Call Trace:
>  [<ffffffffa037c538>] nv04_timer_read+0x28/0x70 [nouveau]
>  [<ffffffffa037bfec>] nouveau_timer_wait_eq+0x7c/0xe0 [nouveau]
>  [<ffffffffa03f4f4e>] nvd0_sor_dpms+0xde/0x1a0 [nouveau]
>  [<ffffffff813871d9>] ? fb_set_var+0xe9/0x3a0
>  [<ffffffff811554a9>] ? __pte_alloc+0xa9/0x160
>  [<ffffffffa03f4e70>] ? nvd0_sor_dp_link_set+0x2c0/0x2c0 [nouveau]
>  [<ffffffffa00b2a5c>] drm_helper_connector_dpms+0xbc/0x100 [drm_kms_helper]
>  [<ffffffffa00b1665>] drm_fb_helper_dpms.isra.13+0xa5/0xf0 [drm_kms_helper]
>  [<ffffffffa00b16f9>] drm_fb_helper_blank+0x49/0x80 [drm_kms_helper]
>  [<ffffffff81386e16>] fb_blank+0x56/0xc0
>  [<ffffffff813887bb>] do_fb_ioctl+0x59b/0x5f0
>  [<ffffffff81152883>] ? vma_interval_tree_insert+0x83/0x90
>  [<ffffffff81388af5>] fb_ioctl+0x45/0x50
>  [<ffffffff8119adda>] do_vfs_ioctl+0x8a/0x340
>  [<ffffffff8119b121>] sys_ioctl+0x91/0xb0
>  [<ffffffff81189862>] ? sys_read+0x52/0xa0
>  [<ffffffff816b9899>] system_call_fastpath+0x16/0x1b
> Code: ff 00 00 01 00 76 0a 0f b7 d7 ed 5d c3 0f 1f 40 00 48 c7 c6 81
> 4b a5 81 e8 24 fe ff ff b8 ff ff ff ff 5d c3 0f 1f 44 00 00 8b 07 <5d>
> c3 0f 1f 40 00 55 48 81 ff ff ff 03 00 48 89 e5 77 2b 48 81
> -- 

In case it's not obvious: Xorg tries to blank monitor connected to nvidia
card, but hangs because card is already powered down.

Did it ever work? If yes, can you bisect it?
Does it work if you power down nvidia card while X is not running?

Marcin
