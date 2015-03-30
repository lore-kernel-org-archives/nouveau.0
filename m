From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Mon, 30 Mar 2015 17:58:40 +0000
Message-ID: <bug-82714-8800-l9sI6gto5d@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1798884193=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1798884193==
Content-Type: multipart/alternative; boundary="1427738320.feaaA2a52.3812"; charset="UTF-8"


--1427738320.feaaA2a52.3812
Date: Mon, 30 Mar 2015 17:58:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #7 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
Created attachment 114730
  --> https://bugs.freedesktop.org/attachment.cgi?id=114730&action=edit
dmesg with 3.19

Sorry for rather late reply, so no issue you being slow too.

(In reply to Pierre Moreau from comment #6)
> Sorry, I didn't had much time to look into it...
> I'm currently tracking some similar problems on my G96, which is a secondary
> GPU. Hopefully, if I manage to solve it, the patch will help you too.
> 
> (In reply to Bruno from comment #5)
> > After fresh boot:
> > echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/reset
> 
> Does adding an `echo 1 > /sys/bus/pci/devices/0000\:01\:00.0/rescan` after
> the reset changes something?

Seen no change in behavior.

> You hit some PFIFO interrupt 0x00200000... Btw, which kernel version was
> this log taken from?

Should have been 3.18 looking at the bug history.

> Could you please take another log using the reset/rescan trick with nouveau.debug=debug?
> The debug argument of Nouveau takes a string (allowed values are "fatal",
> "error", "warn", "info", "debug", "trace", "paranoia" and "spam"),
> so your 0xff didn't worked.

Retried with `modprobe nouveau debug=debug`
Full dmesg attached.

> It's likely that the PFIFO interrupt is unrelated to the "unable to handle
> kernel paging request" problem, so you should consider opening a new bug
> report for it.

As previously, no (real) badness by just modprobing nouveau.

Starting Xorg on top of it (though while having other Xorg running on radeon,
but from local linux console) gets my a stuck Xorg:
[<ffffffff815704ac>] rpm_resume+0x18c/0x5c0
[<ffffffff81570928>] __pm_runtime_resume+0x48/0x70
[<ffffffffa00914af>] nouveau_drm_open+0x3f/0x230 [nouveau]
[<ffffffff8144123d>] drm_open+0x1ad/0x4b0
[<ffffffff81447711>] drm_stub_open+0xb1/0x130
[<ffffffff811c6371>] chrdev_open+0xb1/0x190
[<ffffffff811bf702>] do_dentry_open.isra.18+0x1f2/0x320
[<ffffffff811bf8a1>] vfs_open+0x41/0x50
[<ffffffff811cd056>] do_last.isra.59+0x266/0xf20
[<ffffffff811d0329>] path_openat+0x89/0x5a0
[<ffffffff811d18ae>] do_filp_open+0x3e/0xa0
[<ffffffff811c0eee>] do_sys_open+0x12e/0x230
[<ffffffff811c1009>] SyS_open+0x19/0x20
[<ffffffff81861252>] system_call_fastpath+0x12/0x17
[<ffffffffffffffff>] 0xffffffffffffffff

That Xorg's log is rather boring with 55 lines ending with:
[   835.442] (==) ModulePath set to "/usr/lib64/xorg/modules"
[   835.442] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[   835.442] (II) Loader magic: 0x812c80
[   835.442] (II) Module ABI versions:
[   835.442]    X.Org ANSI C Emulation: 0.4
[   835.442]    X.Org Video Driver: 18.0
[   835.442]    X.Org XInput driver : 21.0
[   835.442]    X.Org Server Extension : 8.0
[   835.443] (II) xfree86: Adding drm device (/dev/dri/card0)
[   835.444] (II) xfree86: Adding drm device (/dev/dri/card1)


From Xorg's kernel-side stack it looks stuck in runtime-PM. Will retry with
runpm=0 for safety... (and then also with 4.0-rc6)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427738320.feaaA2a52.3812
Date: Mon, 30 Mar 2015 17:58:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=114730" name="attach_114730" title="dmesg with 3.19">attachment 114730</a> <a href="attachment.cgi?id=114730&amp;action=edit" title="dmesg with 3.19">[details]</a></span>
dmesg with 3.19

Sorry for rather late reply, so no issue you being slow too.

(In reply to Pierre Moreau from <a href="show_bug.cgi?id=82714#c6">comment #6</a>)
<span class="quote">&gt; Sorry, I didn't had much time to look into it...
&gt; I'm currently tracking some similar problems on my G96, which is a secondary
&gt; GPU. Hopefully, if I manage to solve it, the patch will help you too.
&gt; 
&gt; (In reply to Bruno from <a href="show_bug.cgi?id=82714#c5">comment #5</a>)
&gt; &gt; After fresh boot:
&gt; &gt; echo 1 &gt; /sys/bus/pci/devices/0000\:01\:00.0/reset
&gt; 
&gt; Does adding an `echo 1 &gt; /sys/bus/pci/devices/0000\:01\:00.0/rescan` after
&gt; the reset changes something?</span >

Seen no change in behavior.

<span class="quote">&gt; You hit some PFIFO interrupt 0x00200000... Btw, which kernel version was
&gt; this log taken from?</span >

Should have been 3.18 looking at the bug history.

<span class="quote">&gt; Could you please take another log using the reset/rescan trick with nouveau.debug=debug?
&gt; The debug argument of Nouveau takes a string (allowed values are &quot;fatal&quot;,
&gt; &quot;error&quot;, &quot;warn&quot;, &quot;info&quot;, &quot;debug&quot;, &quot;trace&quot;, &quot;paranoia&quot; and &quot;spam&quot;),
&gt; so your 0xff didn't worked.</span >

Retried with `modprobe nouveau debug=debug`
Full dmesg attached.

<span class="quote">&gt; It's likely that the PFIFO interrupt is unrelated to the &quot;unable to handle
&gt; kernel paging request&quot; problem, so you should consider opening a new bug
&gt; report for it.</span >

As previously, no (real) badness by just modprobing nouveau.

Starting Xorg on top of it (though while having other Xorg running on radeon,
but from local linux console) gets my a stuck Xorg:
[&lt;ffffffff815704ac&gt;] rpm_resume+0x18c/0x5c0
[&lt;ffffffff81570928&gt;] __pm_runtime_resume+0x48/0x70
[&lt;ffffffffa00914af&gt;] nouveau_drm_open+0x3f/0x230 [nouveau]
[&lt;ffffffff8144123d&gt;] drm_open+0x1ad/0x4b0
[&lt;ffffffff81447711&gt;] drm_stub_open+0xb1/0x130
[&lt;ffffffff811c6371&gt;] chrdev_open+0xb1/0x190
[&lt;ffffffff811bf702&gt;] do_dentry_open.isra.18+0x1f2/0x320
[&lt;ffffffff811bf8a1&gt;] vfs_open+0x41/0x50
[&lt;ffffffff811cd056&gt;] do_last.isra.59+0x266/0xf20
[&lt;ffffffff811d0329&gt;] path_openat+0x89/0x5a0
[&lt;ffffffff811d18ae&gt;] do_filp_open+0x3e/0xa0
[&lt;ffffffff811c0eee&gt;] do_sys_open+0x12e/0x230
[&lt;ffffffff811c1009&gt;] SyS_open+0x19/0x20
[&lt;ffffffff81861252&gt;] system_call_fastpath+0x12/0x17
[&lt;ffffffffffffffff&gt;] 0xffffffffffffffff

That Xorg's log is rather boring with 55 lines ending with:
[   835.442] (==) ModulePath set to &quot;/usr/lib64/xorg/modules&quot;
[   835.442] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[   835.442] (II) Loader magic: 0x812c80
[   835.442] (II) Module ABI versions:
[   835.442]    X.Org ANSI C Emulation: 0.4
[   835.442]    X.Org Video Driver: 18.0
[   835.442]    X.Org XInput driver : 21.0
[   835.442]    X.Org Server Extension : 8.0
[   835.443] (II) xfree86: Adding drm device (/dev/dri/card0)
[   835.444] (II) xfree86: Adding drm device (/dev/dri/card1)


From Xorg's kernel-side stack it looks stuck in runtime-PM. Will retry with
runpm=0 for safety... (and then also with 4.0-rc6)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427738320.feaaA2a52.3812--

--===============1798884193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1798884193==--
