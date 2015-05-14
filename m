From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP errors
Date: Thu, 14 May 2015 18:00:36 +0000
Message-ID: <bug-90453-8800-1OAgLerY4Z@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0068975256=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90453-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0068975256==
Content-Type: multipart/alternative; boundary="1431626435.c0f221.9171"; charset="UTF-8"


--1431626435.c0f221.9171
Date: Thu, 14 May 2015 18:00:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #5 from Michiel Helvensteijn <mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #3)
> Another user bisected a similar issue to a change that came into 3.16. Can
> you try 3.15 and see if that works better for you?

I assume you're referring to GTK/Gnome. OK. I downgraded all gnome-related
packages I could find that had a 3.16-ish version. For almost all of them, I
downgraded to a 3.14 version, as a 3.15 version didn't exist (using Pacman on
Arch). I attached a list of packages I downgraded.

Anyway, those nouveau errors have disappeared from dmesg! Whether the display
will no longer freeze remains to be seen, but I'm hopeful. Thanks!

Which bug report should I follow to know when it's safe to upgrade again?

(PS: Another problem, which I first assumed to be related, is not yet solved.
When I enter my login data in GDM, I do not login, but GDM just re-appears. I
can only get into Gnome using startx.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431626435.c0f221.9171
Date: Thu, 14 May 2015 18:00:35 +0000
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
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:mhelvens&#64;gmail.com" title="Michiel Helvensteijn &lt;mhelvens&#64;gmail.com&gt;"> <span class="fn">Michiel Helvensteijn</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90453#c3">comment #3</a>)
<span class="quote">&gt; Another user bisected a similar issue to a change that came into 3.16. Can
&gt; you try 3.15 and see if that works better for you?</span >

I assume you're referring to GTK/Gnome. OK. I downgraded all gnome-related
packages I could find that had a 3.16-ish version. For almost all of them, I
downgraded to a 3.14 version, as a 3.15 version didn't exist (using Pacman on
Arch). I attached a list of packages I downgraded.

Anyway, those nouveau errors have disappeared from dmesg! Whether the display
will no longer freeze remains to be seen, but I'm hopeful. Thanks!

Which bug report should I follow to know when it's safe to upgrade again?

(PS: Another problem, which I first assumed to be related, is not yet solved.
When I enter my login data in GDM, I do not login, but GDM just re-appears. I
can only get into Gnome using startx.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431626435.c0f221.9171--

--===============0068975256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0068975256==--
