From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Mon, 29 Dec 2014 06:28:43 +0000
Message-ID: <bug-87819-8800-VQV74XwI2Z@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0684939842=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0684939842==
Content-Type: multipart/alternative; boundary="1419834523.2E14b0d1.18660"; charset="UTF-8"


--1419834523.2E14b0d1.18660
Date: Mon, 29 Dec 2014 06:28:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
EQ overflowing == driver is stuck (in this case, at least). That "show state"
shows:

[ 1014.288718] Xorg            R  running task        0  1638   1589 0x00400004
[ 1014.288720]  ffff8800bc98fb48 ffffffff82f158c0 ffff8800bc98ffd8
0000000000014200
[ 1014.288722]  ffff880138e7fb80 ffffffff82c1c500 ffff8800be2f8000
0000000000000000
[ 1014.288724]  ffff8800bc98fb80 000000010002d6d7 ffffffff82f158c0
ffffffff82f158c0
[ 1014.288727] Call Trace:
[ 1014.288729]  [<ffffffff827cd549>] schedule+0x29/0x70
[ 1014.288731]  [<ffffffff827d023c>] schedule_timeout+0x11c/0x210
[ 1014.288734]  [<ffffffff820deea0>] ? call_timer_fn+0x160/0x160
[ 1014.288736]  [<ffffffff827d11ae>] ? _raw_spin_unlock_irqrestore+0x1e/0x50
[ 1014.288739]  [<ffffffff8252f2c5>] fence_default_wait.part.10+0xe5/0x220
[ 1014.288741]  [<ffffffff8252e0e0>] ? fence_remove_callback+0x70/0x70
[ 1014.288744]  [<ffffffff8252f42c>] fence_default_wait+0x2c/0x30
[ 1014.288746]  [<ffffffff8252e13f>] fence_wait_timeout+0x3f/0x100
[ 1014.288748]  [<ffffffff8252fcf0>]
reservation_object_wait_timeout_rcu+0xa0/0x2c0
[ 1014.288799]  [<ffffffffc03a15af>] nouveau_gem_ioctl_cpu_prep+0x6f/0x120
[nouveau]
[ 1014.288816]  [<ffffffffc022ce76>] drm_ioctl+0x2e6/0x590 [drm]
[ 1014.288843]  [<ffffffffc03a1540>] ? nouveau_gem_ioctl_pushbuf+0x9a0/0x9a0
[nouveau]
[ 1014.288846]  [<ffffffff82020ac6>] ? init_fpu+0x56/0xc0
[ 1014.288848]  [<ffffffff82021b49>] ? __restore_xstate_sig+0x99/0x6b0
[ 1014.288874]  [<ffffffffc0396c98>] nouveau_drm_ioctl+0x68/0xf0 [nouveau]
[ 1014.288877]  [<ffffffff820839c7>] ? __set_task_blocked+0x37/0x80
[ 1014.288879]  [<ffffffff82208b25>] do_vfs_ioctl+0x75/0x320
[ 1014.288881]  [<ffffffff82087408>] ? restore_altstack+0x18/0x30
[ 1014.288884]  [<ffffffff82015238>] ? sys_rt_sigreturn+0xb8/0xd0
[ 1014.288886]  [<ffffffff82208e61>] SyS_ioctl+0x91/0xb0
[ 1014.288889]  [<ffffffff827d176d>] system_call_fastpath+0x16/0x1b


Which basically just means that it's waiting for a fence to be reached, which
in turn means that the GPU hung. GPU hang recovery is... lacking in nouveau.

Were you doing anything in particular in firefox? (Like running a WebGL
testsuite or something)

Does booting with 'nouveau.config=NvMSI=0' help things? I would assume not, but
it's an easy one to knock out.

Lastly, there are some patches eventually destined for 3.19 related to
nvaa/nvac but which haven't made it to Linus's tree yet:

http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.19

(specifically the 3 prefixed with drm/nouveau/fb/ram/mcp77.) Would be great if
you could give those a shot.

Also it'd be nice to verify that 256MB is the correct quantity of stolen memory
to be used as VRAM. This is often configurable from the bios, and you can
probably get that information from the nvidia blob too.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1419834523.2E14b0d1.18660
Date: Mon, 29 Dec 2014 06:28:43 +0000
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
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>EQ overflowing == driver is stuck (in this case, at least). That &quot;show state&quot;
shows:

[ 1014.288718] Xorg            R  running task        0  1638   1589 0x00400004
[ 1014.288720]  ffff8800bc98fb48 ffffffff82f158c0 ffff8800bc98ffd8
0000000000014200
[ 1014.288722]  ffff880138e7fb80 ffffffff82c1c500 ffff8800be2f8000
0000000000000000
[ 1014.288724]  ffff8800bc98fb80 000000010002d6d7 ffffffff82f158c0
ffffffff82f158c0
[ 1014.288727] Call Trace:
[ 1014.288729]  [&lt;ffffffff827cd549&gt;] schedule+0x29/0x70
[ 1014.288731]  [&lt;ffffffff827d023c&gt;] schedule_timeout+0x11c/0x210
[ 1014.288734]  [&lt;ffffffff820deea0&gt;] ? call_timer_fn+0x160/0x160
[ 1014.288736]  [&lt;ffffffff827d11ae&gt;] ? _raw_spin_unlock_irqrestore+0x1e/0x50
[ 1014.288739]  [&lt;ffffffff8252f2c5&gt;] fence_default_wait.part.10+0xe5/0x220
[ 1014.288741]  [&lt;ffffffff8252e0e0&gt;] ? fence_remove_callback+0x70/0x70
[ 1014.288744]  [&lt;ffffffff8252f42c&gt;] fence_default_wait+0x2c/0x30
[ 1014.288746]  [&lt;ffffffff8252e13f&gt;] fence_wait_timeout+0x3f/0x100
[ 1014.288748]  [&lt;ffffffff8252fcf0&gt;]
reservation_object_wait_timeout_rcu+0xa0/0x2c0
[ 1014.288799]  [&lt;ffffffffc03a15af&gt;] nouveau_gem_ioctl_cpu_prep+0x6f/0x120
[nouveau]
[ 1014.288816]  [&lt;ffffffffc022ce76&gt;] drm_ioctl+0x2e6/0x590 [drm]
[ 1014.288843]  [&lt;ffffffffc03a1540&gt;] ? nouveau_gem_ioctl_pushbuf+0x9a0/0x9a0
[nouveau]
[ 1014.288846]  [&lt;ffffffff82020ac6&gt;] ? init_fpu+0x56/0xc0
[ 1014.288848]  [&lt;ffffffff82021b49&gt;] ? __restore_xstate_sig+0x99/0x6b0
[ 1014.288874]  [&lt;ffffffffc0396c98&gt;] nouveau_drm_ioctl+0x68/0xf0 [nouveau]
[ 1014.288877]  [&lt;ffffffff820839c7&gt;] ? __set_task_blocked+0x37/0x80
[ 1014.288879]  [&lt;ffffffff82208b25&gt;] do_vfs_ioctl+0x75/0x320
[ 1014.288881]  [&lt;ffffffff82087408&gt;] ? restore_altstack+0x18/0x30
[ 1014.288884]  [&lt;ffffffff82015238&gt;] ? sys_rt_sigreturn+0xb8/0xd0
[ 1014.288886]  [&lt;ffffffff82208e61&gt;] SyS_ioctl+0x91/0xb0
[ 1014.288889]  [&lt;ffffffff827d176d&gt;] system_call_fastpath+0x16/0x1b


Which basically just means that it's waiting for a fence to be reached, which
in turn means that the GPU hung. GPU hang recovery is... lacking in nouveau.

Were you doing anything in particular in firefox? (Like running a WebGL
testsuite or something)

Does booting with 'nouveau.config=NvMSI=0' help things? I would assume not, but
it's an easy one to knock out.

Lastly, there are some patches eventually destined for 3.19 related to
nvaa/nvac but which haven't made it to Linus's tree yet:

<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.19">http://cgit.freedesktop.org/nouveau/linux-2.6/log/?h=linux-3.19</a>

(specifically the 3 prefixed with drm/nouveau/fb/ram/mcp77.) Would be great if
you could give those a shot.

Also it'd be nice to verify that 256MB is the correct quantity of stolen memory
to be used as VRAM. This is often configurable from the bios, and you can
probably get that information from the nvidia blob too.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1419834523.2E14b0d1.18660--

--===============0684939842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0684939842==--
