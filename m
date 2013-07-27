From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67382] [nouveau,
 nv50] linux 3.9.7-3.10.3: Xorg won't be available
Date: Sat, 27 Jul 2013 16:28:45 +0000
Message-ID: <bug-67382-8800-7LNpbSdAAe@http.bugs.freedesktop.org/>
References: <bug-67382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0880823383=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0880823383==
Content-Type: multipart/alternative; boundary="1374942525.b5B23f51.4800"; charset="us-ascii"


--1374942525.b5B23f51.4800
Date: Sat, 27 Jul 2013 16:28:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67382

--- Comment #6 from Anonymous Helper <anonymous-IjDkMZObD1hBDgjK7y7TUQ@public.gmane.org> ---
Result linux-3.9.7 without the
drm-nv50-disp-force-dac-power-state-during-load-detect.patch[0]: Stuff is
working like it should

No ghost monitor anymore:
Current Operating System: Linux Hekate 3.9.7-1-ARCH #1 SMP PREEMPT Sat Jul 27
17:56:17 CEST 2013 i686
(...)
(II) NOUVEAU(0): Output DVI-I-1 connected
(II) NOUVEAU(0): Output DVI-I-2 disconnected



( Whereas the failing 3.9.7 Xorg log looks like that:
Current Operating System: Linux Hekate 3.9.7-1-ARCH #1 SMP PREEMPT Thu Jun 20
23:22:07 CEST 2013 i686
(...)
(II) NOUVEAU(0): Output DVI-I-1 connected
(II) NOUVEAU(0): Output DVI-I-2 connected )




_______
[0]
https://git.kernel.org/cgit/linux/kernel/git/stable/stable-queue.git/tree/releases/3.9.7/drm-nv50-disp-force-dac-power-state-during-load-detect.patch?id=4c71e2e7d2a2175d6682447fd44fcbf5d5a98df8

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374942525.b5B23f51.4800
Date: Sat, 27 Jul 2013 16:28:45 +0000
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
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nouveau, nv50] linux 3.9.7-3.10.3: Xorg won't be available"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67382">bug 67382</a>
              from <span class="vcard"><a class="email" href="mailto:anonymous&#64;dodgeit.com" title="Anonymous Helper &lt;anonymous&#64;dodgeit.com&gt;"> <span class="fn">Anonymous Helper</span></a>
</span></b>
        <pre>Result linux-3.9.7 without the
drm-nv50-disp-force-dac-power-state-during-load-detect.patch[0]: Stuff is
working like it should

No ghost monitor anymore:
Current Operating System: Linux Hekate 3.9.7-1-ARCH #1 SMP PREEMPT Sat Jul 27
17:56:17 CEST 2013 i686
(...)
(II) NOUVEAU(0): Output DVI-I-1 connected
(II) NOUVEAU(0): Output DVI-I-2 disconnected



( Whereas the failing 3.9.7 Xorg log looks like that:
Current Operating System: Linux Hekate 3.9.7-1-ARCH #1 SMP PREEMPT Thu Jun 20
23:22:07 CEST 2013 i686
(...)
(II) NOUVEAU(0): Output DVI-I-1 connected
(II) NOUVEAU(0): Output DVI-I-2 connected )




_______
[0]
<a href="https://git.kernel.org/cgit/linux/kernel/git/stable/stable-queue.git/tree/releases/3.9.7/drm-nv50-disp-force-dac-power-state-during-load-detect.patch?id=4c71e2e7d2a2175d6682447fd44fcbf5d5a98df8">https://git.kernel.org/cgit/linux/kernel/git/stable/stable-queue.git/tree/releases/3.9.7/drm-nv50-disp-force-dac-power-state-during-load-detect.patch?id=4c71e2e7d2a2175d6682447fd44fcbf5d5a98df8</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374942525.b5B23f51.4800--

--===============0880823383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0880823383==--
