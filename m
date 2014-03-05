From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Wed, 05 Mar 2014 20:46:25 +0000
Message-ID: <bug-75279-8800-ALvMUSShq6@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0086966110=="
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


--===============0086966110==
Content-Type: multipart/alternative; boundary="1394052385.eee6aB3.27858"; charset="us-ascii"


--1394052385.eee6aB3.27858
Date: Wed, 5 Mar 2014 20:46:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #35 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #33)
> The stack to the free() points to line 203 here, while the stack to where
> the free'd data is subsequently used points to line 205 here:
> 
> http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/
> nouveau_fence.c?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04#n203
> 
> 
>    if (fence == screen->fence.current)
>       nouveau_fence_next(screen);
> 
>    do {
>       nouveau_fence_update(screen, FALSE);  // <--- free here!
> 
>       if (fence->state == NOUVEAU_FENCE_STATE_SIGNALLED) // <--
> use-after-free
>          return TRUE;
> 
> 
> So it seems like nouveau_fence_update (which was apparently inlined)
> destroys the fence object... do you need to call nouveau_fence_ref() to keep
> it alive?

This code is rather confusing. You have to keep in mind how it's used, which
among other things is from the kick handler. I tried to fix it up with

http://cgit.freedesktop.org/mesa/mesa/commit/?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04

But I guess it was insufficient? I have an odd recollection that I felt like
the stuff in the context destroy was suspect, but I don't remember how. Since
it wasn't directly related to my problem, I left it alone (esp since I was
going under the assumption that it would only be triggered on exit, in which
case it's harder to care). Unfortunately it was a long enough time ago that
I've lost my context on this. I'm guessing that the key here is that there are
multiple contexts and one screen. (Someone should confirm that to be the case.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1394052385.eee6aB3.27858
Date: Wed, 5 Mar 2014 20:46:25 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75279#c33">comment #33</a>)
<span class="quote">&gt; The stack to the free() points to line 203 here, while the stack to where
&gt; the free'd data is subsequently used points to line 205 here:
&gt; 
&gt; <a href="http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/">http://cgit.freedesktop.org/mesa/mesa/tree/src/gallium/drivers/nouveau/</a>
&gt; nouveau_fence.c?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04#n203
&gt; 
&gt; 
&gt;    if (fence == screen-&gt;fence.current)
&gt;       nouveau_fence_next(screen);
&gt; 
&gt;    do {
&gt;       nouveau_fence_update(screen, FALSE);  // &lt;--- free here!
&gt; 
&gt;       if (fence-&gt;state == NOUVEAU_FENCE_STATE_SIGNALLED) // &lt;--
&gt; use-after-free
&gt;          return TRUE;
&gt; 
&gt; 
&gt; So it seems like nouveau_fence_update (which was apparently inlined)
&gt; destroys the fence object... do you need to call nouveau_fence_ref() to keep
&gt; it alive?</span >

This code is rather confusing. You have to keep in mind how it's used, which
among other things is from the kick handler. I tried to fix it up with

<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04">http://cgit.freedesktop.org/mesa/mesa/commit/?id=ce6dd69697ae62d9336bbd4f5808bc4d75cdcc04</a>

But I guess it was insufficient? I have an odd recollection that I felt like
the stuff in the context destroy was suspect, but I don't remember how. Since
it wasn't directly related to my problem, I left it alone (esp since I was
going under the assumption that it would only be triggered on exit, in which
case it's harder to care). Unfortunately it was a long enough time ago that
I've lost my context on this. I'm guessing that the key here is that there are
multiple contexts and one screen. (Someone should confirm that to be the case.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1394052385.eee6aB3.27858--

--===============0086966110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0086966110==--
