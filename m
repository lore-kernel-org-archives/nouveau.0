From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Tue, 17 Jun 2014 08:52:50 +0000
Message-ID: <bug-79823-8800-FW8Q1LucRU@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1186720626=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1186720626==
Content-Type: multipart/alternative; boundary="1402995170.110Ef80.23742"; charset="us-ascii"


--1402995170.110Ef80.23742
Date: Tue, 17 Jun 2014 08:52:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #19 from Natrio <natrio-cmBhpYW9OiY@public.gmane.org> ---
(In reply to comment #18)
> What happens if you add
> 
> screen->base.pushbuf->user_priv = NULL
> 
> right before the if (screen->base.fence.current) check in
> nv30_screen_destroy?

No effect.

After llvm,llvm-libs update 3.4.1 -> 3.4.2 also glxgears starting to freeze
instead of normal exit by ESC:

Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
2469 frames in 5.0 seconds = 493.688 FPS
2476 frames in 5.0 seconds = 495.177 FPS
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch0: psh 00000000 0000025e84 0000025e98
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00001437
nouveau:        0x00020000
nouveau:        0x00000000
 (freeze)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402995170.110Ef80.23742
Date: Tue, 17 Jun 2014 08:52:50 +0000
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
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c19">Comment # 19</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:natrio&#64;list.ru" title="Natrio &lt;natrio&#64;list.ru&gt;"> <span class="fn">Natrio</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79823#c18">comment #18</a>)
<span class="quote">&gt; What happens if you add
&gt; 
&gt; screen-&gt;base.pushbuf-&gt;user_priv = NULL
&gt; 
&gt; right before the if (screen-&gt;base.fence.current) check in
&gt; nv30_screen_destroy?</span >

No effect.

After llvm,llvm-libs update 3.4.1 -&gt; 3.4.2 also glxgears starting to freeze
instead of normal exit by ESC:

Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
2469 frames in 5.0 seconds = 493.688 FPS
2476 frames in 5.0 seconds = 495.177 FPS
nouveau: kernel rejected pushbuf: Bad file descriptor
nouveau: ch0: krec 0 pushes 1 bufs 1 relocs 0
nouveau: ch0: buf 00000000 00000004 00000004 00000004 00000000
nouveau: ch0: psh 00000000 0000025e84 0000025e98
nouveau:        0x0008fd6c
nouveau:        0x00000000
nouveau:        0x00001437
nouveau:        0x00020000
nouveau:        0x00000000
 (freeze)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402995170.110Ef80.23742--

--===============1186720626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1186720626==--
