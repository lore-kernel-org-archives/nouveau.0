From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95031] [NVE4] 660 Ti Random GPU lockups
Date: Thu, 21 Apr 2016 08:19:41 +0000
Message-ID: <bug-95031-8800-bLCNBUlIlM@http.bugs.freedesktop.org/>
References: <bug-95031-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1269278318=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95031-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1269278318==
Content-Type: multipart/alternative; boundary="14612267812.BafC3d35.26914";
 charset="UTF-8"


--14612267812.BafC3d35.26914
Date: Thu, 21 Apr 2016 08:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95031

--- Comment #7 from Karol Herbst <freedesktop-lIBOoy2+GI7scQ4cX5LuPg@public.gmane.org> ---
(In reply to Lucas Ribeiro from comment #4)
> 
> So maybe 07 pstate on Linux has a memory clock too high for its voltage.
> Also, as it is the lowest pstate, maybe memory clock could be reduced
> further to 162MHz (as in Windows).

And maybe not. There are other issues which aren't exactly voltage related. If
such a high votlage won't help, then it is usually something else, we just have
to figure out what it is.

Also regarding the lower clocks: yeah I know that sometimes nvidia clocks
further down, but there is no real value in doing so if there is no voltage
information for those low clocks and it doesn't make any difference regarding
power consumption as far as I know.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14612267812.BafC3d35.26914
Date: Thu, 21 Apr 2016 08:19:41 +0000
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
   title="NEW - [NVE4] 660 Ti Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE4] 660 Ti Random GPU lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95031">bug 95031</a>
              from <span class="vcard"><a class="email" href="mailto:freedesktop&#64;karolherbst.de" title="Karol Herbst &lt;freedesktop&#64;karolherbst.de&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Lucas Ribeiro from <a href="show_bug.cgi?id=95031#c4">comment #4</a>)
<span class="quote">&gt; 
&gt; So maybe 07 pstate on Linux has a memory clock too high for its voltage.
&gt; Also, as it is the lowest pstate, maybe memory clock could be reduced
&gt; further to 162MHz (as in Windows).</span >

And maybe not. There are other issues which aren't exactly voltage related. If
such a high votlage won't help, then it is usually something else, we just have
to figure out what it is.

Also regarding the lower clocks: yeah I know that sometimes nvidia clocks
further down, but there is no real value in doing so if there is no voltage
information for those low clocks and it doesn't make any difference regarding
power consumption as far as I know.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14612267812.BafC3d35.26914--

--===============1269278318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1269278318==--
