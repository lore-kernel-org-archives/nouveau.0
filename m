From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51477] bad/missing graphics with NV11 / GeForce
	2MX/MX400
Date: Fri, 01 Feb 2013 17:06:30 +0000
Message-ID: <bug-51477-8800-fPwYeng8w0@http.bugs.freedesktop.org/>
References: <bug-51477-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0604420341=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-51477-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0604420341==
Content-Type: multipart/alternative; boundary="1359738390.eE6Bc4B2.30304"; charset="us-ascii"


--1359738390.eE6Bc4B2.30304
Date: Fri, 1 Feb 2013 17:06:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=51477

Matthias Dienstbier <matthias_dienstbier-LWAfsSFWpa4@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |matthias_dienstbier@yahoo.d
                   |                            |e

--- Comment #14 from Matthias Dienstbier <matthias_dienstbier-LWAfsSFWpa4@public.gmane.org> ---
This bug gets much more intense if RGB subpixel hinting is enabled but it
rarely appears if only grayscale antialiasing is used. Disabling the
acceleration makes it completely disappear.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359738390.eE6Bc4B2.30304
Date: Fri, 1 Feb 2013 17:06:30 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:matthias_dienstbier&#64;yahoo.de" title="Matthias Dienstbier &lt;matthias_dienstbier&#64;yahoo.de&gt;"> <span class="fn">Matthias Dienstbier</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>matthias_dienstbier&#64;yahoo.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - bad/missing graphics with NV11 / GeForce 2MX/MX400"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=51477">bug 51477</a>
              from <span class="vcard"><a class="email" href="mailto:matthias_dienstbier&#64;yahoo.de" title="Matthias Dienstbier &lt;matthias_dienstbier&#64;yahoo.de&gt;"> <span class="fn">Matthias Dienstbier</span></a>
</span></b>
        <pre>This bug gets much more intense if RGB subpixel hinting is enabled but it
rarely appears if only grayscale antialiasing is used. Disabling the
acceleration makes it completely disappear.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359738390.eE6Bc4B2.30304--

--===============0604420341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0604420341==--
