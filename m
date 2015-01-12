From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87552] [NV1A] 3.18.1 BUG on modprobe nouveau in
 drivers/gpu/drm/nouveau/core/core/event.c:42
Date: Mon, 12 Jan 2015 19:05:13 +0000
Message-ID: <bug-87552-8800-cci3QvcQmC@http.bugs.freedesktop.org/>
References: <bug-87552-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0408664410=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87552-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0408664410==
Content-Type: multipart/alternative; boundary="1421089512.FcDD4dA1.14267"; charset="UTF-8"


--1421089512.FcDD4dA1.14267
Date: Mon, 12 Jan 2015 19:05:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87552

Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                URL|                            |http://git.kernel.org/cgit/
                   |                            |linux/kernel/git/torvalds/l
                   |                            |inux.git/commit/?id=ff4c0d5
                   |                            |213b015e60aa87c1352604f10ba
                   |                            |9c3e12
         Resolution|---                         |FIXED

--- Comment #3 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
Fixed in v3.19-rc4. Requested for backport to 3.17, 3.18 stable.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1421089512.FcDD4dA1.14267
Date: Mon, 12 Jan 2015 19:05:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87552">bug 87552</a>
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
           <td style="text-align:right;">URL</td>
           <td>
               &nbsp;
           </td>
           <td>http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=ff4c0d5213b015e60aa87c1352604f10ba9c3e12
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
   title="RESOLVED FIXED - [NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87552#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV1A] 3.18.1 BUG on modprobe nouveau in drivers/gpu/drm/nouveau/core/core/event.c:42"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87552">bug 87552</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>Fixed in v3.19-rc4. Requested for backport to 3.17, 3.18 stable.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1421089512.FcDD4dA1.14267--

--===============0408664410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0408664410==--
