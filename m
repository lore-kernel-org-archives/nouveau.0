From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Wed, 05 Mar 2014 20:12:52 +0000
Message-ID: <bug-75279-8800-SDCf5ihXaD@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0245204322=="
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


--===============0245204322==
Content-Type: multipart/alternative; boundary="1394050372.DC2cF52.18473"; charset="us-ascii"


--1394050372.DC2cF52.18473
Date: Wed, 5 Mar 2014 20:12:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #31 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 95189
  --> https://bugs.freedesktop.org/attachment.cgi?id=95189&action=edit
Valgrind log with debug symbols for Mozilla Firefox trunk code.

And log for mozilla Firefox trunk code.

Always the same beginning :

Invalid read of size 4
   at 0x161590BE: nouveau_fence_wait (nouveau_fence.c:205)
    by 0x161E9FF4: nv50_screen_destroy (nv50_screen.c:293)
    by 0x16149CDE: dri_destroy_screen_helper (dri_screen.c:378)
    by 0x16149D74: dri_destroy_screen (dri_screen.c:388)
    by 0x15E503D6: driDestroyScreen (dri_util.c:234)
    by 0x1256D6C1: dri2DestroyScreen (dri2_glx.c:712)
    by 0x12549FE5: FreeScreenConfigs.isra.3 (glxext.c:208)
    by 0x1254A064: glx_display_free (glxext.c:231)
    by 0x1254A164: __glXCloseDisplay (glxext.c:272)
    by 0xEF009F1: XCloseDisplay (in /usr/lib/libX11.so.6.3.0)

Any idea ?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394050372.DC2cF52.18473
Date: Wed, 5 Mar 2014 20:12:52 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=95189" name="attach_95189" title="Valgrind log with debug symbols for Mozilla Firefox trunk code.">attachment 95189</a> <a href="attachment.cgi?id=95189&amp;action=edit" title="Valgrind log with debug symbols for Mozilla Firefox trunk code.">[details]</a></span>
Valgrind log with debug symbols for Mozilla Firefox trunk code.

And log for mozilla Firefox trunk code.

Always the same beginning :

Invalid read of size 4
   at 0x161590BE: nouveau_fence_wait (nouveau_fence.c:205)
    by 0x161E9FF4: nv50_screen_destroy (nv50_screen.c:293)
    by 0x16149CDE: dri_destroy_screen_helper (dri_screen.c:378)
    by 0x16149D74: dri_destroy_screen (dri_screen.c:388)
    by 0x15E503D6: driDestroyScreen (dri_util.c:234)
    by 0x1256D6C1: dri2DestroyScreen (dri2_glx.c:712)
    by 0x12549FE5: FreeScreenConfigs.isra.3 (glxext.c:208)
    by 0x1254A064: glx_display_free (glxext.c:231)
    by 0x1254A164: __glXCloseDisplay (glxext.c:272)
    by 0xEF009F1: XCloseDisplay (in /usr/lib/libX11.so.6.3.0)

Any idea ?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394050372.DC2cF52.18473--

--===============0245204322==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0245204322==--
