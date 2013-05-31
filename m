From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 62914] ZaphodHeads doesn't work after upgrading to
	xorg 1.14
Date: Fri, 31 May 2013 03:28:01 +0000
Message-ID: <bug-62914-8800-gvZTDJD6vs@http.bugs.freedesktop.org/>
References: <bug-62914-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0830728115=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-62914-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0830728115==
Content-Type: multipart/alternative; boundary="1369970881.C53fb3d1.18836"; charset="us-ascii"


--1369970881.C53fb3d1.18836
Date: Fri, 31 May 2013 03:28:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=62914

--- Comment #22 from Jason Stubbs <jasonbstubbs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 80078
  --> https://bugs.freedesktop.org/attachment.cgi?id=80078&action=edit
disassemble of segfault location

Backtrace:
disassemble 0x263f7 taken from frame 3 below

0: /usr/bin/X (xorg_backtrace+0x36) [0x53ccca]
1: /usr/bin/X (0x400000+0x13fe6b) [0x53fe6b]
2: /lib64/libpthread.so.0 (0x7f89dcbe8000+0x11070) [0x7f89dcbf9070]
3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f89da6e0000+0x263f7)
[0x7f89da7063f7]
4: /usr/bin/X (xf86CrtcSetModeTransform+0x14f) [0x493916]
5: /usr/bin/X (xf86SetDesiredModes+0x251) [0x493fb4]
6: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f89da6e0000+0xee51)
[0x7f89da6eee51]
7: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f89da6e0000+0xf78e)
[0x7f89da6ef78e]
8: /usr/bin/X (0x400000+0x91c1e) [0x491c1e]
9: /usr/bin/X (0x400000+0x29362) [0x429362]
10: /lib64/libc.so.6 (__libc_start_main+0xed) [0x7f89db89464d]
11: /usr/bin/X (0x400000+0x29779) [0x429779]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1369970881.C53fb3d1.18836
Date: Fri, 31 May 2013 03:28:01 +0000
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
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - ZaphodHeads doesn't work after upgrading to xorg 1.14"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=62914">bug 62914</a>
              from <span class="vcard"><a class="email" href="mailto:jasonbstubbs&#64;gmail.com" title="Jason Stubbs &lt;jasonbstubbs&#64;gmail.com&gt;"> <span class="fn">Jason Stubbs</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=80078" name="attach_80078" title="disassemble of segfault location">attachment 80078</a> <a href="attachment.cgi?id=80078&amp;action=edit" title="disassemble of segfault location">[details]</a></span>
disassemble of segfault location

Backtrace:
disassemble 0x263f7 taken from frame 3 below

0: /usr/bin/X (xorg_backtrace+0x36) [0x53ccca]
1: /usr/bin/X (0x400000+0x13fe6b) [0x53fe6b]
2: /lib64/libpthread.so.0 (0x7f89dcbe8000+0x11070) [0x7f89dcbf9070]
3: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f89da6e0000+0x263f7)
[0x7f89da7063f7]
4: /usr/bin/X (xf86CrtcSetModeTransform+0x14f) [0x493916]
5: /usr/bin/X (xf86SetDesiredModes+0x251) [0x493fb4]
6: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f89da6e0000+0xee51)
[0x7f89da6eee51]
7: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7f89da6e0000+0xf78e)
[0x7f89da6ef78e]
8: /usr/bin/X (0x400000+0x91c1e) [0x491c1e]
9: /usr/bin/X (0x400000+0x29362) [0x429362]
10: /lib64/libc.so.6 (__libc_start_main+0xed) [0x7f89db89464d]
11: /usr/bin/X (0x400000+0x29779) [0x429779]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1369970881.C53fb3d1.18836--

--===============0830728115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0830728115==--
