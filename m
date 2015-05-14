From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP errors
Date: Thu, 14 May 2015 18:02:59 +0000
Message-ID: <bug-90453-8800-cWdPxe2QmA@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1549362048=="
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


--===============1549362048==
Content-Type: multipart/alternative; boundary="1431626578.B2AF1.9967"; charset="UTF-8"


--1431626578.B2AF1.9967
Date: Thu, 14 May 2015 18:02:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Michiel Helvensteijn from comment #5)
> (In reply to Ilia Mirkin from comment #3)
> > Another user bisected a similar issue to a change that came into 3.16. Can
> > you try 3.15 and see if that works better for you?
> 
> I assume you're referring to GTK/Gnome. OK. I downgraded all gnome-related
> packages I could find that had a 3.16-ish version. For almost all of them, I
> downgraded to a 3.14 version, as a 3.15 version didn't exist (using Pacman
> on Arch). I attached a list of packages I downgraded.

Sorry for the confusion. I meant kernel.

> 
> Anyway, those nouveau errors have disappeared from dmesg! Whether the
> display will no longer freeze remains to be seen, but I'm hopeful. Thanks!
> 
> Which bug report should I follow to know when it's safe to upgrade again?

That's actually a bit surprising. Means that the DE is part of what's tickling
the nouveau bug.

> 
> (PS: Another problem, which I first assumed to be related, is not yet
> solved. When I enter my login data in GDM, I do not login, but GDM just
> re-appears. I can only get into Gnome using startx.)

You'll have to figure out what's going wrong in your stack. Presumably file a
bug with the gdm people?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431626578.B2AF1.9967
Date: Thu, 14 May 2015 18:02:58 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Michiel Helvensteijn from <a href="show_bug.cgi?id=90453#c5">comment #5</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90453#c3">comment #3</a>)
&gt; &gt; Another user bisected a similar issue to a change that came into 3.16. Can
&gt; &gt; you try 3.15 and see if that works better for you?
&gt; 
&gt; I assume you're referring to GTK/Gnome. OK. I downgraded all gnome-related
&gt; packages I could find that had a 3.16-ish version. For almost all of them, I
&gt; downgraded to a 3.14 version, as a 3.15 version didn't exist (using Pacman
&gt; on Arch). I attached a list of packages I downgraded.</span >

Sorry for the confusion. I meant kernel.

<span class="quote">&gt; 
&gt; Anyway, those nouveau errors have disappeared from dmesg! Whether the
&gt; display will no longer freeze remains to be seen, but I'm hopeful. Thanks!
&gt; 
&gt; Which bug report should I follow to know when it's safe to upgrade again?</span >

That's actually a bit surprising. Means that the DE is part of what's tickling
the nouveau bug.

<span class="quote">&gt; 
&gt; (PS: Another problem, which I first assumed to be related, is not yet
&gt; solved. When I enter my login data in GDM, I do not login, but GDM just
&gt; re-appears. I can only get into Gnome using startx.)</span >

You'll have to figure out what's going wrong in your stack. Presumably file a
bug with the gdm people?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431626578.B2AF1.9967--

--===============1549362048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1549362048==--
