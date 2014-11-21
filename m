From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70895] BUG: soft lockup - CPU#0 stuck for 22s!
 [Xorg:1292] after disable descrete card with switcheroo
Date: Fri, 21 Nov 2014 00:05:37 +0000
Message-ID: <bug-70895-8800-xz3Iv49Fgh@http.bugs.freedesktop.org/>
References: <bug-70895-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0543840761=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70895-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0543840761==
Content-Type: multipart/alternative; boundary="1416528337.aED042Fe1.3317"; charset="UTF-8"


--1416528337.aED042Fe1.3317
Date: Fri, 21 Nov 2014 00:05:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70895

Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Marcin Zajaczkowski <mszpak-5tc4TXWwyLM@public.gmane.org> ---
Closing as not reproducible with 3.17.3-300.fc21.x86_64.

> That's expected. What's unexpected is that something is keeping a reference
> to your GPU which isn't letting it power off. Similar to bug #70875.

That's also a bug reported by me :).

I created bug 86503 with the problem with keeping the card On when reporting as
Off.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416528337.aED042Fe1.3317
Date: Fri, 21 Nov 2014 00:05:37 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:mszpak&#64;wp.pl" title="Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <span class="fn">Marcin Zajaczkowski</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895">bug 70895</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - BUG: soft lockup - CPU#0 stuck for 22s! [Xorg:1292] after disable descrete card with switcheroo"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70895">bug 70895</a>
              from <span class="vcard"><a class="email" href="mailto:mszpak&#64;wp.pl" title="Marcin Zajaczkowski &lt;mszpak&#64;wp.pl&gt;"> <span class="fn">Marcin Zajaczkowski</span></a>
</span></b>
        <pre>Closing as not reproducible with 3.17.3-300.fc21.x86_64.

<span class="quote">&gt; That's expected. What's unexpected is that something is keeping a reference
&gt; to your GPU which isn't letting it power off. Similar to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVC1] runtime pm not auto-suspending card"
   href="show_bug.cgi?id=70875">bug #70875</a>.</span >

That's also a bug reported by me :).

I created <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Discrete card seems to be powered on even if reported as Off"
   href="show_bug.cgi?id=86503">bug 86503</a> with the problem with keeping the card On when reporting as
Off.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416528337.aED042Fe1.3317--

--===============0543840761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0543840761==--
