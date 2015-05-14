From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90453] [NVE4] Desktop freezes & PDISP errors
Date: Thu, 14 May 2015 18:09:45 +0000
Message-ID: <bug-90453-8800-sk7ks1hWFx@http.bugs.freedesktop.org/>
References: <bug-90453-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0692846235=="
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


--===============0692846235==
Content-Type: multipart/alternative; boundary="1431626985.88b81.11972"; charset="UTF-8"


--1431626985.88b81.11972
Date: Thu, 14 May 2015 18:09:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90453

--- Comment #8 from Michiel Helvensteijn <mhelvens-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)

> > > Another user bisected a similar issue to a change that came into 3.16. Can
> > > you try 3.15 and see if that works better for you?
> > 
> > I assume you're referring to GTK/Gnome.
> 
> Sorry for the confusion. I meant kernel.

That was my first guess, but 3.16 was already a while ago for me, and I'm
currently running 4.0.2. On the other hand, the latest version of GTK and
friends actually is 3.16, so... Funny coincidence.

> > Anyway, those nouveau errors have disappeared from dmesg! Whether the
> > display will no longer freeze remains to be seen, but I'm hopeful. Thanks!
> > 
> > Which bug report should I follow to know when it's safe to upgrade again?
> 
> That's actually a bit surprising. Means that the DE is part of what's
> tickling the nouveau bug.

Well, let me know if I can provide you with any further info. DE or not, this
still manifests as a nouveau bug.

> You'll have to figure out what's going wrong in your stack. Presumably file
> a bug with the gdm people?

Yeah, my system's a hot mess right now. Thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431626985.88b81.11972
Date: Thu, 14 May 2015 18:09:45 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] Desktop freezes &amp; PDISP errors"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90453">bug 90453</a>
              from <span class="vcard"><a class="email" href="mailto:mhelvens&#64;gmail.com" title="Michiel Helvensteijn &lt;mhelvens&#64;gmail.com&gt;"> <span class="fn">Michiel Helvensteijn</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90453#c6">comment #6</a>)

<span class="quote">&gt; &gt; &gt; Another user bisected a similar issue to a change that came into 3.16. Can
&gt; &gt; &gt; you try 3.15 and see if that works better for you?
&gt; &gt; 
&gt; &gt; I assume you're referring to GTK/Gnome.
&gt; 
&gt; Sorry for the confusion. I meant kernel.</span >

That was my first guess, but 3.16 was already a while ago for me, and I'm
currently running 4.0.2. On the other hand, the latest version of GTK and
friends actually is 3.16, so... Funny coincidence.

<span class="quote">&gt; &gt; Anyway, those nouveau errors have disappeared from dmesg! Whether the
&gt; &gt; display will no longer freeze remains to be seen, but I'm hopeful. Thanks!
&gt; &gt; 
&gt; &gt; Which bug report should I follow to know when it's safe to upgrade again?
&gt; 
&gt; That's actually a bit surprising. Means that the DE is part of what's
&gt; tickling the nouveau bug.</span >

Well, let me know if I can provide you with any further info. DE or not, this
still manifests as a nouveau bug.

<span class="quote">&gt; You'll have to figure out what's going wrong in your stack. Presumably file
&gt; a bug with the gdm people?</span >

Yeah, my system's a hot mess right now. Thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431626985.88b81.11972--

--===============0692846235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0692846235==--
