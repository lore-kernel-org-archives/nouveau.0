From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91373] Nouveau fills kern.log with gigabytes of data
 when molecule screensaver is run
Date: Mon, 20 Jul 2015 14:09:27 +0000
Message-ID: <bug-91373-8800-TCsWC86HYI@http.bugs.freedesktop.org/>
References: <bug-91373-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0230916314=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91373-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0230916314==
Content-Type: multipart/alternative; boundary="1437401367.abCc31.4131"; charset="UTF-8"


--1437401367.abCc31.4131
Date: Mon, 20 Jul 2015 14:09:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91373

--- Comment #4 from Olivier Diotte <vhann3000+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #3)
> 4.0 received some additional fixes to ctxsw logic. Please try that or 4.1.

I compiled v4.1, but actually booted into 4.2.0-rc2 (derp), yet it didn't crash
or write any error to the log files over the whole weekend.

I will keep using it and see if I can still reproduce, but right now, this
appears to work for me.

I can still test v4.1 or v4.0 if you feel it would be useful.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1437401367.abCc31.4131
Date: Mon, 20 Jul 2015 14:09:27 +0000
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
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau fills kern.log with gigabytes of data when molecule screensaver is run"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91373">bug 91373</a>
              from <span class="vcard"><a class="email" href="mailto:vhann3000+freedesktop&#64;gmail.com" title="Olivier Diotte &lt;vhann3000+freedesktop&#64;gmail.com&gt;"> <span class="fn">Olivier Diotte</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=91373#c3">comment #3</a>)
<span class="quote">&gt; 4.0 received some additional fixes to ctxsw logic. Please try that or 4.1.</span >

I compiled v4.1, but actually booted into 4.2.0-rc2 (derp), yet it didn't crash
or write any error to the log files over the whole weekend.

I will keep using it and see if I can still reproduce, but right now, this
appears to work for me.

I can still test v4.1 or v4.0 if you feel it would be useful.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1437401367.abCc31.4131--

--===============0230916314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0230916314==--
