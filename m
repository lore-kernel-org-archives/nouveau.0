From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58316] fedora 17 kernel 3.7.0-1.PAE failed plymouth
 and enable msi error
Date: Tue, 20 Aug 2013 00:17:43 +0000
Message-ID: <bug-58316-8800-PHW6WZE7Vk@http.bugs.freedesktop.org/>
References: <bug-58316-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0289710285=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58316-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0289710285==
Content-Type: multipart/alternative; boundary="1376957863.FaA3B1.16697"; charset="us-ascii"


--1376957863.FaA3B1.16697
Date: Tue, 20 Aug 2013 00:17:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58316

Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #6 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
It seems like there was two bugs. The first bug was modesetting-related and got
fixed. The second one is about msi interrupts and some motherboards do not
support them properly IIRC. This may not be our bug so let's close this bug
report.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376957863.FaA3B1.16697
Date: Tue, 20 Aug 2013 00:17:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - fedora 17 kernel 3.7.0-1.PAE failed plymouth and enable msi error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58316">bug 58316</a>
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
   title="RESOLVED FIXED - fedora 17 kernel 3.7.0-1.PAE failed plymouth and enable msi error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58316#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - fedora 17 kernel 3.7.0-1.PAE failed plymouth and enable msi error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58316">bug 58316</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>It seems like there was two bugs. The first bug was modesetting-related and got
fixed. The second one is about msi interrupts and some motherboards do not
support them properly IIRC. This may not be our bug so let's close this bug
report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376957863.FaA3B1.16697--

--===============0289710285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0289710285==--
