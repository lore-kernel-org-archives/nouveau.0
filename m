From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52411] NV43 [GeForce 6600] nouveau in linux kernel
 3.4.0 to 3.4.5 hangs at boot
Date: Sun, 15 Sep 2013 17:55:06 +0000
Message-ID: <bug-52411-8800-nrd5lYntsy@http.bugs.freedesktop.org/>
References: <bug-52411-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0234110594=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52411-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0234110594==
Content-Type: multipart/alternative; boundary="1379267706.7abb2.21721"; charset="us-ascii"


--1379267706.7abb2.21721
Date: Sun, 15 Sep 2013 17:55:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=52411

Hans de Graaff <hans-aqmcjHYS7FBg9hUCZPvPmw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|INVALID                     |---

--- Comment #5 from Hans de Graaff <hans-aqmcjHYS7FBg9hUCZPvPmw@public.gmane.org> ---
Unfortunately I don't have much time to play around with this machine and test
things, but this bug is still present in linux 3.10.7. I realize that without
additional information this is going to be hard to fix. Hopefully I'll be able
to provide more information in the future if I find some time for that.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1379267706.7abb2.21721
Date: Sun, 15 Sep 2013 17:55:06 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:hans&#64;degraaff.org" title="Hans de Graaff &lt;hans&#64;degraaff.org&gt;"> <span class="fn">Hans de Graaff</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411">bug 52411</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>INVALID
           </td>
           <td>---
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - NV43 [GeForce 6600] nouveau in linux kernel 3.4.0 to 3.4.5 hangs at boot"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=52411">bug 52411</a>
              from <span class="vcard"><a class="email" href="mailto:hans&#64;degraaff.org" title="Hans de Graaff &lt;hans&#64;degraaff.org&gt;"> <span class="fn">Hans de Graaff</span></a>
</span></b>
        <pre>Unfortunately I don't have much time to play around with this machine and test
things, but this bug is still present in linux 3.10.7. I realize that without
additional information this is going to be hard to fix. Hopefully I'll be able
to provide more information in the future if I find some time for that.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1379267706.7abb2.21721--

--===============0234110594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0234110594==--
