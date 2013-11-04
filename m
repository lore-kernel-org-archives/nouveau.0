From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71172] Segfault when running glxinfo. NV25GL
	[Quadro4 900 XGL]
Date: Mon, 04 Nov 2013 20:17:16 +0000
Message-ID: <bug-71172-8800-YKpkyNAL0n@http.bugs.freedesktop.org/>
References: <bug-71172-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0477084745=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71172-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0477084745==
Content-Type: multipart/alternative; boundary="1383596236.dAfb7Dc01.26543"; charset="us-ascii"


--1383596236.dAfb7Dc01.26543
Date: Mon, 4 Nov 2013 20:17:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71172

Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #5 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> ---
This should be fixed in master now [1].

Thanks.

[1]
http://cgit.freedesktop.org/mesa/mesa/commit/?id=67b8f4c569030a2b6392560f8e73283a6a73dc7e

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383596236.dAfb7Dc01.26543
Date: Mon, 4 Nov 2013 20:17:16 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:currojerez&#64;riseup.net" title="Francisco Jerez &lt;currojerez&#64;riseup.net&gt;"> <span class="fn">Francisco Jerez</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172">bug 71172</a>
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
   title="RESOLVED FIXED - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Segfault when running glxinfo. NV25GL [Quadro4 900 XGL]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71172">bug 71172</a>
              from <span class="vcard"><a class="email" href="mailto:currojerez&#64;riseup.net" title="Francisco Jerez &lt;currojerez&#64;riseup.net&gt;"> <span class="fn">Francisco Jerez</span></a>
</span></b>
        <pre>This should be fixed in master now [1].

Thanks.

[1]
<a href="http://cgit.freedesktop.org/mesa/mesa/commit/?id=67b8f4c569030a2b6392560f8e73283a6a73dc7e">http://cgit.freedesktop.org/mesa/mesa/commit/?id=67b8f4c569030a2b6392560f8e73283a6a73dc7e</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383596236.dAfb7Dc01.26543--

--===============0477084745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0477084745==--
