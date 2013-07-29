From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Mon, 29 Jul 2013 21:28:57 +0000
Message-ID: <bug-67315-8800-GudQb3soq1@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1974081853=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1974081853==
Content-Type: multipart/alternative; boundary="1375133337.C78e82.18760"; charset="us-ascii"


--1375133337.C78e82.18760
Date: Mon, 29 Jul 2013 21:28:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #13 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #11)
> In answer to your first question (I think), yes, those captures were from
> the same boot/crash cycle, acquired as I mentioned in my comments.
> 
Obviously I did not express myself clear enough :)

The Xorg.0.log attached is _not_ from when the crash/lockup occurred. It is
from the second X session (the one that was started by your system after X died
the first time). I was seeking confirmation of the above with my first question
:P

Does your system has plymouth or similar splash manager ? Please disable it,
try to reproduce the issue and attach dmesg _before_ trying the
patch/recompiling the kernel

[...]
> adjust the screen saver parameters via XFCE's "Applications
> Menu->Settings->Screensaver" menu, as soon as the frame containing the the
> applications window is rendered the display, keyboard and mouse lock up.
> 
Please do not assume that I'm running XFCE and/or know what exactly it does
behind the scenes. The name and/or package of the screensaver would be great :)

[...]
> dmesg is wiped each time I boot the machine. I guess I could try to set up
> something that would log it to a disk file instead of just in the ring
> buffer.
No need for such an overkill

All I was asking - "Is this a kernel regression ?", or in other words
"before you installed Fedora 19 with kernel 3.9.9, you had XXX, running kernel
XXX. Do you recall any messages similar to 'nouveau E' in dmesg?"

Quick $grep "nouveau E" -r /var/logs/ may help depending on your setup

Cheers
Emil

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375133337.C78e82.18760
Date: Mon, 29 Jul 2013 21:28:57 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67315#c11">comment #11</a>)
<span class="quote">&gt; In answer to your first question (I think), yes, those captures were from
&gt; the same boot/crash cycle, acquired as I mentioned in my comments.
&gt; </span >
Obviously I did not express myself clear enough :)

The Xorg.0.log attached is _not_ from when the crash/lockup occurred. It is
from the second X session (the one that was started by your system after X died
the first time). I was seeking confirmation of the above with my first question
:P

Does your system has plymouth or similar splash manager ? Please disable it,
try to reproduce the issue and attach dmesg _before_ trying the
patch/recompiling the kernel

[...]
<span class="quote">&gt; adjust the screen saver parameters via XFCE's &quot;Applications
&gt; Menu-&gt;Settings-&gt;Screensaver&quot; menu, as soon as the frame containing the the
&gt; applications window is rendered the display, keyboard and mouse lock up.
&gt; </span >
Please do not assume that I'm running XFCE and/or know what exactly it does
behind the scenes. The name and/or package of the screensaver would be great :)

[...]
<span class="quote">&gt; dmesg is wiped each time I boot the machine. I guess I could try to set up
&gt; something that would log it to a disk file instead of just in the ring
&gt; buffer.</span >
No need for such an overkill

All I was asking - &quot;Is this a kernel regression ?&quot;, or in other words
&quot;before you installed Fedora 19 with kernel 3.9.9, you had XXX, running kernel
XXX. Do you recall any messages similar to 'nouveau E' in dmesg?&quot;

Quick $grep &quot;nouveau E&quot; -r /var/logs/ may help depending on your setup

Cheers
Emil</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375133337.C78e82.18760--

--===============1974081853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1974081853==--
