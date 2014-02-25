From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Tue, 25 Feb 2014 14:22:25 +0000
Message-ID: <bug-75279-8800-sGDN8xyetR@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1581180053=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1581180053==
Content-Type: multipart/alternative; boundary="1393338145.aeC3edb02.20605"; charset="us-ascii"


--1393338145.aeC3edb02.20605
Date: Tue, 25 Feb 2014 14:22:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #19 from Benoit Jacob <bjacob-4eJtQOnFJqFBDgjK7y7TUQ@public.gmane.org> ---
A duplicate Mozilla bug has a stack with symbols:

https://bugzilla.mozilla.org/show_bug.cgi?id=975512#c1

#0  0x0000003f3a2da007 in sched_yield () from /lib64/libc.so.6
#1  0x00007f1e003bb1d1 in nouveau_fence_wait ()
   from /usr/lib64/dri/nouveau_dri.so
#2  0x00007f1e0039d635 in nvc0_screen_destroy ()
   from /usr/lib64/dri/nouveau_dri.so
#3  0x00007f1e002c6d9f in dri_destroy_screen_helper ()
   from /usr/lib64/dri/nouveau_dri.so
#4  0x00007f1e002c6e25 in dri_destroy_screen ()
   from /usr/lib64/dri/nouveau_dri.so
#5  0x00007f1e000087eb in driDestroyScreen ()
   from /usr/lib64/dri/nouveau_dri.so
#6  0x000000321f646932 in dri2DestroyScreen () from /lib64/libGL.so.1
#7  0x000000321f61c526 in FreeScreenConfigs.isra.3 () from /lib64/libGL.so.1
#8  0x000000321f61c5a5 in glx_display_free () from /lib64/libGL.so.1
#9  0x000000321f61c6a5 in __glXCloseDisplay () from /lib64/libGL.so.1
#10 0x0000003f3e21fd22 in XCloseDisplay () from /lib64/libX11.so.6
#11 0x00007f1e09933dcf in glxtest() () from /home/sstangl/bin/nightly/libxul.so
#12 0x00007f1e09934b36 in fire_glxtest_process() ()
   from /home/sstangl/bin/nightly/libxul.so
#13 0x00007f1e0992e655 in XREMain::XRE_mainInit(bool*) ()
   from /home/sstangl/bin/nightly/libxul.so
#14 0x00007f1e09932886 in XREMain::XRE_main(int, char**, nsXREAppData const*)
    () from /home/sstangl/bin/nightly/libxul.so
---Type <return> to continue, or q <return> to quit---
#15 0x00007f1e09932b94 in XRE_main () from /home/sstangl/bin/nightly/libxul.so
#16 0x0000000000406b66 in do_main(int, char**, nsIFile*) ()
#17 0x000000000040383b in main ()

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393338145.aeC3edb02.20605
Date: Tue, 25 Feb 2014 14:22:25 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:bjacob&#64;mozilla.com" title="Benoit Jacob &lt;bjacob&#64;mozilla.com&gt;"> <span class="fn">Benoit Jacob</span></a>
</span></b>
        <pre>A duplicate Mozilla bug has a stack with symbols:

<a href="https://bugzilla.mozilla.org/show_bug.cgi?id=975512#c1">https://bugzilla.mozilla.org/show_bug.cgi?id=975512#c1</a>

#0  0x0000003f3a2da007 in sched_yield () from /lib64/libc.so.6
#1  0x00007f1e003bb1d1 in nouveau_fence_wait ()
   from /usr/lib64/dri/nouveau_dri.so
#2  0x00007f1e0039d635 in nvc0_screen_destroy ()
   from /usr/lib64/dri/nouveau_dri.so
#3  0x00007f1e002c6d9f in dri_destroy_screen_helper ()
   from /usr/lib64/dri/nouveau_dri.so
#4  0x00007f1e002c6e25 in dri_destroy_screen ()
   from /usr/lib64/dri/nouveau_dri.so
#5  0x00007f1e000087eb in driDestroyScreen ()
   from /usr/lib64/dri/nouveau_dri.so
#6  0x000000321f646932 in dri2DestroyScreen () from /lib64/libGL.so.1
#7  0x000000321f61c526 in FreeScreenConfigs.isra.3 () from /lib64/libGL.so.1
#8  0x000000321f61c5a5 in glx_display_free () from /lib64/libGL.so.1
#9  0x000000321f61c6a5 in __glXCloseDisplay () from /lib64/libGL.so.1
#10 0x0000003f3e21fd22 in XCloseDisplay () from /lib64/libX11.so.6
#11 0x00007f1e09933dcf in glxtest() () from /home/sstangl/bin/nightly/libxul.so
#12 0x00007f1e09934b36 in fire_glxtest_process() ()
   from /home/sstangl/bin/nightly/libxul.so
#13 0x00007f1e0992e655 in XREMain::XRE_mainInit(bool*) ()
   from /home/sstangl/bin/nightly/libxul.so
#14 0x00007f1e09932886 in XREMain::XRE_main(int, char**, nsXREAppData const*)
    () from /home/sstangl/bin/nightly/libxul.so
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
#15 0x00007f1e09932b94 in XRE_main () from /home/sstangl/bin/nightly/libxul.so
#16 0x0000000000406b66 in do_main(int, char**, nsIFile*) ()
#17 0x000000000040383b in main ()</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393338145.aeC3edb02.20605--

--===============1581180053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1581180053==--
