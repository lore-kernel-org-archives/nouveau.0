From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89558] [NV118] GM108 not supported by nouveau
Date: Wed, 30 Sep 2015 20:00:36 +0000
Message-ID: <bug-89558-8800-EZTNOJUwJE@http.bugs.freedesktop.org/>
References: <bug-89558-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1499335957=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89558-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1499335957==
Content-Type: multipart/alternative; boundary="1443643236.eeB6A64.24846"; charset="UTF-8"


--1443643236.eeB6A64.24846
Date: Wed, 30 Sep 2015 20:00:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89558

--- Comment #43 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Andrei Borzenkov from comment #42)
> (In reply to Ilia Mirkin from comment #41)
> > Use the modesetting driver.
> 
> Does not work - I do not get any output (but as said, I have quite dated
> Xorg). Anyway, the whole point of Optimus systems is to use discrete GPU for
> hardware acceleration; using generic driver seems to defeat it ...

How so?

With a modern Xorg you should be able to do 3 things:

(a) use modesetting + glamor on any hardware with libGL support to get X
operation acceleration [which is not something you care about since you're not
going to use the GM108 as a primary]
(b) use xrandr-based gpu offloading to get DRI2 offloading with DRI_PRIME=1
(c) use DRI3-based offloading with DRI_PRIME=1 assuming your intel ddx has that
enabled

Note how nowhere in there is there any mention of a nouveau ddx.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443643236.eeB6A64.24846
Date: Wed, 30 Sep 2015 20:00:36 +0000
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
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV118] GM108 not supported by nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89558">bug 89558</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Andrei Borzenkov from <a href="show_bug.cgi?id=89558#c42">comment #42</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=89558#c41">comment #41</a>)
&gt; &gt; Use the modesetting driver.
&gt; 
&gt; Does not work - I do not get any output (but as said, I have quite dated
&gt; Xorg). Anyway, the whole point of Optimus systems is to use discrete GPU for
&gt; hardware acceleration; using generic driver seems to defeat it ...</span >

How so?

With a modern Xorg you should be able to do 3 things:

(a) use modesetting + glamor on any hardware with libGL support to get X
operation acceleration [which is not something you care about since you're not
going to use the GM108 as a primary]
(b) use xrandr-based gpu offloading to get DRI2 offloading with DRI_PRIME=1
(c) use DRI3-based offloading with DRI_PRIME=1 assuming your intel ddx has that
enabled

Note how nowhere in there is there any mention of a nouveau ddx.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443643236.eeB6A64.24846--

--===============1499335957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1499335957==--
