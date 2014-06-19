From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Thu, 19 Jun 2014 08:18:30 +0000
Message-ID: <bug-79823-8800-TMD0z5dvdX@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0139123827=="
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


--===============0139123827==
Content-Type: multipart/alternative; boundary="1403165910.b7E8eF41.10242"; charset="us-ascii"


--1403165910.b7E8eF41.10242
Date: Thu, 19 Jun 2014 08:18:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #27 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #26)
> Created attachment 101338 [details]
> GDB log with "avoid dangling..." patch
> 
> /dev/dri/card0 on fd #4 closed,
> /dev/dri/card0 on fd #5 remained open.

So... for some *unknown* reason, the thing decides to create two screens. Fine.
Now we have this thing which reuses screens for the same device... makes sense.
But after it tries to close one of the screens, it also closes the fd that it
used to create the screen with. Reasonable enough. However that fd is the one
that's being used by the device.

Perhaps it should be dup'ing the fd and doing all the ioctl's on that, so that
this sort of thing doesn't happen. Maarten, thoughts?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403165910.b7E8eF41.10242
Date: Thu, 19 Jun 2014 08:18:30 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c27">Comment # 27</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79823#c26">comment #26</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=101338" name="attach_101338" title="GDB log with &quot;avoid dangling...&quot; patch">attachment 101338</a> <a href="attachment.cgi?id=101338&amp;action=edit" title="GDB log with &quot;avoid dangling...&quot; patch">[details]</a></span>
&gt; GDB log with &quot;avoid dangling...&quot; patch
&gt; 
&gt; /dev/dri/card0 on fd #4 closed,
&gt; /dev/dri/card0 on fd #5 remained open.</span >

So... for some *unknown* reason, the thing decides to create two screens. Fine.
Now we have this thing which reuses screens for the same device... makes sense.
But after it tries to close one of the screens, it also closes the fd that it
used to create the screen with. Reasonable enough. However that fd is the one
that's being used by the device.

Perhaps it should be dup'ing the fd and doing all the ioctl's on that, so that
this sort of thing doesn't happen. Maarten, thoughts?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403165910.b7E8eF41.10242--

--===============0139123827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0139123827==--
