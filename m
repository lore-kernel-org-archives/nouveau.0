From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85471] [NV86] nouveau/kernel 3.18.0-rc1: nouveau
 deadlocks on 2nd Xorg start or reboot
Date: Sun, 26 Oct 2014 18:42:03 +0000
Message-ID: <bug-85471-8800-UxVCs9iR91@http.bugs.freedesktop.org/>
References: <bug-85471-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0511121711=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-85471-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0511121711==
Content-Type: multipart/alternative; boundary="1414348922.1d8CB1.29342"; charset="UTF-8"


--1414348922.1d8CB1.29342
Date: Sun, 26 Oct 2014 18:42:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85471

--- Comment #6 from Christian Vogel <vogelchr-InfKab39H3A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #5)
> nouveau.runpm=0

This fixes the issue with the hung X-Server, I can terminate and re-start
X-servers as expected when logged in via ssh.

But parts of the bug remain, namely that the X-console will freeze as soon as
the VT on which the X-server was active is selected:

 - system boots, X-server works, I can login, use applications

 - stop lightdm -> X-server turns off, screen goes black, keyboard does not
work

 - via ssh: start lightdm -> X-server restarts, everything looks ok again

A funny variation of that theme:

 - system works, running X

 - switch to VT2 (Ctrl-Alt-F2), I get the linux vt #2, everything ok

 - on the console (or via ssh): stop lightdm
     -> nothing visible changes, X terminates in the background

 - switch to VT3 (Ctrl-Alt-F3), I get the linux vt #3, all ok

 - switch to VT1 (Ctrl-Alt-F1) where the X-server was active before:
     -> cursor stops blinking, keyboard no longer responsive, screen
        content frozen

 - via ssh: start lightdm
     -> X server starts up, I can login into X and use applications,
        keyboard works (actually, that's how I write this text now...)

 - switch to VT2, VT3, ... works now.


---> Why does the framebuffer-console hang when I change into the
     VT previously occupied by nouveau/xorg?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414348922.1d8CB1.29342
Date: Sun, 26 Oct 2014 18:42:02 +0000
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
   title="NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] nouveau/kernel 3.18.0-rc1: nouveau deadlocks on 2nd Xorg start or reboot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85471">bug 85471</a>
              from <span class="vcard"><a class="email" href="mailto:vogelchr&#64;vogel.cx" title="Christian Vogel &lt;vogelchr&#64;vogel.cx&gt;"> <span class="fn">Christian Vogel</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=85471#c5">comment #5</a>)
<span class="quote">&gt; nouveau.runpm=0</span >

This fixes the issue with the hung X-Server, I can terminate and re-start
X-servers as expected when logged in via ssh.

But parts of the bug remain, namely that the X-console will freeze as soon as
the VT on which the X-server was active is selected:

 - system boots, X-server works, I can login, use applications

 - stop lightdm -&gt; X-server turns off, screen goes black, keyboard does not
work

 - via ssh: start lightdm -&gt; X-server restarts, everything looks ok again

A funny variation of that theme:

 - system works, running X

 - switch to VT2 (Ctrl-Alt-F2), I get the linux vt #2, everything ok

 - on the console (or via ssh): stop lightdm
     -&gt; nothing visible changes, X terminates in the background

 - switch to VT3 (Ctrl-Alt-F3), I get the linux vt #3, all ok

 - switch to VT1 (Ctrl-Alt-F1) where the X-server was active before:
     -&gt; cursor stops blinking, keyboard no longer responsive, screen
        content frozen

 - via ssh: start lightdm
     -&gt; X server starts up, I can login into X and use applications,
        keyboard works (actually, that's how I write this text now...)

 - switch to VT2, VT3, ... works now.


---&gt; Why does the framebuffer-console hang when I change into the
     VT previously occupied by nouveau/xorg?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414348922.1d8CB1.29342--

--===============0511121711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0511121711==--
