From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 48464] Crash when GLXVBlank set to true
Date: Fri, 02 Nov 2012 10:41:22 +0000
Message-ID: <bug-48464-8800-V708o9pHyA@http.bugs.freedesktop.org/>
References: <bug-48464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0875282702=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-48464-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0875282702==
Content-Type: multipart/alternative; boundary="1351852882.dC3c02.2927"; charset="us-ascii"


--1351852882.dC3c02.2927
Date: Fri, 2 Nov 2012 10:41:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=48464

--- Comment #6 from Kelly Doran <kel.p.doran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am using the latest nouveau git kernel sources on top of 3.7.0-rc3,
xf86-video-nouveau 1.0.3, mesa 9.0, and xorg-server 1.13.0, and still receive
this error on a gtx580 when GLXVBlank is enabled.

The screen freezes up seemingly when any opengl stuff gets rendered, even
running glxinfo can freeze it up, but just starting a basic twm session or i3wm
will not freeze it.  It runs fine when vblank is disabled with opengl...  I
tried using proprietary firmware as suggested in IRC but that did not help.

The screen just freezes, the mouse starts slowing down and then freezes, and
then it can be moved again but X is completely frozen.  I can switch to a
different tty but it only appears in a small box in the upper left hand corner
and the rest of the screen is what it was when X froze.  The tty is all
corrupted too... but you can see text changes when you type, and I can copy
logs and reboot so its sort of working...

Is there anything else I can do to try to help track this bug down?  I will
attach logs but they don't seem to indicate any errors other than the gpu
locking up.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1351852882.dC3c02.2927
Date: Fri, 2 Nov 2012 10:41:22 +0000
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
   title="NEW --- - Crash when GLXVBlank set to true"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48464#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Crash when GLXVBlank set to true"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=48464">bug 48464</a>
              from <span class="vcard"><a class="email" href="mailto:kel.p.doran&#64;gmail.com" title="Kelly Doran &lt;kel.p.doran&#64;gmail.com&gt;"> <span class="fn">Kelly Doran</span></a>
</span></b>
        <pre>I am using the latest nouveau git kernel sources on top of 3.7.0-rc3,
xf86-video-nouveau 1.0.3, mesa 9.0, and xorg-server 1.13.0, and still receive
this error on a gtx580 when GLXVBlank is enabled.

The screen freezes up seemingly when any opengl stuff gets rendered, even
running glxinfo can freeze it up, but just starting a basic twm session or i3wm
will not freeze it.  It runs fine when vblank is disabled with opengl...  I
tried using proprietary firmware as suggested in IRC but that did not help.

The screen just freezes, the mouse starts slowing down and then freezes, and
then it can be moved again but X is completely frozen.  I can switch to a
different tty but it only appears in a small box in the upper left hand corner
and the rest of the screen is what it was when X froze.  The tty is all
corrupted too... but you can see text changes when you type, and I can copy
logs and reboot so its sort of working...

Is there anything else I can do to try to help track this bug down?  I will
attach logs but they don't seem to indicate any errors other than the gpu
locking up.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1351852882.dC3c02.2927--

--===============0875282702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0875282702==--
