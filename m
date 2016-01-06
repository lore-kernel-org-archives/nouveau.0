From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93557] Kernel Panic on Linux Kernel 4.4 when loading
 KDE/KDM on Nvidia GeForce 7025 / nForce 630a
Date: Wed, 06 Jan 2016 21:50:53 +0000
Message-ID: <bug-93557-8800-V8qJhQi897@http.bugs.freedesktop.org/>
References: <bug-93557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0354831230=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0354831230==
Content-Type: multipart/alternative; boundary="1452117052.32562.30672"; charset="UTF-8"


--1452117052.32562.30672
Date: Wed, 6 Jan 2016 21:50:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93557

--- Comment #6 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to xgfwtvdh from comment #5)
> They are REDLINED in dmesg. More/bigger warning is not possible for the
> users.
> It were something like a big red flashing "WARNING, MOTOR FAILURE" on the
> Screen of your car and then someone would say "nah, that warning is just
> fine, ignore it".
> 
> I would like to help fixing them by testing something when you need me
> testing something.

If you can get a mmiotrace[1] of the binary driver, that might be useful.

Thanks,
Ben.

[1] http://nouveau.freedesktop.org/wiki/MmioTrace/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1452117052.32562.30672
Date: Wed, 6 Jan 2016 21:50:52 +0000
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
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557">bug 93557</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to xgfwtvdh from <a href="show_bug.cgi?id=93557#c5">comment #5</a>)
<span class="quote">&gt; They are REDLINED in dmesg. More/bigger warning is not possible for the
&gt; users.
&gt; It were something like a big red flashing &quot;WARNING, MOTOR FAILURE&quot; on the
&gt; Screen of your car and then someone would say &quot;nah, that warning is just
&gt; fine, ignore it&quot;.
&gt; 
&gt; I would like to help fixing them by testing something when you need me
&gt; testing something.</span >

If you can get a mmiotrace[1] of the binary driver, that might be useful.

Thanks,
Ben.

[1] <a href="http://nouveau.freedesktop.org/wiki/MmioTrace/">http://nouveau.freedesktop.org/wiki/MmioTrace/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1452117052.32562.30672--

--===============0354831230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0354831230==--
