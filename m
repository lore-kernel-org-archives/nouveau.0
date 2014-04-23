From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77599] Video failed on resume from suspend - G94 /
 GeForce 9600 GT, 10de:0622
Date: Wed, 23 Apr 2014 22:27:50 +0000
Message-ID: <bug-77599-8800-Ud7twXBhSO@http.bugs.freedesktop.org/>
References: <bug-77599-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0459795388=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77599-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0459795388==
Content-Type: multipart/alternative; boundary="1398292070.8aCeeA1.28971"; charset="us-ascii"


--1398292070.8aCeeA1.28971
Date: Wed, 23 Apr 2014 22:27:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77599

Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|medium                      |high

--- Comment #1 from Adam Williamson <awilliam-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> ---
Hum, so actually, this seems fairly reproducible - I'll try and nail down
precisely when it started, but likely between 3.14 and 3.15.

I tried a suspend and almost immediate resume very soon after booting, and that
didn't cause it, but each time I've suspended 'normally' (after the system's
been running for a while) and waited for some time before resuming, video has
failed on resume.

I grabbed drm.debug=15 logs the last time, attaching those. This seems like a
fairly significant regression somewhere.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398292070.8aCeeA1.28971
Date: Wed, 23 Apr 2014 22:27:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:awilliam&#64;redhat.com" title="Adam Williamson &lt;awilliam&#64;redhat.com&gt;"> <span class="fn">Adam Williamson</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77599">bug 77599</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Priority</td>
           <td>medium
           </td>
           <td>high
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77599#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Video failed on resume from suspend - G94 / GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77599">bug 77599</a>
              from <span class="vcard"><a class="email" href="mailto:awilliam&#64;redhat.com" title="Adam Williamson &lt;awilliam&#64;redhat.com&gt;"> <span class="fn">Adam Williamson</span></a>
</span></b>
        <pre>Hum, so actually, this seems fairly reproducible - I'll try and nail down
precisely when it started, but likely between 3.14 and 3.15.

I tried a suspend and almost immediate resume very soon after booting, and that
didn't cause it, but each time I've suspended 'normally' (after the system's
been running for a while) and waited for some time before resuming, video has
failed on resume.

I grabbed drm.debug=15 logs the last time, attaching those. This seems like a
fairly significant regression somewhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398292070.8aCeeA1.28971--

--===============0459795388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0459795388==--
