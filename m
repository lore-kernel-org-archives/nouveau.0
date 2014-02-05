From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] [NV44] dual-link tmds no longer allowed
Date: Wed, 05 Feb 2014 19:04:26 +0000
Message-ID: <bug-40747-8800-A0uQGiWYSj@http.bugs.freedesktop.org/>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0235658471=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0235658471==
Content-Type: multipart/alternative; boundary="1391627066.BbdD3D7b5.23889"; charset="us-ascii"


--1391627066.BbdD3D7b5.23889
Date: Wed, 5 Feb 2014 19:04:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #21 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #20)
> huh?
> i said that it is *easy* to convince the kernel to pick the right mode. it's
> picking a wrong one only automatically.

Really? It sounds to me like you managed to fool the drm mode-verification
logic (or nouveau's is implemented incorrectly). If it was merely picking the
wrong one, the 1600x1200 one would be in the mode list, and it is not.

> there is no hardware limitation at all here.

Maybe, maybe not. Should be fairly easy to check. One way to do that would be
to try the thing I said. Or to change the 165mhz check to be >= 0x44 instead of
0x46.

> X appears more tenacious, apparently because it filters out the good mode
> earlier in the process. it's beyond me why it does that - it makes no sense

It just gets the list from the kernel. What's in
/sys/class/drm/card0-DVI-I-1/modes (or whatever the connector is)? The thing
you (or someone else) saw with X seeing the 1600x1200 mode was it reading it
from DDC. But I'm pretty sure it doesn't care about that -- X doesn't handle
modesetting, the kernel does, and it uses its mode list.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391627066.BbdD3D7b5.23889
Date: Wed, 5 Feb 2014 19:04:26 +0000
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
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV44] dual-link tmds no longer allowed"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=40747">bug 40747</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=40747#c20">comment #20</a>)
<span class="quote">&gt; huh?
&gt; i said that it is *easy* to convince the kernel to pick the right mode. it's
&gt; picking a wrong one only automatically.</span >

Really? It sounds to me like you managed to fool the drm mode-verification
logic (or nouveau's is implemented incorrectly). If it was merely picking the
wrong one, the 1600x1200 one would be in the mode list, and it is not.

<span class="quote">&gt; there is no hardware limitation at all here.</span >

Maybe, maybe not. Should be fairly easy to check. One way to do that would be
to try the thing I said. Or to change the 165mhz check to be &gt;= 0x44 instead of
0x46.

<span class="quote">&gt; X appears more tenacious, apparently because it filters out the good mode
&gt; earlier in the process. it's beyond me why it does that - it makes no sense</span >

It just gets the list from the kernel. What's in
/sys/class/drm/card0-DVI-I-1/modes (or whatever the connector is)? The thing
you (or someone else) saw with X seeing the 1600x1200 mode was it reading it
from DDC. But I'm pretty sure it doesn't care about that -- X doesn't handle
modesetting, the kernel does, and it uses its mode list.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391627066.BbdD3D7b5.23889--

--===============0235658471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0235658471==--
