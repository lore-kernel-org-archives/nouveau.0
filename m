From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86164] Screen resize causes crash on NV50 (NV98) in
 nouveau (bisected)
Date: Wed, 12 Nov 2014 09:40:10 +0000
Message-ID: <bug-86164-8800-G74HbzAWGd@http.bugs.freedesktop.org/>
References: <bug-86164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289309216=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1289309216==
Content-Type: multipart/alternative; boundary="1415785210.CCDe1.25619"; charset="UTF-8"


--1415785210.CCDe1.25619
Date: Wed, 12 Nov 2014 09:40:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86164

Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Dual screen causes KDE      |Screen resize causes crash
                   |crash on NV50 (NV98) in     |on NV50 (NV98) in nouveau
                   |nouveau (bisected)          |(bisected)

--- Comment #2 from Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> While it shouldn't cause crashes, I suspect that removing
> 
> nouveau.noaccel=1
> 
> should resolve this issue. Why are you booting with that?

Sorry, my analysis was incomplete. Today I tested with bare bones X session
(xinit running xterm) without a secondary output - it still fails on screen
resize issued with "xrandr -s 1024x768". Attaching a secondary output was just
triggering screen size change.

If screen size change is triggered from xinit, it gets stuck with a black,
empty screen. Attempts to use get to VT (ctrl+alt+f1) are failing, I never have
been able to get killing X server option to work (whoever had that "bright"
idea to remove ctrl+alt+backspace option), and simple reboot (ctrl+alt+del)
doesn't work. Still system (sometimes) reacts on power button, although it
can't finish shutdown - there is a disk activity, but it fails to power off.

Changing nouveau.noaccel=0 with current git master makes this bug to disappear
- "xrandr -s" calls are not failing any more. Still some graphical corruption
is observable (invisible parts of web page in Firefox are randomly appearing
while typing in FF this report) - a different bug and I have no idea how to
reproduce it. The original reason for disabling acceleration was (IIRC)
inability to suspend system more than once and to play any video after first
resume. Don't remember exact bug #, but that's a different story, as "xrandr
-s" calls shouldn't crash X also without acceleration enabled.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415785210.CCDe1.25619
Date: Wed, 12 Nov 2014 09:40:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:maris.nartiss&#64;gmail.com" title="Maris Nartiss &lt;maris.nartiss&#64;gmail.com&gt;"> <span class="fn">Maris Nartiss</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Screen resize causes crash on NV50 (NV98) in nouveau (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86164">bug 86164</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Dual screen causes KDE crash on NV50 (NV98) in nouveau (bisected)
           </td>
           <td>Screen resize causes crash on NV50 (NV98) in nouveau (bisected)
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Screen resize causes crash on NV50 (NV98) in nouveau (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86164#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Screen resize causes crash on NV50 (NV98) in nouveau (bisected)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86164">bug 86164</a>
              from <span class="vcard"><a class="email" href="mailto:maris.nartiss&#64;gmail.com" title="Maris Nartiss &lt;maris.nartiss&#64;gmail.com&gt;"> <span class="fn">Maris Nartiss</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=86164#c1">comment #1</a>)
<span class="quote">&gt; While it shouldn't cause crashes, I suspect that removing
&gt; 
&gt; nouveau.noaccel=1
&gt; 
&gt; should resolve this issue. Why are you booting with that?</span >

Sorry, my analysis was incomplete. Today I tested with bare bones X session
(xinit running xterm) without a secondary output - it still fails on screen
resize issued with &quot;xrandr -s 1024x768&quot;. Attaching a secondary output was just
triggering screen size change.

If screen size change is triggered from xinit, it gets stuck with a black,
empty screen. Attempts to use get to VT (ctrl+alt+f1) are failing, I never have
been able to get killing X server option to work (whoever had that &quot;bright&quot;
idea to remove ctrl+alt+backspace option), and simple reboot (ctrl+alt+del)
doesn't work. Still system (sometimes) reacts on power button, although it
can't finish shutdown - there is a disk activity, but it fails to power off.

Changing nouveau.noaccel=0 with current git master makes this bug to disappear
- &quot;xrandr -s&quot; calls are not failing any more. Still some graphical corruption
is observable (invisible parts of web page in Firefox are randomly appearing
while typing in FF this report) - a different bug and I have no idea how to
reproduce it. The original reason for disabling acceleration was (IIRC)
inability to suspend system more than once and to play any video after first
resume. Don't remember exact bug #, but that's a different story, as &quot;xrandr
-s&quot; calls shouldn't crash X also without acceleration enabled.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415785210.CCDe1.25619--

--===============1289309216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1289309216==--
