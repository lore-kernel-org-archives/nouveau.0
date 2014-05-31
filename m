From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Sat, 31 May 2014 08:32:23 +0000
Message-ID: <bug-75761-8800-CbGxaVCLPW@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2074194472=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2074194472==
Content-Type: multipart/alternative; boundary="1401525143.166F4.23869"; charset="us-ascii"


--1401525143.166F4.23869
Date: Sat, 31 May 2014 08:32:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

--- Comment #29 from Pekka Paalanen <ppaalanen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hmm, a third remote possibility came to mind. If the timestamp delivered with
the DRM pageflip event does not advance, I suppose Weston's fade-in animation
might not advance either and therefore it never fades in. However this is hard
for me to believe, as I think it would have caused problems with Xorg, too...
wouldn't it?

Or maybe Xorg is only looking at the vblank counters, and you'd actually need a
program using GLX_OML_sync_control to even see the timestamps?

One could check the timestamps by:
weston_log("%s: time %u.%06u frame %u\n", __func__, sec, usec, frame);
in compositor-drm.c page_flip_handler() function.

Mm, I'd like to see a weston log with that when you have the black screen
problem.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1401525143.166F4.23869
Date: Sat, 31 May 2014 08:32:23 +0000
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
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c29">Comment # 29</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:ppaalanen&#64;gmail.com" title="Pekka Paalanen &lt;ppaalanen&#64;gmail.com&gt;"> <span class="fn">Pekka Paalanen</span></a>
</span></b>
        <pre>Hmm, a third remote possibility came to mind. If the timestamp delivered with
the DRM pageflip event does not advance, I suppose Weston's fade-in animation
might not advance either and therefore it never fades in. However this is hard
for me to believe, as I think it would have caused problems with Xorg, too...
wouldn't it?

Or maybe Xorg is only looking at the vblank counters, and you'd actually need a
program using GLX_OML_sync_control to even see the timestamps?

One could check the timestamps by:
weston_log(&quot;%s: time %u.%06u frame %u\n&quot;, __func__, sec, usec, frame);
in compositor-drm.c page_flip_handler() function.

Mm, I'd like to see a weston log with that when you have the black screen
problem.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1401525143.166F4.23869--

--===============2074194472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2074194472==--
