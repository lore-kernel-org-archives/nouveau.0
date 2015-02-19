From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Thu, 19 Feb 2015 08:56:33 +0000
Message-ID: <bug-87819-8800-I7wpZWbkPa@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1517548659=="
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


--===============1517548659==
Content-Type: multipart/alternative; boundary="1424336193.bDB5BD2.18014"; charset="UTF-8"


--1424336193.bDB5BD2.18014
Date: Thu, 19 Feb 2015 08:56:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87819

--- Comment #20 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Oleh Kravchenko from comment #18)
> Hello! I have the same issue, after restoring from memory suspend ("echo mem
> > /sys/power/state")

Could you please try if it is still a problem with kernel 3.19? It seems to
have been fixed there, as per comments #11 and #16.


(In reply to Stuart Longland from comment #17)
> So far, so good.  I've been tinkering for an hour and haven't yet triggered
> the EQ overflow.

Good to hear! :)

> Whatever went upstream between 3.18 and 3.19 seems to be doing the trick.

There have some patches specific for NVAA/AC cards - see commits
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=055c212ca03ea964599281211807c09c6cfb8eb5,
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=f59e76f8720bbc8bf94579b9c9a119d518a4a64f
and
http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=cb5cdd72027f90a9ed488e4d097b6e0a3911c8c9
- but it was fixing an issue where the laptop will hang during Nouveau's
initialisation of the card.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424336193.bDB5BD2.18014
Date: Thu, 19 Feb 2015 08:56:33 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVAC] EQ overflowing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87819">bug 87819</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Oleh Kravchenko from <a href="show_bug.cgi?id=87819#c18">comment #18</a>)
<span class="quote">&gt; Hello! I have the same issue, after restoring from memory suspend (&quot;echo mem
&gt; &gt; /sys/power/state&quot;)</span >

Could you please try if it is still a problem with kernel 3.19? It seems to
have been fixed there, as per comments #11 and #16.


(In reply to Stuart Longland from <a href="show_bug.cgi?id=87819#c17">comment #17</a>)
<span class="quote">&gt; So far, so good.  I've been tinkering for an hour and haven't yet triggered
&gt; the EQ overflow.</span >

Good to hear! :)

<span class="quote">&gt; Whatever went upstream between 3.18 and 3.19 seems to be doing the trick.</span >

There have some patches specific for NVAA/AC cards - see commits
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=055c212ca03ea964599281211807c09c6cfb8eb5">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=055c212ca03ea964599281211807c09c6cfb8eb5</a>,
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=f59e76f8720bbc8bf94579b9c9a119d518a4a64f">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=f59e76f8720bbc8bf94579b9c9a119d518a4a64f</a>
and
<a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=cb5cdd72027f90a9ed488e4d097b6e0a3911c8c9">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=cb5cdd72027f90a9ed488e4d097b6e0a3911c8c9</a>
- but it was fixing an issue where the laptop will hang during Nouveau's
initialisation of the card.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424336193.bDB5BD2.18014--

--===============1517548659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1517548659==--
