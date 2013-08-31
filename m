From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37768] [NVA8] UT2003: Splash-screen is transparent
 with gnome-shell enabled
Date: Sat, 31 Aug 2013 16:09:34 +0000
Message-ID: <bug-37768-8800-eqt51wIoAb@http.bugs.freedesktop.org/>
References: <bug-37768-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1958429989=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37768-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1958429989==
Content-Type: multipart/alternative; boundary="1377965373.Ffb2f120.4747"; charset="us-ascii"


--1377965373.Ffb2f120.4747
Date: Sat, 31 Aug 2013 16:09:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=37768

--- Comment #3 from Roy <r.spliet-oe7qfRrRQfeEZXFvZSAUrfP6llvjuJOh@public.gmane.org> ---
(In reply to comment #2)
> Could you retest this with a more recent mesa (e.g. 9.1.6 or 9.2-git)? [And
> the other stuff could stand an upgrade as well...]
Retested this issue with 
mesa-libGL-9.2-0.14.20130723.fc19.[i686|x86_64]
kernel-3.11.0-1.nouveau_git.fc19.x86_64 (rc3 I think)
xorg-x11-server-Xorg-1.14.2-9.fc19.x86_64
xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64

> In case that the problem persists, try to capture an apitrace, and see if
> the problem still happens when you replay that apitrace
> (https://github.com/apitrace/apitrace, although there are probably also
> distro packages for it). If the problem happens with the apitrace,
> compress/upload it to this bug.

I tried obtaining an APItrace from ut2003, but likely this fails because it
uses its own GL wrapper library. As a result, ut2003 segfaults.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377965373.Ffb2f120.4747
Date: Sat, 31 Aug 2013 16:09:33 +0000
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
   title="NEW --- - [NVA8] UT2003: Splash-screen is transparent with gnome-shell enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37768#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] UT2003: Splash-screen is transparent with gnome-shell enabled"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=37768">bug 37768</a>
              from <span class="vcard"><a class="email" href="mailto:r.spliet&#64;student.tudelft.nl" title="Roy &lt;r.spliet&#64;student.tudelft.nl&gt;"> <span class="fn">Roy</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=37768#c2">comment #2</a>)
<span class="quote">&gt; Could you retest this with a more recent mesa (e.g. 9.1.6 or 9.2-git)? [And
&gt; the other stuff could stand an upgrade as well...]</span >
Retested this issue with 
mesa-libGL-9.2-0.14.20130723.fc19.[i686|x86_64]
kernel-3.11.0-1.nouveau_git.fc19.x86_64 (rc3 I think)
xorg-x11-server-Xorg-1.14.2-9.fc19.x86_64
xorg-x11-drv-nouveau-1.0.9-1.fc19.x86_64

<span class="quote">&gt; In case that the problem persists, try to capture an apitrace, and see if
&gt; the problem still happens when you replay that apitrace
&gt; (<a href="https://github.com/apitrace/apitrace">https://github.com/apitrace/apitrace</a>, although there are probably also
&gt; distro packages for it). If the problem happens with the apitrace,
&gt; compress/upload it to this bug.</span >

I tried obtaining an APItrace from ut2003, but likely this fails because it
uses its own GL wrapper library. As a result, ut2003 segfaults.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377965373.Ffb2f120.4747--

--===============1958429989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1958429989==--
