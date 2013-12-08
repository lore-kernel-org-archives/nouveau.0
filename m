From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Sun, 08 Dec 2013 20:15:13 +0000
Message-ID: <bug-67878-8800-Rp8tEJkptv@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0579793780=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0579793780==
Content-Type: multipart/alternative; boundary="1386533713.FBBa73.11755"; charset="us-ascii"


--1386533713.FBBa73.11755
Date: Sun, 8 Dec 2013 20:15:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #34 from Pontus Fuchs <pontus.fuchs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #32)
> One idea I just randomly had was that there might be a difference in the
> teardown process. For example, in the removed code, nv50_display_fini did
> stuff. In the current code, it's basically empty (well, some small bits in
> nouveau_display_fini).
> 
> It looks like the old code
> 
> (a) blanked each crtc
> (b) sent out a EVO_UPDATE command
> (c) waited for each crtc to hit a vblank
> (d) did something with the cursor (cleared it?)
> (e) waited for some sort of DPMS thing
> 
> It could well be that this now happens elsewhere, but I just wanted to put
> that thought down on "paper".

I tried this idea by doing the following:

1) Checked out 4f6029da58ba9204c98e33f4f3737fe085c87a6f^1 (=
f9887d091149406de5c8b388f7e0bb6932dd621b)
2) Deleted everything in nv50_display_fini

With that change suspend/resume works so I guess the problem is elsewhere.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1386533713.FBBa73.11755
Date: Sun, 8 Dec 2013 20:15:13 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:pontus.fuchs&#64;gmail.com" title="Pontus Fuchs &lt;pontus.fuchs&#64;gmail.com&gt;"> <span class="fn">Pontus Fuchs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67878#c32">comment #32</a>)
<span class="quote">&gt; One idea I just randomly had was that there might be a difference in the
&gt; teardown process. For example, in the removed code, nv50_display_fini did
&gt; stuff. In the current code, it's basically empty (well, some small bits in
&gt; nouveau_display_fini).
&gt; 
&gt; It looks like the old code
&gt; 
&gt; (a) blanked each crtc
&gt; (b) sent out a EVO_UPDATE command
&gt; (c) waited for each crtc to hit a vblank
&gt; (d) did something with the cursor (cleared it?)
&gt; (e) waited for some sort of DPMS thing
&gt; 
&gt; It could well be that this now happens elsewhere, but I just wanted to put
&gt; that thought down on &quot;paper&quot;.</span >

I tried this idea by doing the following:

1) Checked out 4f6029da58ba9204c98e33f4f3737fe085c87a6f^1 (=
f9887d091149406de5c8b388f7e0bb6932dd621b)
2) Deleted everything in nv50_display_fini

With that change suspend/resume works so I guess the problem is elsewhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1386533713.FBBa73.11755--

--===============0579793780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0579793780==--
