From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Wed, 05 Mar 2014 20:09:56 +0000
Message-ID: <bug-75279-8800-vp6Pk02C0k@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0901695213=="
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


--===============0901695213==
Content-Type: multipart/alternative; boundary="1394050196.ceAbe72.17727"; charset="us-ascii"


--1394050196.ceAbe72.17727
Date: Wed, 5 Mar 2014 20:09:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #29 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Looks like a NouVeau is triggered by Mozilla Firefox trunk code.

I opened a bug on mozilla bugtracker,
https://bugzilla.mozilla.org/show_bug.cgi?id=978439

Even if I find a "dirty workaround", valgrind logs are showing a NouVeau driver
bug.

I will attach both Mozilla Firefox valgrind log and glxtest one.

But there is a common part :

Invalid read of size 4
    at 0x8DBA0BE: nouveau_fence_wait (nouveau_fence.c:205)
    by 0x8E4AFF4: nv50_screen_destroy (nv50_screen.c:293)
    by 0x8DAACDE: dri_destroy_screen_helper (dri_screen.c:378)
    by 0x8DAAD74: dri_destroy_screen (dri_screen.c:388)
    by 0x8AB13D6: driDestroyScreen (dri_util.c:234)
    by 0x69A06C1: dri2DestroyScreen (dri2_glx.c:712)
    by 0x697CFE5: FreeScreenConfigs.isra.3 (glxext.c:208)
    by 0x697D064: glx_display_free (glxext.c:231)
    by 0x697D164: __glXCloseDisplay (glxext.c:272)
    by 0x50569F1: XCloseDisplay (in /usr/lib/libX11.so.6.3.0)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394050196.ceAbe72.17727
Date: Wed, 5 Mar 2014 20:09:56 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>Looks like a NouVeau is triggered by Mozilla Firefox trunk code.

I opened a bug on mozilla bugtracker,
<a href="https://bugzilla.mozilla.org/show_bug.cgi?id=978439">https://bugzilla.mozilla.org/show_bug.cgi?id=978439</a>

Even if I find a &quot;dirty workaround&quot;, valgrind logs are showing a NouVeau driver
bug.

I will attach both Mozilla Firefox valgrind log and glxtest one.

But there is a common part :

Invalid read of size 4
    at 0x8DBA0BE: nouveau_fence_wait (nouveau_fence.c:205)
    by 0x8E4AFF4: nv50_screen_destroy (nv50_screen.c:293)
    by 0x8DAACDE: dri_destroy_screen_helper (dri_screen.c:378)
    by 0x8DAAD74: dri_destroy_screen (dri_screen.c:388)
    by 0x8AB13D6: driDestroyScreen (dri_util.c:234)
    by 0x69A06C1: dri2DestroyScreen (dri2_glx.c:712)
    by 0x697CFE5: FreeScreenConfigs.isra.3 (glxext.c:208)
    by 0x697D064: glx_display_free (glxext.c:231)
    by 0x697D164: __glXCloseDisplay (glxext.c:272)
    by 0x50569F1: XCloseDisplay (in /usr/lib/libX11.so.6.3.0)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394050196.ceAbe72.17727--

--===============0901695213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0901695213==--
