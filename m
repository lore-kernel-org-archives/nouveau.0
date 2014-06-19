From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Thu, 19 Jun 2014 17:47:19 +0000
Message-ID: <bug-79823-8800-N0rSNkMLfS@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1021663198=="
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


--===============1021663198==
Content-Type: multipart/alternative; boundary="1403200039.3aE2E5A1.6820"; charset="us-ascii"


--1403200039.3aE2E5A1.6820
Date: Thu, 19 Jun 2014 17:47:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #33 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #31)
> Created attachment 101350 [details]
> GDB log with "dup fd..." patch
> 
> It works!

Great! Also I just figured out why this is happening to you and not to anyone
else. It's the dual screens! (Who uses separate screens anyways...)

src/glx/glxext.c allocates a screen per... screen. And then when it cleans up,
it deletes the screens in the same order it created them. So it's precisely the
scenario I outlined, where by the time the second screen goes to be destroyed,
the fd it relies on (which is the first one) has already been closed.

I'll push this patch out and tag it for 10.2.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403200039.3aE2E5A1.6820
Date: Thu, 19 Jun 2014 17:47:19 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=79823#c31">comment #31</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=101350" name="attach_101350" title="GDB log with &quot;dup fd...&quot; patch">attachment 101350</a> <a href="attachment.cgi?id=101350&amp;action=edit" title="GDB log with &quot;dup fd...&quot; patch">[details]</a></span>
&gt; GDB log with &quot;dup fd...&quot; patch
&gt; 
&gt; It works!</span >

Great! Also I just figured out why this is happening to you and not to anyone
else. It's the dual screens! (Who uses separate screens anyways...)

src/glx/glxext.c allocates a screen per... screen. And then when it cleans up,
it deletes the screens in the same order it created them. So it's precisely the
scenario I outlined, where by the time the second screen goes to be destroyed,
the fd it relies on (which is the first one) has already been closed.

I'll push this patch out and tag it for 10.2.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403200039.3aE2E5A1.6820--

--===============1021663198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1021663198==--
