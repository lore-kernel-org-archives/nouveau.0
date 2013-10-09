From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69168] [NVA8]Arbitrary crashes
Date: Wed, 09 Oct 2013 08:30:52 +0000
Message-ID: <bug-69168-8800-86pbKxohzQ@http.bugs.freedesktop.org/>
References: <bug-69168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1525569734=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1525569734==
Content-Type: multipart/alternative; boundary="1381307452.7eE0bD2.15500"; charset="us-ascii"


--1381307452.7eE0bD2.15500
Date: Wed, 9 Oct 2013 08:30:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69168

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
The xorg log that you attached seems fine. That was produced after the hang? If
so, it must be the compositor hanging. Try disabling the compositor.

As for your gnome-related question, I don't know -- I stay away from
gnome-shell & co; however it's very unlikely that it'd be possible to restore a
session after X exits, due to the way that the X protocol works. However if X
stays alive, no reason (in theory) that you can't restart your WM. (In fact,
most WMs support this explicitly.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381307452.7eE0bD2.15500
Date: Wed, 9 Oct 2013 08:30:52 +0000
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
   title="NEW --- - [NVA8]Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8]Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168">bug 69168</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>The xorg log that you attached seems fine. That was produced after the hang? If
so, it must be the compositor hanging. Try disabling the compositor.

As for your gnome-related question, I don't know -- I stay away from
gnome-shell &amp; co; however it's very unlikely that it'd be possible to restore a
session after X exits, due to the way that the X protocol works. However if X
stays alive, no reason (in theory) that you can't restart your WM. (In fact,
most WMs support this explicitly.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381307452.7eE0bD2.15500--

--===============1525569734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1525569734==--
