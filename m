From: Daniel J Blueman <daniel-JCXMqzvhRcvYtjvyW6yDsg@public.gmane.org>
Subject: 3.12 nvidia switcheroo regression
Date: Mon, 2 Dec 2013 01:06:21 +0800
Message-ID: <CAMVG2su0Hu6x2JmXR7Ahyx+tnK8Y6K_AYCKmKuf1zRqzX=nG5Q@mail.gmail.com>
References: <CAMVG2suwFvXkB=ddrVz=x=1WHkwhVGRG0ZgzV6OXomsVcfAmqw@mail.gmail.com>
	<CAMVG2suRFkuKYmD8YVNwe3EMx9K0y41vQc72io6-OLjJbtM7tA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0472216963=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAMVG2suRFkuKYmD8YVNwe3EMx9K0y41vQc72io6-OLjJbtM7tA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0472216963==
Content-Type: multipart/alternative; boundary=089e0160c35e2bdf0d04ec7c159d

--089e0160c35e2bdf0d04ec7c159d
Content-Type: text/plain; charset=ISO-8859-1

Hi Marcin et al,

When booting my Macbook Pro into 3.12 and powering off the Nvidia GPU, we
see nouveau try to dequeue an item which isn't present, leading to a
page-not-present fault. 3.11 works just nice.

It looks like I should add some debug, as there aren't event
enqueuing/dequeueing debug flags, or as you suggest?

http://quora.org/2013/dmesg.txt
http://quora.org/2013/config (same as the Ubuntu mainline config)

# echo OFF >/sys/kernel/debug/vgaswitcheroo/switch
hda-intel 0000:01:00.1: Disabling via VGA-switcheroo
hda-intel 0000:01:00.1: Cannot lock devices!
VGA switcheroo: switched nouveau off
nouveau [ DRM] suspending display...
general protection fault: 0000 [#1] SMP
Modules linked in: dm_crypt(F) parport_pc(F) snd_hda_codec_hdmi(F) ppdev(F)
lib80211_crypt_tkip(F) rfcomm(F) bnep(F) joydev(F) x86_pkg_temp_thermal(F)
intel_powerclamp(F) coretemp(F) nfsd(F) applesmc(F) kvm_intel(F)
input_polldev(F) auth_rpcgss(F) nfs_acl(F) kvm(F) crc32_pclmul(F) nfs(F)
aesni_intel(F) aes_x86_64(F) lockd(F) glue_helper(F) binfmt_misc(F) lrw(F)
gf128mul(F) ablk_helper(F) cryptd(F) wl(POF) sunrpc(F) btusb(F) fscache(F)
ax88179_178a(F) usbnet(F) snd_seq_midi(F) mii(F) uvcvideo(F)
snd_seq_midi_event(F) snd_hda_codec_cirrus(F) bluetooth(F) bcm5974(F)
videobuf2_vmalloc(F) videobuf2_memops(F) videobuf2_core(F) snd_rawmidi(F)
videodev(F) snd_hda_intel(F) snd_hda_codec(F) snd_seq(F) lib80211(F)
snd_hwdep(F) snd_seq_device(F) cfg80211(F) lpc_ich(F) snd_pcm(F) mei_me(F)
mei(F) snd_page_alloc(F) snd_timer(F) snd(F) soundcore(F) nls_iso8859_1(F)
apple_gmux(F) mac_hid(F) apple_bl(F) lp(F) parport(F) btrfs(F) xor(F)
raid6_pq(F) libcrc32c(F) hid_generic(F) hid_apple(F) usbhid(F) hid(F)
microcode(F) ahci(F) libahci(F) nouveau(F) i915(F) mxm_wmi(F) wmi(F)
i2c_algo_bit(F) ttm(F) drm_kms_helper(F) drm(F) video(F)
CPU: 2 PID: 2738 Comm: bash Tainted: PF O 3.12.2-ninja+ #3
Hardware name: Apple Inc. MacBookPro10,1/Mac-C3EC7CD22292981F, BIOS
MBP101.88Z.00EE.B02.1208081132 08/08/2012
task: ffff880262bb5d00 ti: ffff88008624e000 task.ti: ffff88008624e000
RIP: 0010:[<ffffffffa0159b81>] [<ffffffffa0159b81>]
nouveau_event_put_locked+0x31/0x60 [nouveau]
RSP: 0018:ffff88008624fd48 EFLAGS: 00010097
RAX: dead000000200200 RBX: ffff88025e8bad88 RCX: 0000000000000010
RDX: dead000000100100 RSI: 0000000000000011 RDI: ffff88025ef36400
RBP: ffff88008624fd50 R08: 0000000000000217 R09: 000000000000052d
R10: 0000000000000000 R11: ffff88008624f98e R12: 0000000000000011
R13: 0000000000000217 R14: ffff88025e8bad88 R15: ffff88025e522bf0
FS: 00007f08445c1740(0000) GS:ffff88026f280000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7d5452d000 CR3: 00000000889d5000 CR4: 00000000001407e0
Stack:
ffff88025ef36400 ffff88008624fd80 ffffffffa0159be5 ffff88025e8ba800
ffff88025e9e7240 ffff88025e522800 ffff88025e8a2b40 ffff88008624fdb8
ffffffffa01c54be 0000000000000003 ffff880263819000 ffff88025e522800
Call Trace:
[<ffffffffa0159be5>] nouveau_event_put+0x35/0x50 [nouveau]
[<ffffffffa01c54be>] nouveau_display_fini+0x8e/0xc0 [nouveau]
[<ffffffffa01c5afd>] nouveau_display_suspend+0x1d/0xe0 [nouveau]
[<ffffffffa01b3bfd>] nouveau_do_suspend+0x23d/0x2d0 [nouveau]
[<ffffffffa01b3cd6>] nouveau_pmops_suspend+0x46/0xc0 [nouveau]
[<ffffffffa01b7404>] nouveau_switcheroo_set_state+0x64/0xc0 [nouveau]
[<ffffffff8145bb98>] vga_switchoff.part.2+0x18/0x40
[<ffffffff8145c083>] vga_switcheroo_debugfs_write+0x303/0x3c0
[<ffffffff81195a29>] ? __sb_start_write+0x49/0x100
[<ffffffff812c3693>] ? security_file_permission+0x23/0xa0
[<ffffffff81193b9d>] vfs_write+0xbd/0x1e0
[<ffffffff81194279>] SyS_write+0x49/0xa0
[<ffffffff816dd829>] system_call_fastpath+0x16/0x1b
Code: 63 c6 55 48 8d 04 40 48 89 e5 53 48 89 d3 48 8d 54 c7 30 83 6a 08 01
75 0b 48 8b 47 18 48 85 c0 74 02 ff d0 48 8b 43 08 48 8b 13 <48> 89 42 08
48 89 10 48 b8 00 01 10 00 00 00 ad de 48 89 03 48
RIP [<ffffffffa0159b81>] nouveau_event_put_locked+0x31/0x60 [nouveau]
RSP <ffff88008624fd48>

(gdb) list *(nouveau_event_put_locked+0x31)
0xbb1 is in nouveau_event_put_locked (include/linux/list.h:88).
83 * This is only for internal list manipulation where we know
84 * the prev/next entries already!
85 */
86 static inline void __list_del(struct list_head * prev, struct list_head
* next)
87 {
88 next->prev = prev;
89 prev->next = next;
90 }

Thanks,
  Daniel
-- 
Daniel J Blueman

--089e0160c35e2bdf0d04ec7c159d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Hi Marcin et al,</p>
<p dir=3D"ltr">When booting my Macbook Pro into 3.12 and powering off the N=
vidia GPU, we see nouveau try to dequeue an item which isn&#39;t present, l=
eading to a page-not-present fault. 3.11 works just nice.</p>
<p dir=3D"ltr">It looks like I should add some debug, as there aren&#39;t e=
vent enqueuing/dequeueing debug flags, or as you suggest?</p>
<p dir=3D"ltr"><a href=3D"http://quora.org/2013/dmesg.txt">http://quora.org=
/2013/dmesg.txt</a><br>
<a href=3D"http://quora.org/2013/config">http://quora.org/2013/config</a> (=
same as the Ubuntu mainline config)</p>
<p dir=3D"ltr"># echo OFF &gt;/sys/kernel/debug/vgaswitcheroo/switch<br>
hda-intel 0000:01:00.1: Disabling via VGA-switcheroo<br>
hda-intel 0000:01:00.1: Cannot lock devices!<br>
VGA switcheroo: switched nouveau off<br>
nouveau [ DRM] suspending display...<br>
general protection fault: 0000 [#1] SMP<br>
Modules linked in: dm_crypt(F) parport_pc(F) snd_hda_codec_hdmi(F) ppdev(F)=
 lib80211_crypt_tkip(F) rfcomm(F) bnep(F) joydev(F) x86_pkg_temp_thermal(F)=
 intel_powerclamp(F) coretemp(F) nfsd(F) applesmc(F) kvm_intel(F) input_pol=
ldev(F) auth_rpcgss(F) nfs_acl(F) kvm(F) crc32_pclmul(F) nfs(F) aesni_intel=
(F) aes_x86_64(F) lockd(F) glue_helper(F) binfmt_misc(F) lrw(F) gf128mul(F)=
 ablk_helper(F) cryptd(F) wl(POF) sunrpc(F) btusb(F) fscache(F) ax88179_178=
a(F) usbnet(F) snd_seq_midi(F) mii(F) uvcvideo(F) snd_seq_midi_event(F) snd=
_hda_codec_cirrus(F) bluetooth(F) bcm5974(F) videobuf2_vmalloc(F) videobuf2=
_memops(F) videobuf2_core(F) snd_rawmidi(F) videodev(F) snd_hda_intel(F) sn=
d_hda_codec(F) snd_seq(F) lib80211(F) snd_hwdep(F) snd_seq_device(F) cfg802=
11(F) lpc_ich(F) snd_pcm(F) mei_me(F) mei(F) snd_page_alloc(F) snd_timer(F)=
 snd(F) soundcore(F) nls_iso8859_1(F) apple_gmux(F) mac_hid(F) apple_bl(F) =
lp(F) parport(F) btrfs(F) xor(F) raid6_pq(F) libcrc32c(F) hid_generic(F) hi=
d_apple(F) usbhid(F) hid(F) microcode(F) ahci(F) libahci(F) nouveau(F) i915=
(F) mxm_wmi(F) wmi(F) i2c_algo_bit(F) ttm(F) drm_kms_helper(F) drm(F) video=
(F)<br>

CPU: 2 PID: 2738 Comm: bash Tainted: PF O 3.12.2-ninja+ #3<br>
Hardware name: Apple Inc. MacBookPro10,1/Mac-C3EC7CD22292981F, BIOS MBP101.=
88Z.00EE.B02.1208081132 08/08/2012<br>
task: ffff880262bb5d00 ti: ffff88008624e000 task.ti: ffff88008624e000<br>
RIP: 0010:[&lt;ffffffffa0159b81&gt;] [&lt;ffffffffa0159b81&gt;] nouveau_eve=
nt_put_locked+0x31/0x60 [nouveau]<br>
RSP: 0018:ffff88008624fd48 EFLAGS: 00010097<br>
RAX: dead000000200200 RBX: ffff88025e8bad88 RCX: 0000000000000010<br>
RDX: dead000000100100 RSI: 0000000000000011 RDI: ffff88025ef36400<br>
RBP: ffff88008624fd50 R08: 0000000000000217 R09: 000000000000052d<br>
R10: 0000000000000000 R11: ffff88008624f98e R12: 0000000000000011<br>
R13: 0000000000000217 R14: ffff88025e8bad88 R15: ffff88025e522bf0<br>
FS: 00007f08445c1740(0000) GS:ffff88026f280000(0000) knlGS:0000000000000000=
<br>
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<br>
CR2: 00007f7d5452d000 CR3: 00000000889d5000 CR4: 00000000001407e0<br>
Stack:<br>
ffff88025ef36400 ffff88008624fd80 ffffffffa0159be5 ffff88025e8ba800<br>
ffff88025e9e7240 ffff88025e522800 ffff88025e8a2b40 ffff88008624fdb8<br>
ffffffffa01c54be 0000000000000003 ffff880263819000 ffff88025e522800<br>
Call Trace:<br>
[&lt;ffffffffa0159be5&gt;] nouveau_event_put+0x35/0x50 [nouveau]<br>
[&lt;ffffffffa01c54be&gt;] nouveau_display_fini+0x8e/0xc0 [nouveau]<br>
[&lt;ffffffffa01c5afd&gt;] nouveau_display_suspend+0x1d/0xe0 [nouveau]<br>
[&lt;ffffffffa01b3bfd&gt;] nouveau_do_suspend+0x23d/0x2d0 [nouveau]<br>
[&lt;ffffffffa01b3cd6&gt;] nouveau_pmops_suspend+0x46/0xc0 [nouveau]<br>
[&lt;ffffffffa01b7404&gt;] nouveau_switcheroo_set_state+0x64/0xc0 [nouveau]=
<br>
[&lt;ffffffff8145bb98&gt;] vga_switchoff.part.2+0x18/0x40<br>
[&lt;ffffffff8145c083&gt;] vga_switcheroo_debugfs_write+0x303/0x3c0<br>
[&lt;ffffffff81195a29&gt;] ? __sb_start_write+0x49/0x100<br>
[&lt;ffffffff812c3693&gt;] ? security_file_permission+0x23/0xa0<br>
[&lt;ffffffff81193b9d&gt;] vfs_write+0xbd/0x1e0<br>
[&lt;ffffffff81194279&gt;] SyS_write+0x49/0xa0<br>
[&lt;ffffffff816dd829&gt;] system_call_fastpath+0x16/0x1b<br>
Code: 63 c6 55 48 8d 04 40 48 89 e5 53 48 89 d3 48 8d 54 c7 30 83 6a 08 01 =
75 0b 48 8b 47 18 48 85 c0 74 02 ff d0 48 8b 43 08 48 8b 13 &lt;48&gt; 89 4=
2 08 48 89 10 48 b8 00 01 10 00 00 00 ad de 48 89 03 48<br>
RIP [&lt;ffffffffa0159b81&gt;] nouveau_event_put_locked+0x31/0x60 [nouveau]=
<br>
RSP &lt;ffff88008624fd48&gt;</p>
<p dir=3D"ltr">(gdb) list *(nouveau_event_put_locked+0x31)<br>
0xbb1 is in nouveau_event_put_locked (include/linux/list.h:88).<br>
83 * This is only for internal list manipulation where we know<br>
84 * the prev/next entries already!<br>
85 */<br>
86 static inline void __list_del(struct list_head * prev, struct list_head =
* next)<br>
87 {<br>
88 next-&gt;prev =3D prev;<br>
89 prev-&gt;next =3D next;<br>
90 }</p>
<p dir=3D"ltr">Thanks,<br>
=A0 Daniel<br>
-- <br>
Daniel J Blueman</p>

--089e0160c35e2bdf0d04ec7c159d--

--===============0472216963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0472216963==--
