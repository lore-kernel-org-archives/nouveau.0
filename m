From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Thu, 19 Feb 2015 09:44:48 +0000
Message-ID: <bug-87819-8800-qRkglZyKYr@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1250579081=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1250579081==
Content-Type: multipart/alternative; boundary="1424339087.30EFC2.28356"; charset="UTF-8"


--1424339087.30EFC2.28356
Date: Thu, 19 Feb 2015 09:44:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #22 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Stuart Longland from comment #21)
> Ahh, I think I've had that bug too.  Basically I'd power the laptop on and
> the machine would get as far as loading drivers then hang.  I had it on my
> TODO list to eventually track down which driver, but lately I've noticed
> this has stopped happening.

That bug was corrected thanks to NVidia answers about how some specific
registers worked.

> It's a pity that Nvidia don't direct more resources to supporting the
> Nouveau driver.  I've vowed to never buy an Nvidia card again due to their
> poor support of their cards.  (I don't consider a proprietary driver as
> "support", more a cop-out and a support head-ache.)

The NVidia team working on Tegra K1 support in Nouveau is growing and they are
quite active. A bit more documentation was released last month - see
http://lists.freedesktop.org/archives/nouveau/2015-January/019759.html. It
might be slow, but they seem to head in the right direction. Let's see in
September how the first two years went since they started releasing some
documentation / contributing code.

> It's thanks to teams like Nouveau that I can make reasonable use of the two
> Nvidia-based systems I have at all.
> For this, I thank-you.

You are welcome!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424339087.30EFC2.28356
Date: Thu, 19 Feb 2015 09:44:47 +0000
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
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Stuart Longland from <a href="show_bug.cgi?id=87819#c21">comment #21</a>)
<span class="quote">&gt; Ahh, I think I've had that bug too.  Basically I'd power the laptop on and
&gt; the machine would get as far as loading drivers then hang.  I had it on my
&gt; TODO list to eventually track down which driver, but lately I've noticed
&gt; this has stopped happening.</span >

That bug was corrected thanks to NVidia answers about how some specific
registers worked.

<span class="quote">&gt; It's a pity that Nvidia don't direct more resources to supporting the
&gt; Nouveau driver.  I've vowed to never buy an Nvidia card again due to their
&gt; poor support of their cards.  (I don't consider a proprietary driver as
&gt; &quot;support&quot;, more a cop-out and a support head-ache.)</span >

The NVidia team working on Tegra K1 support in Nouveau is growing and they are
quite active. A bit more documentation was released last month - see
<a href="http://lists.freedesktop.org/archives/nouveau/2015-January/019759.html">http://lists.freedesktop.org/archives/nouveau/2015-January/019759.html</a>. It
might be slow, but they seem to head in the right direction. Let's see in
September how the first two years went since they started releasing some
documentation / contributing code.

<span class="quote">&gt; It's thanks to teams like Nouveau that I can make reasonable use of the two
&gt; Nvidia-based systems I have at all.
&gt; For this, I thank-you.</span >

You are welcome!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424339087.30EFC2.28356--

--===============1250579081==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1250579081==--
