From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89047] linux-3.19 nvd9 Invalid rom content
Date: Mon, 13 Apr 2015 23:29:03 +0000
Message-ID: <bug-89047-8800-0NGDLAI6fn@http.bugs.freedesktop.org/>
References: <bug-89047-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0955808579=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89047-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0955808579==
Content-Type: multipart/alternative; boundary="1428967742.c1bA1.9480"; charset="UTF-8"


--1428967742.c1bA1.9480
Date: Mon, 13 Apr 2015 23:29:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89047

--- Comment #6 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Jan Vesely from comment #5)
> Created attachment 115044 [details]
> vbois.rom

Thanks.

Does your patch still work for you with the change to subdev/bios/shadow.c
reverted (so, just keep the > to >= changes in shadowacpi.c) too?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428967742.c1bA1.9480
Date: Mon, 13 Apr 2015 23:29:02 +0000
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
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89047#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - linux-3.19 nvd9 Invalid rom content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89047">bug 89047</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Jan Vesely from <a href="show_bug.cgi?id=89047#c5">comment #5</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=115044" name="attach_115044" title="vbois.rom">attachment 115044</a> <a href="attachment.cgi?id=115044&amp;action=edit" title="vbois.rom">[details]</a></span>
&gt; vbois.rom</span >

Thanks.

Does your patch still work for you with the change to subdev/bios/shadow.c
reverted (so, just keep the &gt; to &gt;= changes in shadowacpi.c) too?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428967742.c1bA1.9480--

--===============0955808579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0955808579==--
