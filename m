From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68835] [NV04] Script offset calculated incorrectly
 for some BMP 1.x VBIOSes
Date: Sun, 26 Jan 2014 23:11:50 +0000
Message-ID: <bug-68835-8800-ChtgJxi5O7@http.bugs.freedesktop.org/>
References: <bug-68835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1207279527=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1207279527==
Content-Type: multipart/alternative; boundary="1390777910.c2337D1.21550"; charset="us-ascii"


--1390777910.c2337D1.21550
Date: Sun, 26 Jan 2014 23:11:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68835

--- Comment #12 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
(In reply to comment #11)
> The fix should be in 3.13.0 and later. I'm going to mark this bug as fixed,
> but do test it out when you get a chance and let us know whether it fixes
> your issue (and/or breaks anything, like suspend, since vbios scripts are
> found now).

Hi Ilia,
just to let you know that I got to install Fedora 19 on a new hard disk and
that I'm following the procedure you pointed me to build a patched custom 3.12
kernel with your patch applied. It's currently compiling (it takes a lot of
time on this old Pentium 3...). When I've completed my testings, I'll let you
know.

On the other hand, I have another small glitch: the maximum resolution proposed
by the monitor configuration utility of Fedora is 1024x768@60Hz, while my
monitor preferred resolution is 1280x1024 and it can support up to 75Hz
resolution. I see that the xrandr output is not consistent with what I get
using monitor-get-edid+monitor-parse-edid, which returns the correct data. Is
this something related to the nouveau driver?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390777910.c2337D1.21550
Date: Sun, 26 Jan 2014 23:11:50 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV04] Script offset calculated incorrectly for some BMP 1.x VBIOSes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68835">bug 68835</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=68835#c11">comment #11</a>)
<span class="quote">&gt; The fix should be in 3.13.0 and later. I'm going to mark this bug as fixed,
&gt; but do test it out when you get a chance and let us know whether it fixes
&gt; your issue (and/or breaks anything, like suspend, since vbios scripts are
&gt; found now).</span >

Hi Ilia,
just to let you know that I got to install Fedora 19 on a new hard disk and
that I'm following the procedure you pointed me to build a patched custom 3.12
kernel with your patch applied. It's currently compiling (it takes a lot of
time on this old Pentium 3...). When I've completed my testings, I'll let you
know.

On the other hand, I have another small glitch: the maximum resolution proposed
by the monitor configuration utility of Fedora is 1024x768&#64;60Hz, while my
monitor preferred resolution is 1280x1024 and it can support up to 75Hz
resolution. I see that the xrandr output is not consistent with what I get
using monitor-get-edid+monitor-parse-edid, which returns the correct data. Is
this something related to the nouveau driver?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390777910.c2337D1.21550--

--===============1207279527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1207279527==--
