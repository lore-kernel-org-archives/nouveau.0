From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94225] Mesa crash with "nouveau" driver and Minetest
Date: Thu, 25 Feb 2016 15:35:42 +0000
Message-ID: <bug-94225-8800-93DiURjwph@http.bugs.freedesktop.org/>
References: <bug-94225-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0053909600=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94225-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0053909600==
Content-Type: multipart/alternative; boundary="14564145410.e5165d0b.828";
 charset="UTF-8"


--14564145410.e5165d0b.828
Date: Thu, 25 Feb 2016 15:35:41 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94225

YuGiOhJCJ <yugiohjcj-D/iA7guW19M@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from YuGiOhJCJ <yugiohjcj-D/iA7guW19M@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #1)
> Mesa 10.2 was released in mid-2014. A ton of fixes have gone in over the
> past 2 years. I would highly recommend testing with Mesa 11.1.2, which is
> the most recent release.

Indeed, after upgrading my configuration to:
- minetest-0.4.13
- mesa-11.1.2
- libdrm-2.4.67
- xf86-video-nouveau-1.0.11
the problem seems to be solved because I can't reproduce anymore this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14564145410.e5165d0b.828
Date: Thu, 25 Feb 2016 15:35:41 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:yugiohjcj&#64;1s.fr" title="YuGiOhJCJ &lt;yugiohjcj&#64;1s.fr&gt;"> <span class="fn">YuGiOhJCJ</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Mesa crash with &quot;nouveau&quot; driver and Minetest"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94225">bug 94225</a>
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
   title="RESOLVED FIXED - Mesa crash with &quot;nouveau&quot; driver and Minetest"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94225#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Mesa crash with &quot;nouveau&quot; driver and Minetest"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94225">bug 94225</a>
              from <span class="vcard"><a class="email" href="mailto:yugiohjcj&#64;1s.fr" title="YuGiOhJCJ &lt;yugiohjcj&#64;1s.fr&gt;"> <span class="fn">YuGiOhJCJ</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=94225#c1">comment #1</a>)
<span class="quote">&gt; Mesa 10.2 was released in mid-2014. A ton of fixes have gone in over the
&gt; past 2 years. I would highly recommend testing with Mesa 11.1.2, which is
&gt; the most recent release.</span >

Indeed, after upgrading my configuration to:
- minetest-0.4.13
- mesa-11.1.2
- libdrm-2.4.67
- xf86-video-nouveau-1.0.11
the problem seems to be solved because I can't reproduce anymore this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14564145410.e5165d0b.828--

--===============0053909600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0053909600==--
