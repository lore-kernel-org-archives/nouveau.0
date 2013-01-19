From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59597] Segmentation fault when moving (part of)
 window outside screen area
Date: Sat, 19 Jan 2013 22:04:00 +0000
Message-ID: <bug-59597-8800-89VOYuWcMf@http.bugs.freedesktop.org/>
References: <bug-59597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0607530251=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0607530251==
Content-Type: multipart/alternative; boundary="1358633040.6D2ad0.15802"; charset="us-ascii"


--1358633040.6D2ad0.15802
Date: Sat, 19 Jan 2013 22:04:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59597

--- Comment #3 from bugs.freedesktop-AKmYONJMgVsEZ6m2XrtfIFpr/1R2p/CL@public.gmane.org ---
you're right, I must have chosen the wrong file. Sorry about that.

This is what I'm referring to:

[    52.829] (EE) Backtrace:
[    52.829] (EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x7ffc28073b76]
[    52.829] (EE) 1: /usr/bin/X (0x7ffc27ecb000+0x1ac9a9) [0x7ffc280779a9]
[    52.829] (EE) 2: /lib/x86_64-linux-gnu/libpthread.so.0
(0x7ffc271f1000+0xfcb0) [0x7ffc27200cb0]
[    52.829] (EE) 3: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7ffc24cd1000+0x102b1) [0x7ffc24ce12b1]
[    52.829] (EE) 4: /usr/lib/xorg/modules/libshadowfb.so
(0x7ffc23c69000+0x3af3) [0x7ffc23c6caf3]
[    52.829] (EE) 5: /usr/bin/X (0x7ffc27ecb000+0x51a4b) [0x7ffc27f1ca4b]
[    52.829] (EE) 6: /usr/bin/X (0x7ffc27ecb000+0x55a91) [0x7ffc27f20a91]
[    52.829] (EE) 7: /usr/bin/X (0x7ffc27ecb000+0x4456a) [0x7ffc27f0f56a]
[    52.829] (EE) 8: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xed)
[0x7ffc25e7676d]
[    52.829] (EE) 9: /usr/bin/X (0x7ffc27ecb000+0x448ad) [0x7ffc27f0f8ad]
[    52.829] (EE) 
[    52.829] (EE) Segmentation fault at address 0x7ffc23c70000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358633040.6D2ad0.15802
Date: Sat, 19 Jan 2013 22:04:00 +0000
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
   title="NEW --- - Segmentation fault when moving (part of) window outside screen area"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59597#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Segmentation fault when moving (part of) window outside screen area"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59597">bug 59597</a>
              from <span class="vcard"><a class="email" href="mailto:bugs.freedesktop&#64;lindbergonline.dk" title="bugs.freedesktop&#64;lindbergonline.dk">bugs.freedesktop&#64;lindbergonline.dk</a>
</span></b>
        <pre>you're right, I must have chosen the wrong file. Sorry about that.

This is what I'm referring to:

[    52.829] (EE) Backtrace:
[    52.829] (EE) 0: /usr/bin/X (xorg_backtrace+0x36) [0x7ffc28073b76]
[    52.829] (EE) 1: /usr/bin/X (0x7ffc27ecb000+0x1ac9a9) [0x7ffc280779a9]
[    52.829] (EE) 2: /lib/x86_64-linux-gnu/libpthread.so.0
(0x7ffc271f1000+0xfcb0) [0x7ffc27200cb0]
[    52.829] (EE) 3: /usr/lib/xorg/modules/drivers/nouveau_drv.so
(0x7ffc24cd1000+0x102b1) [0x7ffc24ce12b1]
[    52.829] (EE) 4: /usr/lib/xorg/modules/libshadowfb.so
(0x7ffc23c69000+0x3af3) [0x7ffc23c6caf3]
[    52.829] (EE) 5: /usr/bin/X (0x7ffc27ecb000+0x51a4b) [0x7ffc27f1ca4b]
[    52.829] (EE) 6: /usr/bin/X (0x7ffc27ecb000+0x55a91) [0x7ffc27f20a91]
[    52.829] (EE) 7: /usr/bin/X (0x7ffc27ecb000+0x4456a) [0x7ffc27f0f56a]
[    52.829] (EE) 8: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0xed)
[0x7ffc25e7676d]
[    52.829] (EE) 9: /usr/bin/X (0x7ffc27ecb000+0x448ad) [0x7ffc27f0f8ad]
[    52.829] (EE) 
[    52.829] (EE) Segmentation fault at address 0x7ffc23c70000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358633040.6D2ad0.15802--

--===============0607530251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0607530251==--
