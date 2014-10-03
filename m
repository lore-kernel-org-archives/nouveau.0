From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84203] [NVC1] HDMI gives no more signal since 3.15
	(optimus)
Date: Fri, 03 Oct 2014 18:33:02 +0000
Message-ID: <bug-84203-8800-YA3wTk4aPA@http.bugs.freedesktop.org/>
References: <bug-84203-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0356928447=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84203-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0356928447==
Content-Type: multipart/alternative; boundary="1412361182.45fd71.16870"; charset="UTF-8"


--1412361182.45fd71.16870
Date: Fri, 3 Oct 2014 18:33:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84203

Jean-Louis Dupond <jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Jean-Louis Dupond <jean-louis-h84OYfGOAs2zQB+pC5nmwQ@public.gmane.org> ---
Seems like Ben fixed this issue:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.17&id=6fbb702e27d78ad2458df048b58cca3454bc0965

Used that commit on my kernel, and it fixes the issue!
Great! Thx!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412361182.45fd71.16870
Date: Fri, 3 Oct 2014 18:33:02 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:jean-louis&#64;dupond.be" title="Jean-Louis Dupond &lt;jean-louis&#64;dupond.be&gt;"> <span class="fn">Jean-Louis Dupond</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] HDMI gives no more signal since 3.15 (optimus)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84203">bug 84203</a>
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
   title="RESOLVED FIXED - [NVC1] HDMI gives no more signal since 3.15 (optimus)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84203#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [NVC1] HDMI gives no more signal since 3.15 (optimus)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84203">bug 84203</a>
              from <span class="vcard"><a class="email" href="mailto:jean-louis&#64;dupond.be" title="Jean-Louis Dupond &lt;jean-louis&#64;dupond.be&gt;"> <span class="fn">Jean-Louis Dupond</span></a>
</span></b>
        <pre>Seems like Ben fixed this issue:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.17&amp;id=6fbb702e27d78ad2458df048b58cca3454bc0965">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=linux-3.17&amp;id=6fbb702e27d78ad2458df048b58cca3454bc0965</a>

Used that commit on my kernel, and it fixes the issue!
Great! Thx!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412361182.45fd71.16870--

--===============0356928447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0356928447==--
