From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [Ubuntu userspace upgrade 13.04 ->
 13.10][regression] NV34 card fails to properly resume.
Date: Sun, 03 Nov 2013 11:49:15 +0000
Message-ID: <bug-71116-8800-eN7NauCGqZ@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0474653208=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0474653208==
Content-Type: multipart/alternative; boundary="1383479355.Ea2BFB482.10720"; charset="us-ascii"


--1383479355.Ea2BFB482.10720
Date: Sun, 3 Nov 2013 11:49:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #6)
> Created attachment 88546 [details]
> 2_Attempt to resume (nouveau.agpmode=0)
> 
> Survives one cycle since I did this from SSH with `pm-hibernate`. Apparently
> Xorg only locksup on resume because of xscreensaver if I press the button in
> XFCE.
I had a strange feeling that mesa is involved :\

If you're up for it you can {re,}move nouveau_dri.so (the 3g/gl "driver") and
confirm it that fixes your s2ram problems.
Note your CPU usage may sky-rocket (the system will fall back to software GL
rendering).

(In reply to comment #9)
[...]
> I'm not totally against bisecting these source packages, but that will then
> be a longterm thing. Furthermore, is all of mesa required? (i.e. I'm not
> using a compositing desktop for that matter (just XFCE)).
> 
Before bisecting anything I would suggest that you absolutely make sure that
you know which package broke things - mesa, xserver-xorg-core,
xserver-xorg-video-nouveau and/or other.

When going through mesa, make sure that you keep all the packages at the same
version.

Here is a crash course of what the different mesa packages provide
Essential parts
* libgl1-mesa-glx -> libGL provider
* libgl1-mesa-dri -> provides the "hardware accelerated drivers"
* libglapi-mesa -> dispatch library

Extra (your system may require one or both depending on what software you have)
* libgbm1
* libegl1-mesa -> libEGL provider

Other
* libopenvg1-mesa -> libOpenVG, afaik noone uses this
* mesa-common-dev -> headers

Not part of mesa (but have mesa in the package name :P)
* libglu1-mesa -> minor suspect
* mesa-utils -> highly unlikely to be related

Have fun :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383479355.Ea2BFB482.10720
Date: Sun, 3 Nov 2013 11:49:15 +0000
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
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71116#c6">comment #6</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=88546" name="attach_88546" title="2_Attempt to resume (nouveau.agpmode=0)">attachment 88546</a> <a href="attachment.cgi?id=88546&amp;action=edit" title="2_Attempt to resume (nouveau.agpmode=0)">[details]</a></span>
&gt; 2_Attempt to resume (nouveau.agpmode=0)
&gt; 
&gt; Survives one cycle since I did this from SSH with `pm-hibernate`. Apparently
&gt; Xorg only locksup on resume because of xscreensaver if I press the button in
&gt; XFCE.</span >
I had a strange feeling that mesa is involved :\

If you're up for it you can {re,}move nouveau_dri.so (the 3g/gl &quot;driver&quot;) and
confirm it that fixes your s2ram problems.
Note your CPU usage may sky-rocket (the system will fall back to software GL
rendering).

(In reply to <a href="show_bug.cgi?id=71116#c9">comment #9</a>)
[...]
<span class="quote">&gt; I'm not totally against bisecting these source packages, but that will then
&gt; be a longterm thing. Furthermore, is all of mesa required? (i.e. I'm not
&gt; using a compositing desktop for that matter (just XFCE)).
&gt; </span >
Before bisecting anything I would suggest that you absolutely make sure that
you know which package broke things - mesa, xserver-xorg-core,
xserver-xorg-video-nouveau and/or other.

When going through mesa, make sure that you keep all the packages at the same
version.

Here is a crash course of what the different mesa packages provide
Essential parts
* libgl1-mesa-glx -&gt; libGL provider
* libgl1-mesa-dri -&gt; provides the &quot;hardware accelerated drivers&quot;
* libglapi-mesa -&gt; dispatch library

Extra (your system may require one or both depending on what software you have)
* libgbm1
* libegl1-mesa -&gt; libEGL provider

Other
* libopenvg1-mesa -&gt; libOpenVG, afaik noone uses this
* mesa-common-dev -&gt; headers

Not part of mesa (but have mesa in the package name :P)
* libglu1-mesa -&gt; minor suspect
* mesa-utils -&gt; highly unlikely to be related

Have fun :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383479355.Ea2BFB482.10720--

--===============0474653208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0474653208==--
