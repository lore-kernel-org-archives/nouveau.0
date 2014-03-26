From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75620] [NVAA] nouveau: tearing regression
Date: Wed, 26 Mar 2014 22:05:34 +0000
Message-ID: <bug-75620-8800-NDcUshzFO4@http.bugs.freedesktop.org/>
References: <bug-75620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1743099600=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1743099600==
Content-Type: multipart/alternative; boundary="1395871534.aBAE31.14836"; charset="us-ascii"


--1395871534.aBAE31.14836
Date: Wed, 26 Mar 2014 22:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75620

Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #1 from Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org> ---
This "regression" is related to vblanking.
I just had to enable GLXVBlank in xorg configuration.
It seems vblanking was enabled before that given change (unintentionally?).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395871534.aBAE31.14836
Date: Wed, 26 Mar 2014 22:05:34 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:alexanders83&#64;web.de" title="Alexander Stein &lt;alexanders83&#64;web.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVAA] nouveau: tearing regression"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75620">bug 75620</a>
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
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVAA] nouveau: tearing regression"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75620#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - [NVAA] nouveau: tearing regression"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75620">bug 75620</a>
              from <span class="vcard"><a class="email" href="mailto:alexanders83&#64;web.de" title="Alexander Stein &lt;alexanders83&#64;web.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span></b>
        <pre>This &quot;regression&quot; is related to vblanking.
I just had to enable GLXVBlank in xorg configuration.
It seems vblanking was enabled before that given change (unintentionally?).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395871534.aBAE31.14836--

--===============1743099600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1743099600==--
