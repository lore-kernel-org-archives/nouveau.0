From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70510] Xorg crash on KDE init
Date: Wed, 16 Oct 2013 00:17:50 +0000
Message-ID: <bug-70510-8800-ZAEyCtSguw@http.bugs.freedesktop.org/>
References: <bug-70510-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1352676237=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70510-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1352676237==
Content-Type: multipart/alternative; boundary="1381882670.5E0CFf2.3776"; charset="us-ascii"


--1381882670.5E0CFf2.3776
Date: Wed, 16 Oct 2013 00:17:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70510

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Elmar

Please try to provide more comprehensive picture of the issue rather than just
"crashes regularely"
* output of dmesg as the issue happens. if X crashes you should be able to get
back to VT and retrieve it :) Possibly even over ssh (if you prefer using gui)
* is this a regression ?
* "crashes regularely" is quite vague. Some steps to reproduce/trigger would be
great
* to eliminate 3d/opengl interaction {re,}move the nouveau_vieux_dri.so


It would be great if you can spend a couple of minutes going through the
bugs[1], faq[2] and trouble shooting[3] sections in the wiki

Cheers

[1] http://nouveau.freedesktop.org/wiki/Bugs/
[2] http://nouveau.freedesktop.org/wiki/FAQ/
[3] http://nouveau.freedesktop.org/wiki/TroubleShooting/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381882670.5E0CFf2.3776
Date: Wed, 16 Oct 2013 00:17:50 +0000
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
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Xorg crash on KDE init"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70510">bug 70510</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Elmar

Please try to provide more comprehensive picture of the issue rather than just
&quot;crashes regularely&quot;
* output of dmesg as the issue happens. if X crashes you should be able to get
back to VT and retrieve it :) Possibly even over ssh (if you prefer using gui)
* is this a regression ?
* &quot;crashes regularely&quot; is quite vague. Some steps to reproduce/trigger would be
great
* to eliminate 3d/opengl interaction {re,}move the nouveau_vieux_dri.so


It would be great if you can spend a couple of minutes going through the
bugs[1], faq[2] and trouble shooting[3] sections in the wiki

Cheers

[1] <a href="http://nouveau.freedesktop.org/wiki/Bugs/">http://nouveau.freedesktop.org/wiki/Bugs/</a>
[2] <a href="http://nouveau.freedesktop.org/wiki/FAQ/">http://nouveau.freedesktop.org/wiki/FAQ/</a>
[3] <a href="http://nouveau.freedesktop.org/wiki/TroubleShooting/">http://nouveau.freedesktop.org/wiki/TroubleShooting/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381882670.5E0CFf2.3776--

--===============1352676237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1352676237==--
