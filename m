From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Mon, 25 Feb 2013 19:42:42 +0000
Message-ID: <bug-50121-8800-8cimor9AC8@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0867491322=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0867491322==
Content-Type: multipart/alternative; boundary="1361821363.F78Edd0c5.3624"; charset="us-ascii"


--1361821363.F78Edd0c5.3624
Date: Mon, 25 Feb 2013 19:42:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #69 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Whoops, typo in first sentence. What I meant was:

Is the crash consistent? Does it happen every time? The fix should be applied
at v3.7.3:

ronald@Alpha /usr/src/linux :) $ git log --oneline --no-merges v3.7^...v3.7.9
-- drivers/gpu/drm/nouveau Makefile
5b7be63 Linux 3.7.9
7773647 Linux 3.7.8
330b8ab drm/nouveau: add lockdep annotations
89c5f13 Linux 3.7.7
07c4ee0 Linux 3.7.6
13280f4 Linux 3.7.5
8380f1a arm64: makefile: fix uname munging when setting ARCH on native machine
8a69ca2 Linux 3.7.4
078314e Linux 3.7.3
39c5cda drm/nvc0/fb: fix crash when different mutex is used to protect same
list
c6f94c3 drm/nouveau/clock: fix support for more than 2 monitors on nve0
7fbc316 drm/nouveau: add locking around instobj list operations
4d64387 drm/nouveau: fix blank LVDS screen regression on pre-nv50 cards
ad30b29 drm/nv17-50: restore fence buffer on resume
2370a21 drm/prime: drop reference on imported dma-buf come from gem
cfdfb8f drm/nouveau: fix init with agpgart-uninorth
a77af8b kbuild: Do not remove vmlinux when cleaning external module
e6577f3 Linux 3.7.2
cc86050 Linux 3.7.1
2959440 Linux 3.7

Yes, I'm showing off my newly attained git skillz =P

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361821363.F78Edd0c5.3624
Date: Mon, 25 Feb 2013 19:42:43 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c69">Comment # 69</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Whoops, typo in first sentence. What I meant was:

Is the crash consistent? Does it happen every time? The fix should be applied
at v3.7.3:

ronald&#64;Alpha /usr/src/linux :) $ git log --oneline --no-merges v3.7^...v3.7.9
-- drivers/gpu/drm/nouveau Makefile
5b7be63 Linux 3.7.9
7773647 Linux 3.7.8
330b8ab drm/nouveau: add lockdep annotations
89c5f13 Linux 3.7.7
07c4ee0 Linux 3.7.6
13280f4 Linux 3.7.5
8380f1a arm64: makefile: fix uname munging when setting ARCH on native machine
8a69ca2 Linux 3.7.4
078314e Linux 3.7.3
39c5cda drm/nvc0/fb: fix crash when different mutex is used to protect same
list
c6f94c3 drm/nouveau/clock: fix support for more than 2 monitors on nve0
7fbc316 drm/nouveau: add locking around instobj list operations
4d64387 drm/nouveau: fix blank LVDS screen regression on pre-nv50 cards
ad30b29 drm/nv17-50: restore fence buffer on resume
2370a21 drm/prime: drop reference on imported dma-buf come from gem
cfdfb8f drm/nouveau: fix init with agpgart-uninorth
a77af8b kbuild: Do not remove vmlinux when cleaning external module
e6577f3 Linux 3.7.2
cc86050 Linux 3.7.1
2959440 Linux 3.7

Yes, I'm showing off my newly attained git skillz =P</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361821363.F78Edd0c5.3624--

--===============0867491322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0867491322==--
