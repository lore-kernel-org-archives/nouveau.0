From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54700] Distorted graphics (double cursor) with
 GeForce 4200Go (NV28M)
Date: Fri, 22 Jan 2016 01:47:07 +0000
Message-ID: <bug-54700-8800-tXTV5IDo3C@http.bugs.freedesktop.org/>
References: <bug-54700-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0072841317=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-54700-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0072841317==
Content-Type: multipart/alternative; boundary="14534272271.81Fc74b2.29722";
 charset="UTF-8"


--14534272271.81Fc74b2.29722
Date: Fri, 22 Jan 2016 01:47:07 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=54700

--- Comment #76 from AndrewK <kurn-z1KUqvL5UUQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #75)
> (In reply to AndrewK from comment #73)
> > (In reply to nv28m from comment #71)
> > > nouveau.agpmode=0 seems to work here too, also after comming back from
> > > suspend.
> > > 
> > The parameter name seems to be changed.  nouveau.modeset=0 is what worked
> > for me.
> > 
> 
> nouveau.modeset=0 just disables nouveau entirely.

Without modeset=0 the screen gets scrambled.  With it, it is correct.
That's at least minimum functionality.

I tried agpmode=0 but it didn't work.  Also, modinfo didn't list a
parameter by that name, so I chose the one that looked closest.

I don't really know what happened, but I'm not demanding w.r.t. high-speed
rendering, so I'm content.

As other posters have mentioned, I'll be glad to do any tests you'd like,
since I have the hardware.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14534272271.81Fc74b2.29722
Date: Fri, 22 Jan 2016 01:47:07 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700#c76">Comment # 76</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Distorted graphics (double cursor) with GeForce 4200Go (NV28M)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=54700">bug 54700</a>
              from <span class="vcard"><a class="email" href="mailto:kurn&#64;sfu.ca" title="AndrewK &lt;kurn&#64;sfu.ca&gt;"> <span class="fn">AndrewK</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=54700#c75">comment #75</a>)
<span class="quote">&gt; (In reply to AndrewK from <a href="show_bug.cgi?id=54700#c73">comment #73</a>)
&gt; &gt; (In reply to nv28m from <a href="show_bug.cgi?id=54700#c71">comment #71</a>)
&gt; &gt; &gt; nouveau.agpmode=0 seems to work here too, also after comming back from
&gt; &gt; &gt; suspend.
&gt; &gt; &gt; 
&gt; &gt; The parameter name seems to be changed.  nouveau.modeset=0 is what worked
&gt; &gt; for me.
&gt; &gt; 
&gt; 
&gt; nouveau.modeset=0 just disables nouveau entirely.</span >

Without modeset=0 the screen gets scrambled.  With it, it is correct.
That's at least minimum functionality.

I tried agpmode=0 but it didn't work.  Also, modinfo didn't list a
parameter by that name, so I chose the one that looked closest.

I don't really know what happened, but I'm not demanding w.r.t. high-speed
rendering, so I'm content.

As other posters have mentioned, I'll be glad to do any tests you'd like,
since I have the hardware.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14534272271.81Fc74b2.29722--

--===============0072841317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0072841317==--
