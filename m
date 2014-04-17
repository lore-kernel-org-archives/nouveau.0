From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75761] weston-launch no output - black screen
Date: Thu, 17 Apr 2014 11:54:03 +0000
Message-ID: <bug-75761-8800-jX2h2aTn0H@http.bugs.freedesktop.org/>
References: <bug-75761-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0008419572=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75761-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0008419572==
Content-Type: multipart/alternative; boundary="1397735643.73176D713.6999"; charset="us-ascii"


--1397735643.73176D713.6999
Date: Thu, 17 Apr 2014 11:54:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75761

soundx94-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #20 from soundx94-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
Thanks for bisecting the kernel. Reverting that patch on the latest kernel also
fixes the issue for me.
(Using NVE6: GTX 660)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397735643.73176D713.6999
Date: Thu, 17 Apr 2014 11:54:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:soundx94&#64;hotmail.com" title="soundx94&#64;hotmail.com">soundx94&#64;hotmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
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
           <td>WORKSFORME
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED WORKSFORME - weston-launch no output - black screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75761">bug 75761</a>
              from <span class="vcard"><a class="email" href="mailto:soundx94&#64;hotmail.com" title="soundx94&#64;hotmail.com">soundx94&#64;hotmail.com</a>
</span></b>
        <pre>Thanks for bisecting the kernel. Reverting that patch on the latest kernel also
fixes the issue for me.
(Using NVE6: GTX 660)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397735643.73176D713.6999--

--===============0008419572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0008419572==--
