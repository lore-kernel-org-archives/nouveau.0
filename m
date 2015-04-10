From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86109] kernel oops after lightdm startup
Date: Fri, 10 Apr 2015 12:45:38 +0000
Message-ID: <bug-86109-8800-hDA5ncoYDe@http.bugs.freedesktop.org/>
References: <bug-86109-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0229280726=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-86109-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0229280726==
Content-Type: multipart/alternative; boundary="1428669938.46B61.12211"; charset="UTF-8"


--1428669938.46B61.12211
Date: Fri, 10 Apr 2015 12:45:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86109

Etienne Z. <etienne-cucUXmzBMd0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Etienne Z. <etienne-cucUXmzBMd0@public.gmane.org> ---
Yes, sorry for the lack of follow-up. This has been fixed by a debian kernel
update somewhere in february.

Looking at the changelog, my guess would be by this commit:
    - nouveau: move the hotplug ignore to correct place. (regression in 3.16.4)

Merci

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428669938.46B61.12211
Date: Fri, 10 Apr 2015 12:45:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:etienne&#64;zol.fr" title="Etienne Z. &lt;etienne&#64;zol.fr&gt;"> <span class="fn">Etienne Z.</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - kernel oops after lightdm startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86109">bug 86109</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEEDINFO
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
   title="RESOLVED FIXED - kernel oops after lightdm startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86109#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - kernel oops after lightdm startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86109">bug 86109</a>
              from <span class="vcard"><a class="email" href="mailto:etienne&#64;zol.fr" title="Etienne Z. &lt;etienne&#64;zol.fr&gt;"> <span class="fn">Etienne Z.</span></a>
</span></b>
        <pre>Yes, sorry for the lack of follow-up. This has been fixed by a debian kernel
update somewhere in february.

Looking at the changelog, my guess would be by this commit:
    - nouveau: move the hotplug ignore to correct place. (regression in 3.16.4)

Merci</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428669938.46B61.12211--

--===============0229280726==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0229280726==--
