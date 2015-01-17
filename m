From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88514] X segfaults when using prime offloading to
	nouveau card
Date: Sat, 17 Jan 2015 01:13:23 +0000
Message-ID: <bug-88514-8800-hlD23kwxr6@http.bugs.freedesktop.org/>
References: <bug-88514-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0908111237=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88514-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0908111237==
Content-Type: multipart/alternative; boundary="1421457203.Aab31.1794"; charset="UTF-8"


--1421457203.Aab31.1794
Date: Sat, 17 Jan 2015 01:13:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88514

--- Comment #8 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to aidan from comment #7)
(snip)
> I might try one of these solutions.  A couple questions for DRI3: how do I
> check if X and mesa have DRI3 support?  Also, what setup do I need to do? 
> Do I just need to use DRI_PRIME=1, without using xrandr
> --setprovideroffloadsink (like I would for DRI2)?

You'll need the setup described at the nouveau's prime page, linked above,
other than that, you just have to do:
DRI_PRIME=1 app
and it will offload to nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421457203.Aab31.1794
Date: Sat, 17 Jan 2015 01:13:23 +0000
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
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - X segfaults when using prime offloading to nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88514">bug 88514</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to aidan from <a href="show_bug.cgi?id=88514#c7">comment #7</a>)
(snip)
<span class="quote">&gt; I might try one of these solutions.  A couple questions for DRI3: how do I
&gt; check if X and mesa have DRI3 support?  Also, what setup do I need to do? 
&gt; Do I just need to use DRI_PRIME=1, without using xrandr
&gt; --setprovideroffloadsink (like I would for DRI2)?</span >

You'll need the setup described at the nouveau's prime page, linked above,
other than that, you just have to do:
DRI_PRIME=1 app
and it will offload to nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421457203.Aab31.1794--

--===============0908111237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0908111237==--
