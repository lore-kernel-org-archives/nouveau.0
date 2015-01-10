From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 88262] [NV28] 3.19 kernels hang during boot
Date: Sat, 10 Jan 2015 16:12:51 +0000
Message-ID: <bug-88262-8800-uPGZOUev6O@http.bugs.freedesktop.org/>
References: <bug-88262-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0215899205=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-88262-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0215899205==
Content-Type: multipart/alternative; boundary="1420906371.c688aC1.11666"; charset="UTF-8"


--1420906371.c688aC1.11666
Date: Sat, 10 Jan 2015 16:12:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=88262

Bruno Wolff <bruno-bdMChIhFSYk@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Bruno Wolff <bruno-bdMChIhFSYk@public.gmane.org> ---
Thanks. Next time I suspect a Nouveau bug, I'm going to remember to look though
the queued up fixes before (or while starting) a bisect. I remember seeing the
summary from the fix a week or so a ago when working with an nv50 issue and
didn't put two and two together. I should have noticed this fix right away and
tested it to see if it fixed my problem.

Anyway, I tested current mainline and things are fixed. Thanks again.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420906371.c688aC1.11666
Date: Sat, 10 Jan 2015 16:12:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:bruno&#64;wolff.to" title="Bruno Wolff &lt;bruno&#64;wolff.to&gt;"> <span class="fn">Bruno Wolff</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV28] 3.19 kernels hang during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262">bug 88262</a>
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
   title="RESOLVED FIXED - [NV28] 3.19 kernels hang during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NV28] 3.19 kernels hang during boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=88262">bug 88262</a>
              from <span class="vcard"><a class="email" href="mailto:bruno&#64;wolff.to" title="Bruno Wolff &lt;bruno&#64;wolff.to&gt;"> <span class="fn">Bruno Wolff</span></a>
</span></b>
        <pre>Thanks. Next time I suspect a Nouveau bug, I'm going to remember to look though
the queued up fixes before (or while starting) a bisect. I remember seeing the
summary from the fix a week or so a ago when working with an nv50 issue and
didn't put two and two together. I should have noticed this fix right away and
tested it to see if it fixed my problem.

Anyway, I tested current mainline and things are fixed. Thanks again.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420906371.c688aC1.11666--

--===============0215899205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0215899205==--
