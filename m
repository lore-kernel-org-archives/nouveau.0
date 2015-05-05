From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89247] [NVE7] short display freeze on xrandr --query
Date: Tue, 05 May 2015 21:09:32 +0000
Message-ID: <bug-89247-8800-ZSXJ21mVns@http.bugs.freedesktop.org/>
References: <bug-89247-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0094541981=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89247-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0094541981==
Content-Type: multipart/alternative; boundary="1430860172.d47eD2f2.6159"; charset="UTF-8"


--1430860172.d47eD2f2.6159
Date: Tue, 5 May 2015 21:09:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89247

--- Comment #14 from Tobias Klausmann <tobias.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> ---
(In reply to exi+freedesktop from comment #13)

> xrandr -q still takes 0.3 seconds every time it is called leading to massive
> freezing when attaching an external display.
> The dmesg is attached.

Maybe try to disable all unused outputs (at least DP-2/3), i think you cant for
the intel outputs in "nvidia mode", but listing them wont hurt either.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430860172.d47eD2f2.6159
Date: Tue, 5 May 2015 21:09:32 +0000
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
   title="NEW - [NVE7] short display freeze on xrandr --query"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89247#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] short display freeze on xrandr --query"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89247">bug 89247</a>
              from <span class="vcard"><a class="email" href="mailto:tobias.klausmann&#64;mni.thm.de" title="Tobias Klausmann &lt;tobias.klausmann&#64;mni.thm.de&gt;"> <span class="fn">Tobias Klausmann</span></a>
</span></b>
        <pre>(In reply to exi+freedesktop from <a href="show_bug.cgi?id=89247#c13">comment #13</a>)

<span class="quote">&gt; xrandr -q still takes 0.3 seconds every time it is called leading to massive
&gt; freezing when attaching an external display.
&gt; The dmesg is attached.</span >

Maybe try to disable all unused outputs (at least DP-2/3), i think you cant for
the intel outputs in &quot;nvidia mode&quot;, but listing them wont hurt either.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430860172.d47eD2f2.6159--

--===============0094541981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0094541981==--
